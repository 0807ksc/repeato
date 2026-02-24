#!/usr/bin/env python3
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PDF_PATH = Path.home() / "Downloads" / "중등 수능필수영단어 1800.pdf"
OUT_PATH = ROOT / "app" / "assets" / "data" / "m2_beginner_words.json"
SWIFT_SCRIPT = ROOT / "scripts" / "extract_pdf_text.swift"

if not PDF_PATH.exists():
    raise SystemExit(f"pdf not found: {PDF_PATH}")

cmd = [
    "bash",
    "-lc",
    f"mkdir -p /tmp/swift-module-cache && "
    f"SWIFT_MODULECACHE_PATH=/tmp/swift-module-cache "
    f"CLANG_MODULE_CACHE_PATH=/tmp/swift-module-cache "
    f"swift -module-cache-path /tmp/swift-module-cache {SWIFT_SCRIPT} '{PDF_PATH}'",
]
proc = subprocess.run(cmd, capture_output=True, text=True, check=True)
text = proc.stdout

pages = re.split(r"===PAGE:(\d+)===\n", text)
# split result: [prefix, page_num, text, page_num, text, ...]
page_text = {}
for i in range(1, len(pages), 2):
    page_num = int(pages[i])
    page_text[page_num] = pages[i + 1]

entries = []
# Use first two definition pages (1 and 3) as middle2 beginner starter set.
for p in [1, 3]:
    block = page_text.get(p, "")
    block = re.sub(r"\s+", " ", block).strip()
    # Remove trailing footer
    block = re.sub(r"중등\s*필수\s*영단어\s*\d+", "", block).strip()
    pattern = re.compile(r"(\d+)\s+([A-Za-z][A-Za-z'\-]*)\s+(.+?)(?=\s+\d+\s+[A-Za-z]|$)")
    for m in pattern.finditer(block):
        idx = int(m.group(1))
        word = m.group(2).strip().lower()
        meaning = m.group(3).strip(" ,")
        # Filter noisy non-word extraction cases
        if len(word) < 2:
            continue
        entries.append({
            "id": len(entries) + 1,
            "source_page": p,
            "source_index": idx,
            "word": word,
            "meaning_ko": meaning,
            "example_en": f"I use {word} in a simple sentence.",
            "example_ko": f"나는 {word}를 간단한 문장에서 사용해.",
            "level": "m2_beginner",
            "category": "travel" if len(entries) % 3 == 0 else "daily"
        })

# Deduplicate by word, keep first appearance.
seen = set()
unique = []
for e in entries:
    if e["word"] in seen:
        continue
    seen.add(e["word"])
    unique.append(e)

OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
OUT_PATH.write_text(json.dumps(unique, ensure_ascii=False, indent=2), encoding="utf-8")

print(f"wrote {len(unique)} words -> {OUT_PATH}")
