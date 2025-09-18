# Chapter Production Workflow (Stage‑Gated)

Purpose: ensure every chapter reaches a coherent first draft without canon/style regressions. Follow these stages in order; each has inputs, actions, acceptance, and commands.

## Stage 0 — Brief & Scope
- Inputs: outline in `planning/tolly.md`; target chapter ID.
- Actions: write a 2–3 line brief (premise + tone) and list beats.
- Acceptance: brief added under the chapter entry in `chapters/_index.md`.

## Stage 1 — Anchors & Background
- Inputs: brief/beats.
- Actions: choose register (`hearth|road|lore|encounter`), 2+ `place_anchors`, 1 `time_anchor` from `config.yml`.
- Update `background/geography_shire.md` (toponyms you plan to use) and `background/glossary.md` (stub entries for `new_proper_nouns`).
- Acceptance: front matter keys and stubs identified; background updated.

## Stage 2 — Scaffold
- Actions: copy `chapters/chNN.md` → `chapters/chXX.md`; fill front matter completely (IDs, anchors, beats, `song_present`, `new_proper_nouns`, initial `qa_status`).
- Acceptance: `chapters/chXX.md` exists and passes structural checks.
- Commands: `wc -w chapters/chXX.md` (expect small pre‑draft count).

## Stage 3 — Pre‑Flight Checks
- Actions: run the wrapper and resolve failures.
- Commands: `checks/run_style_checks.sh`.
- Acceptance: zero failures; `qa_status` includes `linted`.

## Stage 4 — Human Review Gate
- Actions: self‑review with `checks/review_prompts.md`; adjust background notes; confirm cadence plan (sentence bands, alliteration placements) without writing prose.
- Acceptance: PR opened titled `Scaffold chXX: <short hook>` with the checklist pasted; reviewers tagged.

## Stage 5 — Drafting Greenlight
- Condition: PR feedback resolved; no checklist blockers.
- Actions: begin prose drafting in small passes (300–600 words), keeping anchors intact; add at most one song if planned.
- Ongoing: update `qa_status` (e.g., `peer_read`) and glossary as names solidify.

## Stage 6 — Triad Review (every 3 chapters)
- Trigger: After completing each triad (e.g., Prologue–ch02, ch03–ch05, ...).
- Actions: update `planning/triad_tracking.md` with events, objects, signals/protocols, and open threads for each chapter; scan for contradictions and repetitions; harmonise diction/register across the triad.
- Commands:
  - `checks/run_style_checks.sh` (all chapters in triad) — confirm zero failures.
  - Optional: `rg -n "—" chapters/ch0[0-5].md` — audit em‑dashes manually.
- Acceptance: triad log updated; no unresolved contradictions; PR “Triad Review N” opened if substantial edits were required.

Editorial stance: adopt a “Tolkien‑editor” persona — think margin notes on old exam papers. Trim over‑modern phrasing, prefer British orthography, reduce em‑dashes, and keep the pastoral foreground with an epic horizon. Songs are occasional and functional, not filler.

## Notes & Conventions
- Distances: miles/leagues; time phrases from `config.yml`.
- Songs: ≤1 per chapter; see `songs/song_specs.md`.
- New names: gloss within three paragraphs or in `background/glossary.md`.
- Keep commits scoped (scaffold vs. prose vs. glossary sweep).
