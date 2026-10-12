# Portfolio website

This folder turns the repository into a website, hosted free on **Netlify**.
GitHub only stores the files; Netlify builds and serves the site.

A Python script (`build.py`) reads every `README.md` in the repo and builds:

- **Overview page** – name, intro, selected work, all projects, skills and contact, taken from the root `README.md`.
- **A page for every project folder** – the README, a fact sheet (course, authors, tools), sub-projects, figures and a file list. Reports and images open on the site; models, scripts and CAD files link to GitHub.
- **Sidebar navigation and search** – grouped by the categories in the root README's *All Projects* tables. Press `/` to search.
- **Portfolio status page** – which projects are ready, which folders have no README, and which README links point to files that don't exist. Check it before sending the link with a CV or cover letter.

## One-time setup on Netlify (about 5 minutes)
1. Sign up free at https://app.netlify.com/signup and choose **Sign up with GitHub**.
2. **Add new site → Import an existing project → GitHub**, and pick `Project-Portfolio`.
3. Netlify reads `netlify.toml` from the repo, so the build settings are already filled in. Click **Deploy**.
4. In **Site configuration → Change site name**, pick an address such as `ramkumar-portfolio` → `https://ramkumar-portfolio.netlify.app`.
5. Put that address in `url` in `website/portfolio.toml`.

## How it updates
Edit or add READMEs on GitHub and commit to `main`. Netlify rebuilds and publishes in about a minute. Its **Deploys** tab shows each build and lets you roll back to an earlier version in one click.

- **New project:** add a folder with a `README.md`, starting with a `# Title`, then lines like `**Course:**`, `**Authors:**` and `**Tools:**`, and an `## Overview` section. Then add it to a table under *All Projects* in the root README so it lands in the right category.
- **Highlights on the overview page:** edit the *Highlights* table in the root README.
- **Name, links, site address:** `website/portfolio.toml`.
- **Look and feel:** `website/static/style.css` and the templates in `website/templates/`.

## Build on your own computer
```bash
pip install -r website/requirements.txt
python website/build.py --serve      # then open http://localhost:8000
```

## Moving to another free host
The output in `_site/` is plain HTML, so any static host works with the same two settings:

| Host | Build command | Output folder |
|------|---------------|---------------|
| Cloudflare Pages | `pip install -r website/requirements.txt && python website/build.py --out _site` | `_site` |
| Render (Static Site) | same | `_site` |
| GitHub Pages | same, run from a GitHub Actions workflow; set `base_path = "/Project-Portfolio/"` | `_site` |

## Linking from a CV or cover letter
Every project has a stable address under your site, for example:

- Thesis: `/projects/master-thesis/modeling-and-implementation-of-rack-electric-power-assisted-steering-system-for-driving-simulator/`
- Timber truck: `/projects/automotive-project/dynamic-load-of-timber-truck/`
- Hybrid Porsche Panamera: `/projects/electric-and-hybrid-vehicles/`

Page addresses come from folder names, so renaming a folder changes its link.
