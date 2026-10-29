# STATUS

## What was built

A beginner manual and static HTML site for using AI in writing and publishing, education only, produced by Asdale Dynamics, LLC.

Files:
- `LICENSE` — MIT License, copyright line exactly `Copyright (c) 2026 Asdale Dynamics, LLC`
- `README.md` — project overview, credits Asdale Dynamics, LLC, references Dylan Asdale, *The Massive AI Manual*, and dylanasdale.github.io
- `docs/` — beginner manual in plain English, step by step:
  - `00-welcome.md` — welcome and how to use the guide
  - `01-free-models.md` — free AI models, web chatbots and local models
  - `02-privacy-safety.md` — privacy rules, never paste unpublished manuscripts
  - `03-drafting.md` — brainstorming, outlining, beating the blank page
  - `04-editing.md` — repeats, sentence tightening, dialogue polish
  - `05-blurbs.md` — back-cover copy and Amazon descriptions
  - `06-series-tracking.md` — series bible, characters, timelines, world rules
- `docs/worksheets/` — printable fill-in worksheets (Markdown source):
  - blurb-planning-worksheet.md
  - series-bible-template.md
  - editing-checklist.md
  - drafting-brainstorm-worksheet.md
- `site/` — static HTML version of the manual (13 pages, no build step, works offline):
  - `index.html` — home with chapter cards and worksheet links
  - `chapters/00-welcome.html` … `06-series-tracking.html` — one page per chapter
  - `worksheets.html` — worksheet index linking to printable + source versions
  - `worksheets/printable/*.html` — print-ready HTML worksheets with print CSS
  - `css/style.css` — screen styles; `css/print.css` — print styles
- `scripts/verify.sh` — verification script (links, copyright, privacy notice, secrets, worksheets)

## How to run it

- Manual: read the Markdown files in `docs/` in order, or print them.
- Worksheets: print the Markdown files in `docs/worksheets/`, or open the print-ready HTML pages in `site/worksheets/printable/` and use your browser's Print.
- Static site: open `site/index.html` in any web browser. No server, no build step, no internet required once the files are on your machine.
- Verification: run `./scripts/verify.sh` (requires Python 3).

## Verification results

- `./scripts/verify.sh` — PASSED:
  - LICENSE contains exact copyright line `Copyright (c) 2026 Asdale Dynamics, LLC`
  - README credits Asdale Dynamics, LLC
  - All manual chapters (02–06) contain an unpublished-manuscript privacy notice
  - All internal links valid across 13 HTML pages
  - No likely secrets or API keys (only a fictional "town secret" in a made-up blurb example)
  - All 4 worksheets exist as both Markdown source and print-ready HTML
- Print styles included (`@media print`) for worksheets and chapters.
- Repository contains no secrets, API keys, or personal data.
- Git initialized and committed as existing identity (Dylan Asdale / dylanasdale@users.noreply.github.com), plain commit messages, no Co-authored-by trailers. Not pushed, no remote created.

## Known gaps

- No automated test framework or linter configured (static HTML/Markdown project with no build step; verification is the `./scripts/verify.sh` script).
- Worksheet print quality depends on the printer/browser used.
- The guide names no specific AI companies or tools (vendor-neutral); readers choose their own free service or local model.
- No medical, legal, or publishing advice is given; the guide states it is education only.
- The broader LLC roadmap (agents/MCP, local AI, free AI coding, GitHub, automation, KDP, reselling, bookkeeping, life-admin, healthcare aids, FFXIV/chess) is noted as context but not built in this repository.

## Attribution

Copyright (c) 2026 Asdale Dynamics, LLC. Credit Asdale Dynamics, LLC.
