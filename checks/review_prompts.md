# Human Review Prompts (map to rule IDs)

Use this checklist in PRs. Quote rule IDs from `checks/style_lint_spec.md`.

- [ ] SL-DIC-001 (MUST) — Anglo-Saxon bias holds (3:1 Shire, 2:1 lore). Any Latinate clusters replaced where possible.
- [ ] SL-ARC-002 (MUST) — Archaism budget ≤ 6/1000 words. Overages pruned or justified by register.
- [ ] SL-BAN-003 (MUST) — No banned modern lexis. `rg -f style/LEXICON/banned_modern.txt` shows zero hits.
- [ ] SL-UNI-004 (MUST) — No metric units or %; at least one allowed time anchor present.
- [ ] SL-PLC-201 (MUST) — Place/road anchor appears within ~700w.
- [ ] SL-SNG-301 (MUST) — ≤ 1 song per chapter; front matter `song_present` correct.
- [ ] SL-NAM-501 (MUST) — All `new_proper_nouns` glossed inline within ≤ 3 paragraphs or in `background/glossary.md`.
- [ ] SL-LEN-101 (SHOULD) — Sentences mostly 8–28 words; long-sentence allowance respected.
- [ ] SL-POLY-102 (SHOULD) — At least one gentle polysyndeton instance where tone warrants.
- [ ] SL-ALLI-103 (SHOULD) — Subtle alliteration appears about once per paragraph.
- [ ] SL-GEO-202 (SHOULD) — Movement/mapability present (verbs + landforms + cardinal hints).
- [ ] SL-DIA-401 (SHOULD) — Distinct voices for Hobbit/Bree/Ranger where applicable.

- [ ] SL-UK-701 (MUST) — British English spelling (colour, traveller, grey, honour, etc.).
- [ ] SL-PUNC-702 (SHOULD) — Em‑dashes used sparingly (≤ 3 per chapter); alternatives considered.
- [ ] Triad Review — `planning/triad_tracking.md` updated for this triad; contradictions/repetitions addressed; protocols consistent.

PR must also include:
- [ ] Updated `qa_status` in chapter front matter (e.g., ["linted"]).
- [ ] Any new geography added to `background/geography_shire.md`.
- [ ] Any new canon constraints added to `background/canon_edges.md`.
