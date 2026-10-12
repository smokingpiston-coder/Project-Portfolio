#!/usr/bin/env python3
"""
Portfolio site generator.

Reads every README.md in this repository and turns the repo into a static
website: a home page, one page per project folder, a navigation sidebar,
a search index and a "Portfolio status" page that helps you keep the repo
tidy (missing READMEs, broken links, last update per project).

Usage:
    pip install -r website/requirements.txt
    python website/build.py            # builds into ./_site
    python website/build.py --serve    # builds, then serves on http://localhost:8000

The site is deployed to GitHub Pages by .github/workflows/pages.yml on every
push to main, so normally you only edit READMEs and push.
"""
from __future__ import annotations

import argparse
import datetime as dt
import difflib
import html
import json
import os
import posixpath
import re
import shutil
import subprocess
import sys
import tomllib
import urllib.parse
from dataclasses import dataclass, field
from pathlib import Path

import markdown
from jinja2 import Environment, FileSystemLoader, select_autoescape
from markdown.extensions import Extension
from markdown.treeprocessors import Treeprocessor

HERE = Path(__file__).resolve().parent
REPO = HERE.parent
CONFIG = tomllib.loads((HERE / "portfolio.toml").read_text(encoding="utf-8"))

IGNORED_DIRS = {".git", ".github", "website", "_site", "node_modules", "__pycache__"}
IMAGE_EXT = {".png", ".jpg", ".jpeg", ".gif", ".svg", ".webp"}
COPY_EXT = IMAGE_EXT | {".pdf"}  # files copied into the site; everything else links to GitHub

FILE_KINDS = {
    "Report": {".pdf"},
    "MATLAB": {".m", ".mat"},
    "Simulink": {".slx", ".mdl"},
    "CAD": {".catpart", ".catproduct", ".prt", ".stp", ".step", ".stl", ".igs"},
    "Image": IMAGE_EXT | {".heic"},
    "Data": {".csv", ".xlsx", ".txt", ".log", ".rd5"},
    "Code": {".py", ".cmd", ".scad"},
}


def kind_of(path: Path) -> str:
    ext = path.suffix.lower()
    for kind, exts in FILE_KINDS.items():
        if ext in exts:
            return kind
    return "Other"


def slugify(text: str) -> str:
    text = text.strip().lower()
    text = re.sub(r"[^a-z0-9]+", "-", text)
    return text.strip("-") or "item"


def norm(text: str) -> str:
    return re.sub(r"[^a-z0-9]", "", text.lower())


def human_size(n: int) -> str:
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024 or unit == "GB":
            return f"{n:.0f} {unit}" if unit == "B" else f"{n:.1f} {unit}"
        n /= 1024
    return f"{n} B"


# --------------------------------------------------------------------------
# Repository model
# --------------------------------------------------------------------------
@dataclass
class Project:
    rel: Path                      # folder path relative to repo root
    title: str = ""
    summary: str = ""
    meta: dict = field(default_factory=dict)   # Course, Tools, Authors ...
    tools: list = field(default_factory=list)
    body_md: str = ""
    has_readme: bool = True
    parent: "Project | None" = None
    children: list = field(default_factory=list)
    files: list = field(default_factory=list)  # direct files (Path, rel)
    images: list = field(default_factory=list)
    last_updated: str = ""
    category: str = ""

    @property
    def slug(self) -> str:
        return "/".join(slugify(p) for p in self.rel.parts)

    @property
    def is_asset_folder(self) -> bool:
        """Plain image folders are reached from their project page, not the sidebar."""
        return self.rel.name.strip().lower() in {"images", "image", "img", "figures"}

    @property
    def short(self) -> str:
        """Label for navigation: top-level projects drop their subtitle."""
        if self.parent is None and " – " in self.title:
            return self.title.split(" – ")[0]
        return self.title.replace(" – ", ": ")

    @property
    def url(self) -> str:
        return f"projects/{self.slug}/"

    @property
    def depth(self) -> int:
        return len(self.rel.parts)

    @property
    def top(self) -> "Project":
        p = self
        while p.parent is not None:
            p = p.parent
        return p

    def walk(self):
        yield self
        for c in self.children:
            yield from c.walk()


META_RE = re.compile(r"^\*\*([^*:]{2,40}):\*\*\s*(.+?)\s*$")
TABLE_META_RE = re.compile(r"^\|\s*\*\*([^*|]{2,40})\*\*\s*\|\s*(.+?)\s*\|\s*$")


def strip_md(text: str) -> str:
    text = re.sub(r"!\[[^\]]*\]\([^)]*\)", "", text)
    text = re.sub(r"\[([^\]]+)\]\([^)]*\)", r"\1", text)
    text = re.sub(r"[*_`>#]", "", text)
    return re.sub(r"\s+", " ", text).strip()


def parse_readme(text: str, fallback_title: str):
    lines = text.splitlines()
    title = fallback_title
    meta: dict[str, str] = {}
    body_start = 0
    for i, line in enumerate(lines):
        if line.startswith("# "):
            title = line[2:].strip()
            body_start = i + 1
            break
    # meta lines live between the title and the first "---" or "## ";
    # they move into the fact sheet, so drop them from the body
    meta_idx = set()
    for i in range(body_start, len(lines)):
        line = lines[i]
        if line.startswith("## ") or line.strip() == "---":
            break
        m = META_RE.match(line.strip()) or TABLE_META_RE.match(line.strip())
        if m:
            meta[m.group(1).strip()] = strip_md(m.group(2))
            meta_idx.add(i)
    if meta_idx:
        # also drop the "| | |" + "|---|---|" header of a two-column meta table
        for i in list(meta_idx):
            for j in (i - 1, i - 2):
                if j >= body_start and re.fullmatch(r"\|[\s|:-]*\|", lines[j].strip()):
                    meta_idx.add(j)
        lines = [l for i, l in enumerate(lines) if i not in meta_idx]
    # summary: first real paragraph after "## Overview", else first paragraph
    summary = ""
    blocks = re.split(r"\n\s*\n", "\n".join(lines[body_start:]))
    ov = [i for i, b in enumerate(blocks) if re.match(r"^##\s+Overview", b.strip(), re.I)]
    order = blocks[ov[0]:] if ov else blocks
    for b in order:
        s = b.strip()
        if not s or s.startswith(("#", "|", "!", "---", ">", "```", "-", "*", "📄", "🖼", "🎥")):
            # an "## Overview" heading may share its block with the paragraph
            if s.startswith("##") and "\n" in s:
                s = s.split("\n", 1)[1].strip()
                if s and not s.startswith(("|", "-", "*", "!")):
                    summary = strip_md(s)
                    break
            continue
        if META_RE.match(s.splitlines()[0]):
            continue
        summary = strip_md(s)
        break
    if len(summary) > 260:
        summary = summary[:257].rsplit(" ", 1)[0] + "…"
    tools = []
    for key in ("Tools", "Software"):
        if key in meta:
            tools = [t.strip() for t in re.split(r",|·|;|\(incl[^)]*\)", meta[key]) if t.strip()]
            break
    return title, summary, meta, tools, "\n".join(lines[body_start:])


def git_last_updated(rel: Path) -> str:
    try:
        out = subprocess.run(
            ["git", "-C", str(REPO), "log", "-1", "--format=%cs", "--", str(rel)],
            capture_output=True, text=True, timeout=30,
        ).stdout.strip()
        return out
    except Exception:
        return ""


def scan_repo() -> list[Project]:
    """Every folder that contains a README.md becomes a page. Folders without a
    README but with content still appear (flagged on the status page)."""
    def build(rel: Path, parent: Project | None) -> Project | None:
        absdir = REPO / rel
        readme = absdir / "README.md"
        subdirs = sorted(
            d for d in absdir.iterdir()
            if d.is_dir() and d.name not in IGNORED_DIRS and not d.name.startswith(".")
        )
        files = sorted(f for f in absdir.iterdir() if f.is_file() and f.name != "README.md")
        proj = Project(rel=rel, parent=parent)
        if readme.exists():
            title, summary, meta, tools, body = parse_readme(
                readme.read_text(encoding="utf-8", errors="replace"), rel.name.strip().replace("_", " ")
            )
            proj.title, proj.summary, proj.meta, proj.tools, proj.body_md = title, summary, meta, tools, body
        else:
            proj.has_readme = False
            proj.title = rel.name.strip().replace("_", " ").replace("-", " ")
        proj.files = [f.relative_to(REPO) for f in files]
        proj.images = [f for f in proj.files if f.suffix.lower() in IMAGE_EXT]
        for d in subdirs:
            child = build(d.relative_to(REPO), proj)
            if child is not None:
                proj.children.append(child)
        if not proj.has_readme and not proj.files and not proj.children:
            return None
        # a wrapper folder holding only one documented project: show that project directly
        if not proj.has_readme and not proj.files and len(proj.children) == 1 and proj.children[0].has_readme:
            only = proj.children[0]
            only.parent = parent
            return only
        proj.last_updated = git_last_updated(rel)
        return proj

    tops = []
    for d in sorted(REPO.iterdir()):
        if d.is_dir() and d.name not in IGNORED_DIRS and not d.name.startswith((".", "_")):
            p = build(d.relative_to(REPO), None)
            if p:
                tops.append(p)
    return tops


# --------------------------------------------------------------------------
# Root README → home page sections
# --------------------------------------------------------------------------
def split_sections(text: str) -> dict[str, str]:
    """Split the root README on '## ' headings (emoji stripped from keys)."""
    parts = re.split(r"^## +(.+)$", text, flags=re.M)
    out = {"_intro": parts[0]}
    for i in range(1, len(parts), 2):
        key = re.sub(r"[^\w\s']", "", parts[i]).strip().lower()
        out[key] = parts[i + 1]
    return out


def match_top_project(name: str, tops: list[Project]) -> Project | None:
    target = norm(name)
    best, score = None, 0.0
    for p in tops:
        for cand in (p.rel.name, p.rel.parts[0], p.title):
            s = difflib.SequenceMatcher(None, target, norm(cand)).ratio()
            if norm(cand).startswith(target) or target in norm(cand):
                s = max(s, 0.9)
            if s > score:
                best, score = p, s
    return best if score >= 0.5 else None


def parse_categories(section: str, tops: list[Project]) -> list[dict]:
    """Read '### Category' tables from the 'All Projects' section of the root README."""
    cats = []
    for chunk in re.split(r"^### +", section, flags=re.M)[1:]:
        name, _, rest = chunk.partition("\n")
        items = []
        for row in rest.splitlines():
            m = re.match(r"^\|\s*\[([^\]]+)\]\(([^)]*)\)\s*\|\s*(.+?)\s*\|\s*(.+?)\s*\|", row)
            if not m:
                continue
            proj = match_top_project(m.group(2), tops) or match_top_project(m.group(1), tops)
            if proj:
                items.append({"project": proj, "name": m.group(1), "summary": strip_md(m.group(3)),
                              "tools": [t.strip() for t in m.group(4).split(",")]})
        if items:
            cats.append({"name": name.strip(), "items": items})
    return cats


# --------------------------------------------------------------------------
# Markdown rendering with link rewriting
# --------------------------------------------------------------------------
class LinkResolver:
    """Turns relative links inside READMEs into working site or GitHub links,
    and records anything it cannot find so the status page can report it."""

    def __init__(self, projects_by_dir: dict[Path, Project], all_files: list[Path]):
        self.projects_by_dir = projects_by_dir
        self.all_files = all_files
        self.by_name: dict[str, list[Path]] = {}
        for f in all_files:
            self.by_name.setdefault(f.name.lower(), []).append(f)
        self.issues: list[dict] = []
        self.copied: set[Path] = set()

    def github_url(self, rel: Path, is_dir=False) -> str:
        kind = "tree" if is_dir else "blob"
        path = "/".join(urllib.parse.quote(p) for p in rel.parts)
        return f"{CONFIG['github']['repo_url'].rstrip('/')}/{kind}/{CONFIG['github']['branch']}/{path}"

    @staticmethod
    def safe_parts(rel: Path) -> list[str]:
        """Web-safe copy path: no spaces (a folder name here even ends in one)."""
        return [re.sub(r"\s+", "-", p.strip()) for p in rel.parts]

    def asset_url(self, rel: Path) -> str:
        self.copied.add(rel)
        return "files/" + "/".join(urllib.parse.quote(p) for p in self.safe_parts(rel))

    def _guess(self, base: Path, target: str) -> tuple[Path | None, str]:
        """Find the file a broken link most likely meant."""
        name = Path(target).name
        top = base.parts[0] if base.parts else ""
        cands = [c for c in self.by_name.get(name.lower(), []) if not top or c.parts[0] == top]
        if len(cands) >= 1:
            return cands[0], "same file name elsewhere in the project"
        # a short name such as "Report" that matches one file in the same folder
        key = norm(Path(target.rstrip("/")).stem)
        if len(key) >= 4:
            local = [f for f in self.all_files if f.parent == base and key in norm(f.stem)]
            if len(local) == 1:
                return local[0], "only file in the folder with that name"
        # directory: fuzzy match among folders under the same top-level project
        dirs = {p for p in self.projects_by_dir if p.parts and p.parts[0] == top}
        target_n = norm(Path(target.rstrip("/")).name)
        best, score = None, 0.0
        for d in dirs:
            s = difflib.SequenceMatcher(None, target_n, norm(d.name)).ratio()
            if s > score:
                best, score = d, s
        if best is not None and score >= 0.55:
            return best, "closest folder name"
        return None, ""

    def resolve(self, page: Project, href: str, page_root: str, is_img: bool) -> tuple[str, bool]:
        if not href or href.startswith(("#", "http://", "https://", "mailto:", "tel:", "//")):
            return href, True
        raw, _, frag = href.partition("#")
        target = urllib.parse.unquote(raw)
        rel = Path(posixpath.normpath(posixpath.join(page.rel.as_posix(), target)))
        absp = REPO / rel
        note = ""
        if not absp.exists():
            guess, why = self._guess(page.rel, target)
            readme = f"{page.rel.as_posix()}/README.md" if page.rel.parts else "README.md"
            self.issues.append({"page": page, "readme": readme, "link": href,
                                "fixed_to": guess.as_posix() if guess else "", "why": why})
            if guess is None:
                return "", False
            rel, absp, note = guess, REPO / guess, why
        frag = ("#" + frag) if frag else ""
        if absp.is_dir():
            proj = self.projects_by_dir.get(rel)
            if proj and proj.has_readme:
                return page_root + proj.url + frag, True
            return self.github_url(rel, is_dir=True), True
        if absp.suffix.lower() in COPY_EXT:
            return page_root + self.asset_url(rel) + frag, True
        return self.github_url(rel) + frag, True


class _Rewriter(Treeprocessor):
    def __init__(self, md, ctx):
        super().__init__(md)
        self.ctx = ctx

    def run(self, root):
        resolver, page, page_root = self.ctx["resolver"], self.ctx["page"], self.ctx["root"]
        for el in root.iter():
            if el.tag == "a" and el.get("href"):
                url, ok = resolver.resolve(page, el.get("href"), page_root, False)
                if ok:
                    el.set("href", url)
                    if url.startswith("http") and "github.com" in url:
                        el.set("class", (el.get("class", "") + " ext").strip())
                else:
                    el.tag = "span"
                    el.attrib.pop("href", None)
                    el.set("class", "missing-link")
                    el.set("title", "This file is not in the repository yet")
            elif el.tag == "img" and el.get("src"):
                url, ok = resolver.resolve(page, el.get("src"), page_root, True)
                if ok:
                    el.set("src", url)
                    el.set("loading", "lazy")
                else:
                    el.tag = "span"
                    alt = el.get("alt", "image")
                    el.attrib.clear()
                    el.set("class", "missing-image")
                    el.text = f"Image not found: {alt}"
            elif el.tag == "table":
                el.set("class", "md-table")


class RewriteExtension(Extension):
    def __init__(self, ctx):
        super().__init__()
        self.ctx = ctx

    def extendMarkdown(self, md):
        md.treeprocessors.register(_Rewriter(md, self.ctx), "portfolio_links", 1)


def render_md(text: str, page: Project, resolver: LinkResolver, root: str) -> tuple[str, list]:
    ctx = {"resolver": resolver, "page": page, "root": root}
    md = markdown.Markdown(
        extensions=["tables", "fenced_code", "sane_lists", "toc", RewriteExtension(ctx)],
        extension_configs={"toc": {"permalink": False, "toc_depth": "2-3"}},
    )
    out = md.convert(text)
    # wrap tables so they scroll on phones
    out = re.sub(r"(<table[^>]*>)", r'<div class="table-scroll">\1', out).replace("</table>", "</table></div>")
    return out, md.toc_tokens


# --------------------------------------------------------------------------
# Build
# --------------------------------------------------------------------------
def build(out: Path) -> dict:
    tops = scan_repo()
    all_projects = [p for t in tops for p in t.walk()]
    by_dir = {p.rel: p for p in all_projects}
    all_files = [Path(r) for p in all_projects for r in p.files]
    resolver = LinkResolver(by_dir, all_files)

    root_md = (REPO / "README.md").read_text(encoding="utf-8")
    sections = split_sections(root_md)
    categories = parse_categories(sections.get("all projects", ""), tops)
    placed = {i["project"].rel for c in categories for i in c["items"]}
    leftovers = [t for t in tops if t.rel not in placed]
    if leftovers:
        categories.append({"name": "More projects", "items": [
            {"project": t, "name": t.title, "summary": t.summary, "tools": t.tools} for t in leftovers]})
    for c in categories:
        for i in c["items"]:
            for p in i["project"].walk():
                p.category = c["name"]
    # navigation order follows the README categories
    nav_order = [i["project"] for c in categories for i in c["items"]]

    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)

    env = Environment(loader=FileSystemLoader(HERE / "templates"), autoescape=select_autoescape(["html"]))
    env.filters["date"] = lambda s: dt.date.fromisoformat(s).strftime("%d %b %Y") if s else "—"
    built_at = dt.datetime.now(dt.timezone.utc)
    common = {
        "site": CONFIG["site"], "person": CONFIG["person"], "github": CONFIG["github"],
        "categories": categories, "nav": nav_order, "built_at": built_at.strftime("%d %b %Y, %H:%M UTC"),
        "year": built_at.year,
    }

    def page_root(p: Project | None) -> str:
        if p is None:
            return ""
        return "../" * (1 + len(p.slug.split("/")))

    # ---- home page --------------------------------------------------------
    home_proxy = Project(rel=Path("."))
    def md_section(key):
        txt = sections.get(key, "")
        txt = re.sub(r"\n---\s*$", "", txt.strip())
        return render_md(txt, home_proxy, resolver, "")[0] if txt else ""

    intro_lines = [l for l in sections["_intro"].splitlines() if l.strip() and not l.startswith("#")]
    tagline = strip_md(intro_lines[0]) if intro_lines else ""
    intro_paras = [strip_md(l) for l in intro_lines[1:] if not l.startswith("---")]

    highlights = []
    for row in sections.get("highlights", "").splitlines():
        m = re.match(r"^\|\s*(\S*)\s*\|\s*\*\*\[([^\]]+)\]\(([^)]*)\)\*\*\s*(.*?)\|\s*(.+?)\s*\|\s*$", row)
        if m:
            proj = match_top_project(m.group(3), tops) or match_top_project(m.group(2), tops)
            highlights.append({"name": m.group(2), "note": strip_md(m.group(4)),
                               "text": render_md(m.group(5), home_proxy, resolver, "")[0]
                                   .removeprefix("<p>").removesuffix("</p>"),
                               "project": proj})
    skills = []
    for row in sections.get("technical skills", "").splitlines():
        m = re.match(r"^\|\s*\*\*(.+?)\*\*\s*\|\s*(.+?)\s*\|\s*$", row)
        if m:
            skills.append({"area": m.group(1), "items": [s.strip() for s in m.group(2).split("·")]})
    contact_md = sections.get("contact", "")
    links = dict(CONFIG.get("links", {}))
    if not links.get("email"):
        m = re.search(r"Email:\**\s*\*?([\w.+-]+@[\w.-]+)", contact_md)
        links["email"] = m.group(1) if m else ""
    if not links.get("linkedin"):
        m = re.search(r"(?:https?://)?(www\.linkedin\.com/in/[\w-]+)", contact_md)
        links["linkedin"] = f"https://{m.group(1)}" if m else ""
    open_to = strip_md(contact_md.strip().split("\n\n")[0]) if contact_md.strip() else ""

    total_files = sum(len(p.files) for p in all_projects)
    stats = {
        "projects": len(tops),
        "reports": sum(1 for f in all_files if f.suffix.lower() == ".pdf"),
        "models": sum(1 for f in all_files if kind_of(f) in ("MATLAB", "Simulink", "CAD")),
        "files": total_files,
    }
    (out / "index.html").write_text(env.get_template("home.html").render(
        **common, root="", active=None, tagline=tagline, intro=intro_paras, highlights=highlights,
        skills=skills, links=links, open_to=open_to, stats=stats, title=CONFIG["site"]["title"],
    ), encoding="utf-8")

    # ---- project pages ----------------------------------------------------
    search = []
    for idx, top in enumerate(nav_order):
        for p in top.walk():
            root = page_root(p)
            body_html, toc = (render_md(p.body_md, p, resolver, root) if p.has_readme else ("", []))
            # files table
            files = []
            referenced = set(re.findall(r'(?:href|src)="([^"]+)"', body_html))
            for f in p.files:
                absf = REPO / f
                if f.suffix.lower() in COPY_EXT:
                    url = root + resolver.asset_url(f)
                else:
                    url = resolver.github_url(f)
                files.append({"name": f.name, "kind": kind_of(f), "size": human_size(absf.stat().st_size),
                              "url": url, "external": url.startswith("http")})
            unref_images = [
                {"url": root + resolver.asset_url(f), "name": f.stem.replace("_", " ")}
                for f in p.images if (root + resolver.asset_url(f)) not in referenced
            ]
            crumbs = []
            q = p.parent
            while q is not None:
                crumbs.insert(0, q)
                q = q.parent
            prev_p = nav_order[idx - 1] if p.parent is None and idx > 0 else None
            next_p = nav_order[idx + 1] if p.parent is None and idx + 1 < len(nav_order) else None
            meta_rows = [(k, v) for k, v in p.meta.items() if k.lower() not in ("tools", "software")]
            dest = out / "projects" / p.slug
            dest.mkdir(parents=True, exist_ok=True)
            (dest / "index.html").write_text(env.get_template("project.html").render(
                **common, root=root, p=p, active=p.top, body=body_html, toc=toc, files=files,
                gallery=unref_images, crumbs=crumbs, prev=prev_p, next=next_p, meta=meta_rows,
                title=f"{p.title} – {CONFIG['person']['name']}",
                github_folder=resolver.github_url(p.rel, is_dir=True),
            ), encoding="utf-8")
            text = re.sub(r"<[^>]+>", " ", body_html)
            search.append({"t": p.title, "u": p.url, "c": p.category,
                           "s": p.summary, "k": " ".join(p.tools),
                           "x": html.unescape(re.sub(r"\s+", " ", text))[:4000]})

    (out / "search-index.json").write_text(json.dumps(search, ensure_ascii=False), encoding="utf-8")

    # ---- status page ------------------------------------------------------
    rows = []
    for top in nav_order:
        sub = list(top.walk())
        files = [f for p in sub for f in p.files]
        kinds: dict[str, int] = {}
        for f in files:
            kinds[kind_of(f)] = kinds.get(kind_of(f), 0) + 1
        rows.append({
            "p": top, "pages": sum(1 for p in sub if p.has_readme),
            "missing": [p for p in sub if not p.has_readme],
            "files": len(files), "kinds": kinds,
            "words": sum(len(p.body_md.split()) for p in sub),
            "issues": [i for i in resolver.issues if i["page"].top is top],
            "has_summary": bool(top.summary), "has_tools": bool(top.tools),
            "updated": top.last_updated,
        })
    root_issues = [i for i in resolver.issues if i["page"] is home_proxy]
    (out / "status.html").write_text(env.get_template("status.html").render(
        **common, root="", active="status", rows=rows, root_issues=root_issues, stats=stats,
        title=f"Portfolio status – {CONFIG['person']['name']}",
        issues_total=len(resolver.issues), unfixed=sum(1 for i in resolver.issues if not i["fixed_to"]),
    ), encoding="utf-8")

    # ---- 404 + static assets + copied files -------------------------------
    (out / "404.html").write_text(env.get_template("404.html").render(
        **common, root=CONFIG["site"].get("base_path", "/"), active=None, title="Page not found"), encoding="utf-8")
    shutil.copytree(HERE / "static", out / "static")
    for rel in sorted(resolver.copied):
        dst = out / "files" / Path(*LinkResolver.safe_parts(rel))
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(REPO / rel, dst)
    (out / ".nojekyll").write_text("", encoding="utf-8")

    return {"pages": len(search) + 2, "copied": len(resolver.copied),
            "issues": len(resolver.issues), "unfixed": sum(1 for i in resolver.issues if not i["fixed_to"])}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--out", default=str(REPO / "_site"), help="output folder (default: _site)")
    ap.add_argument("--serve", action="store_true", help="serve the built site on localhost:8000")
    args = ap.parse_args()
    out = Path(args.out).resolve()
    info = build(out)
    print(f"Built {info['pages']} pages into {out}")
    print(f"Copied {info['copied']} images/PDFs. README link problems: {info['issues']} "
          f"({info['unfixed']} could not be auto-fixed) – see status.html")
    if args.serve:
        import functools, http.server
        handler = functools.partial(http.server.SimpleHTTPRequestHandler, directory=str(out))
        print("Serving on http://localhost:8000  (Ctrl+C to stop)")
        http.server.ThreadingHTTPServer(("", 8000), handler).serve_forever()


if __name__ == "__main__":
    sys.exit(main())
