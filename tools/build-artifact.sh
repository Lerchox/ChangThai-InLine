#!/bin/sh
# Erzeugt eine Testversion für die Claude-Vorschau (Google-Schriften statt eigener Dateien, ohne Seitengerüst).
set -e
cd "$(dirname "$0")/.."
OUT=${1:-dist-artifact}
mkdir -p "$OUT"
sed -e '/^<!doctype html>/d' -e '/^<html/d' -e '/^<\/html>/d' -e '/^<head>/d' -e '/^<\/head>/d' -e '/^<body>/d' -e '/^<\/body>/d' \
    -e '/<meta charset/d' -e '/<meta name="viewport"/d' -e '/rel="manifest"/d' \
    -e 's#<link rel="stylesheet" href="fonts/fonts.css">#<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700\&family=Bricolage+Grotesque:wght@600;800\&display=swap">#' \
    index.html > "$OUT/index.html"
