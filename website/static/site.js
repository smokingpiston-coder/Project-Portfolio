(() => {
  const root = document.body.dataset.root || "";

  /* ---- mobile drawer ---- */
  const btn = document.querySelector(".menu-btn");
  const scrim = document.querySelector(".scrim");
  const sidebar = document.getElementById("sidebar");
  const setOpen = (open) => {
    document.body.classList.toggle("nav-open", open);
    btn && btn.setAttribute("aria-expanded", String(open));
    if (scrim) scrim.hidden = !open;
    if (open) {
      const cur = sidebar.querySelector('[aria-current="page"]') || sidebar.querySelector("a");
      cur && cur.focus({ preventScroll: false });
    }
  };
  btn && btn.addEventListener("click", () => setOpen(!document.body.classList.contains("nav-open")));
  scrim && scrim.addEventListener("click", () => { setOpen(false); btn.focus(); });
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && document.body.classList.contains("nav-open")) { setOpen(false); btn.focus(); }
  });

  /* keep the current page visible in a long sidebar */
  const current = sidebar && sidebar.querySelector('a[aria-current="page"]');
  if (current && window.matchMedia("(min-width: 901px)").matches) {
    const r = current.getBoundingClientRect();
    if (r.bottom > window.innerHeight - 40) sidebar.scrollTop = r.top - window.innerHeight / 3;
  }

  /* ---- search ---- */
  const input = document.getElementById("q");
  const list = document.getElementById("search-results");
  let index = null, active = -1;
  const load = () => index ? Promise.resolve(index) :
    fetch(root + "search-index.json").then(r => r.json()).then(d => (index = d)).catch(() => (index = []));
  const esc = (s) => s.replace(/[&<>"]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
  const mark = (s, terms) => {
    let out = esc(s);
    terms.forEach(t => { if (t.length > 1) out = out.replace(new RegExp("(" + t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + ")", "ig"), "<mark>$1</mark>"); });
    return out;
  };
  const snippet = (text, term) => {
    const i = text.toLowerCase().indexOf(term);
    if (i < 0) return "";
    const start = Math.max(0, i - 50);
    return (start ? "…" : "") + text.slice(start, i + 90).trim() + "…";
  };
  const run = (q) => {
    const terms = q.toLowerCase().split(/\s+/).filter(Boolean);
    if (!terms.length) { list.hidden = true; list.innerHTML = ""; return; }
    const scored = [];
    for (const d of index) {
      const t = d.t.toLowerCase(), k = d.k.toLowerCase(), s = d.s.toLowerCase(), x = d.x.toLowerCase();
      let score = 0, ok = true;
      for (const term of terms) {
        let ts = 0;
        if (t.includes(term)) ts += 10;
        if (k.includes(term)) ts += 6;
        if (s.includes(term)) ts += 4;
        if (x.includes(term)) ts += 1;
        if (!ts) { ok = false; break; }
        score += ts;
      }
      if (ok) scored.push([score, d]);
    }
    scored.sort((a, b) => b[0] - a[0]);
    const top = scored.slice(0, 12);
    active = -1;
    list.innerHTML = top.length ? top.map(([, d]) => {
      const sub = d.s && terms.some(tm => d.s.toLowerCase().includes(tm)) ? d.s : (snippet(d.x, terms[0]) || d.s);
      return `<li><a href="${root}${d.u}"><strong>${mark(d.t, terms)}</strong><small>${mark(sub.slice(0, 160), terms)}</small></a></li>`;
    }).join("") : `<li class="none">No project mentions “${esc(q)}”. Try a tool name such as Simulink or CATIA.</li>`;
    list.hidden = false;
  };
  if (input) {
    input.addEventListener("focus", load, { once: true });
    input.addEventListener("input", () => load().then(() => run(input.value.trim())));
    input.addEventListener("keydown", (e) => {
      const links = [...list.querySelectorAll("a")];
      if (e.key === "ArrowDown" || e.key === "ArrowUp") {
        if (!links.length) return;
        e.preventDefault();
        active = (active + (e.key === "ArrowDown" ? 1 : -1) + links.length) % links.length;
        links.forEach((a, i) => a.setAttribute("aria-selected", String(i === active)));
        links[active].scrollIntoView({ block: "nearest" });
      } else if (e.key === "Enter" && links.length) {
        e.preventDefault();
        location.href = (links[active] || links[0]).href;
      } else if (e.key === "Escape") {
        input.value = ""; run("");
      }
    });
    document.addEventListener("keydown", (e) => {
      if (e.key === "/" && document.activeElement !== input && !/input|textarea/i.test(document.activeElement.tagName)) {
        e.preventDefault();
        if (window.matchMedia("(max-width: 900px)").matches) setOpen(true);
        input.focus();
      }
    });
    document.addEventListener("click", (e) => { if (!e.target.closest(".search")) list.hidden = true; });
  }

  /* ---- on-page contents: highlight the section in view ---- */
  const tocLinks = [...document.querySelectorAll(".toc a")];
  if (tocLinks.length && "IntersectionObserver" in window) {
    const byId = new Map(tocLinks.map(a => [decodeURIComponent(a.hash.slice(1)), a]));
    const io = new IntersectionObserver((entries) => {
      entries.forEach(en => {
        if (en.isIntersecting) {
          tocLinks.forEach(a => a.classList.remove("is-active"));
          const a = byId.get(en.target.id);
          a && a.classList.add("is-active");
        }
      });
    }, { rootMargin: "0px 0px -70% 0px" });
    byId.forEach((_, id) => { const h = document.getElementById(id); h && io.observe(h); });
  }
})();
