# STATUS

## What was built

A beginner manual and static HTML site for using AI in writing and publishing, education only, produced by Asdale Dynamics, LLC.

Files:
- `LICENSE` — MIT License, copyright line exactly `Copyright (c) 2026 Asdale Dynamics, LLC`
- `README.md` — project overview, credits Asdale Dynamics, LLC
- `docs/` — beginner manual in plain English, step by step:
  - `00-welcome.md` — welcome and how to use the guide
  - `01-free-models.md` — free AI models, web chatbots and local models
  - `02-privacy-safety.md` — privacy rules, never paste unpublished manuscripts
  - `03-drafting.md` — brainstorming, outlining, beating the blank page
  - `04-editing.md` — repeats, sentence tightening, dialogue polish
  - `05-blurbs.md` — back-cover copy and Amazon descriptions
  - `06-series-tracking.md` — series bible, characters, timelines, world rules
- `docs/worksheets/` — printable fill-in worksheets (blurb planning, series bible template, editing checklist, drafting brainstorm)
- `site/` — static HTML version of the manual (9 pages, one shared CSS file, no build step, works offline)

## How to run it

- Manual: read the Markdown files in `docs/` in order, or print them.
- Worksheets: print the Markdown files in `docs/worksheets/` and fill in by hand.
- Static site: open `site/index.html` in any web browser. No server, no build step, no internet required once the files are on your machine.

## Verification results

- All internal links across the 9 HTML pages verified valid (custom link check, assets, markdown worksheets, LICENSE).
- Each chapter page links correctly to the home page, other chapters, worksheets, and LICENSE.
- Print styles included (`@media print`) for worksheets and chapters.
- Repository contains no secrets, API keys, or personal data (scan found only a fictional "town secret" in a made-up example).
- Git initialized and committed as existing identity (Dylan Asdale / dylanasdale@users.noreply.github.com), plain commit message, no Co-authored-by trailers. Not pushed, no remote created.

## Known gaps

- No automated test suite or linter was configured (static HTML/Markdown project with no build step; verification was a manual link check).
- Worksheets are Markdown source files; rendering quality depends on the printer/browser used to print them.
- The guide names no specific AI companies or tools (kept vendor-neutral); readers must choose their own free service or local model.
- No medical, legal, or publishing advice is given; the guide states it is education only.

## Attribution

Copyright (c) 2026 Asdale Dynamics, LLC. Credit Asdale Dynamics, LLC.
