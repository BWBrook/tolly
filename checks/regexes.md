# Regex & CLI Snippets (lint helpers)

These commands support the MUST/SHOULD rules in `checks/style_lint_spec.md`. Use `rg` (ripgrep). Adjust paths as needed.

## Banned Units & Symbols (MUST: SL-UNI-004)
```
rg -n --ignore-case -e "\\b(km|kilometer|kilometre|meters|metres|%|degree[SC])\\b" chapters
```

## Banned Modern Lexis (MUST: SL-BAN-003)
Prefer the maintained list:
```
rg -n --ignore-case -f style/LEXICON/banned_modern.txt chapters
```
Fallback quick check:
```
rg -n --ignore-case -e "\\b(ok|okay|yeah|sorta|vibe|random|deadline)\\b" chapters
```

## Time Phrasing Allowed (presence check)
Ensure at least one allowed anchor appears per chapter front matter or scene:
```
rg -n --ignore-case -e "after harvest|first frost|spring sowing|by sundown|at first light|by bells" chapters
```

## Place/Road Anchor Frequency (heuristic)
```
rg -n --ignore-case -e "\\b(Road|Bridge|Gate|Downs|Hills|Greenway|Water|Brandywine|Baranduin)\\b" chapters
```

## Song Quota (MUST: SL-SNG-301)
Front matter key should be boolean and ≤1 per chapter:
```
rg -n "^song_present:\\s*(true|false)" chapters
```

## New Proper Nouns Glossed (MUST: SL-NAM-501)
List chapters that declare new names:
```
rg -n "^new_proper_nouns:\\s*\\[.*\\]" chapters
```
Then verify each appears in `background/glossary.md` within close proximity.
