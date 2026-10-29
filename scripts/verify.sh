#!/usr/bin/env bash
# verify.sh — check links, copyright, privacy notice, and secrets for the AI for Authors guide.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

echo "==> Checking LICENSE copyright line"
if grep -qx 'Copyright (c) 2026 Asdale Dynamics, LLC' LICENSE; then
  echo "OK: exact copyright line present in LICENSE"
else
  echo "FAIL: exact copyright line missing from LICENSE"
  FAIL=1
fi

echo "==> Checking README credits Asdale Dynamics, LLC"
if grep -q 'Asdale Dynamics, LLC' README.md; then
  echo "OK: README credits Asdale Dynamics, LLC"
else
  echo "FAIL: README does not credit Asdale Dynamics, LLC"
  FAIL=1
fi

echo "==> Checking privacy notice in manual chapters"
for f in docs/02-privacy-safety.md docs/03-drafting.md docs/04-editing.md docs/05-blurbs.md docs/06-series-tracking.md; do
  if grep -qi "unpublished manuscript" "$f"; then
    echo "OK: $f"
  else
    echo "FAIL: $f missing privacy notice"
    FAIL=1
  fi
done

echo "==> Checking internal HTML links"
python3 - <<'PY'
import re, os, sys
root = "site"
all_files = set()
for dirpath, _, files in os.walk("."):
    for f in files:
        all_files.add(os.path.normpath(os.path.join(dirpath, f)))
html_files = [p for p in all_files if p.endswith(".html") and p.startswith("site/")]
broken = []
for path in html_files:
    with open(path) as fh:
        content = fh.read()
    for m in re.finditer(r'href="([^"]+)"', content):
        href = m.group(1).split("#")[0]
        if href.startswith(("http", "mailto")):
            continue
        target = os.path.normpath(os.path.join(os.path.dirname(path), href))
        if target not in all_files:
            broken.append((path, href, target))
if broken:
    print("BROKEN LINKS:")
    for b in broken:
        print(" ", b)
    sys.exit(1)
print(f"OK: all internal links valid across {len(html_files)} HTML pages")
PY
if [ $? -ne 0 ]; then FAIL=1; fi

echo "==> Checking no likely secrets/keys"
if grep -rniE 'sk-[A-Za-z0-9]{20,}|api[_-]?key["'\'' ]*[:=]["'\'' ]*[A-Za-z0-9]{16,}|secret["'\'' ]*[:=]["'\'' ]*[A-Za-z0-9]{16,}' . --exclude-dir=.git 2>/dev/null | grep -v 'town secret'; then
  echo "FAIL: possible secret or API key found"
  FAIL=1
else
  echo "OK: no likely secrets or API keys"
fi

echo "==> Checking printable worksheets exist"
for w in blurb-planning-worksheet series-bible-template editing-checklist drafting-brainstorm-worksheet; do
  if [ -f "docs/worksheets/${w}.md" ] && [ -f "site/worksheets/printable/${w}.html" ]; then
    echo "OK: $w (md + printable html)"
  else
    echo "FAIL: missing printable worksheet for $w"
    FAIL=1
  fi
done

echo
if [ "$FAIL" -ne 0 ]; then
  echo "VERIFICATION FAILED"
  exit 1
else
  echo "VERIFICATION PASSED"
  exit 0
fi
