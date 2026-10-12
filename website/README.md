# Portfolio website

This folder turns the repository into a website, hosted free on GitHub Pages:
**https://smokingpiston-coder.github.io/Project-Portfolio/**

A Python script (`build.py`) reads every `README.md` in the repo and builds:

- **Overview page** – name, intro, selected work, all projects, skills and contact, taken from the root `README.md`.
- **A page for every project folder** – the README, a fact sheet (course, authors, tools), sub-projects, figures and a file list. Reports and images open on the site; models, scripts and CAD files link to GitHub.
- **Sidebar navigation and search** – grouped by the categories in the root README's *All Projects* tables. Press `/` to search.
- **Portfolio status page** – which projects are ready, which folders have no README, and which README links point to files that don't exist. Check it before sending the link with a CV or cover letter.

## How it updates
Edit or add READMEs and push to `main`. The workflow in `.github/workflows/pages.yml` rebuilds and publishes the site in about a minute.

- **New project:** add a folder with a `README.md`, starting with a `# Title`, then lines like `**Course:**`, `**Authors:**` and `**Tools:**`, and an `## Overview` section. Then add it to a table under *All Projects* in the root README so it lands in the right category.
- **Highlights on the overview page:** edit the *Highlights* table in the root README.
- **Name, links, site address:** `website/portfolio.toml`.

## One-time setup
In the repository on GitHub: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

## Build on your own computer
```bash
pip install -r website/requirements.txt
python website/build.py --serve      # then open http://localhost:8000
```

## Linking from a CV or cover letter
Every project has a stable address, for example:

- Overview: `https://smokingpiston-coder.github.io/Project-Portfolio/`
- Thesis: `.../projects/master-thesis/modeling-and-implementation-of-rack-electric-power-assisted-steering-system-for-driving-simulator/`
- Timber truck: `.../projects/automotive-project/dynamic-load-of-timber-truck/`

Page addresses come from folder names, so renaming a folder changes its link.
