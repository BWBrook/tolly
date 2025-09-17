# Agent Planning — TA 3017 Novella

Purpose: translate the existing guides into concrete steps and files so the agent and author can draft confidently within Shire‑centric constraints.

## Phases (high level)
- Phase 0 — Foundation: create background, glossary, and review aides.
- Phase 1 — Style assets: finalize lexicon stubs and examples.
- Phase 2 — Chapter scaffolds: instantiate first chapters from `chapters/chNN.md`.
- Phase 3 — QA loop: run checks from `checks/style_lint_spec.md`, peer read, revise.

## Files To Create (what + how to populate)
- `background/glossary.md`
  - One‑line entries for every `new_proper_nouns` within ≤3 paragraphs of use.
  - Format: `Name — short gloss; where found; first chapter ID.`
  - Example: `Haygate Stone — boundary marker near Bywater Road; ch01.`
- `background/geography_shire.md`
  - Short entries for lanes, bridges, hedgebanks, and roads likely to appear.
  - Include 8–12 toponyms with 1–2 lines each and map cues.
- `background/timeline_TA3017.md`
  - Anchors only: SR 1417 mapping; Rangers vigilant; no Nazgûl/Sharkey.
  - 8–10 dated bullets (seasonal/weather notes; trade traffic; rumors).
- `background/canon_edges.md`
  - Copy hard bans and offstage allowances from `config.yml` and expand with 1‑sentence rationale per item.
- `checks/regexes.md`
  - Minimal regex library for MUST/SHOULD rules (banned lexis, metric units, time anchors).
  - Include shell snippets using `rg` for each rule.
- `checks/review_prompts.md`
  - Human review checklist aligned to rule IDs; add prompts for diction ratio, cadence, and mapability.
- `songs/song_specs.md`
  - Summarize allowed meters (anapestic tetrameter/trimeter) and rhyme (AABB/ABAB) with a 4‑line schematic; no content pastiche.
- `songs/fragments/README.md`
  - Brief note on storing verse experiments before embedding.
- `chapters/ch01.md`
  - Instantiate from `chapters/chNN.md` with SR season anchor, 2 place anchors, and `qa_status: ["linted"]`.
- `chapters/_index.md`
  - Running list of chapters with 1‑line beat summaries.

## Population Rules (condensed from STYLE_GUIDE)
- Diction: Anglo‑Saxon leaning; archaism budget ≤6 per 1000w; avoid banned modern terms in `style/LEXICON/banned_modern.txt`.
- Cadence: 90% sentences 8–28 words; aim for one gentle alliteration per paragraph; occasional polysyndeton.
- Anchors: miles/leagues only; ensure at least one place/road mention every ~700w.
- Songs: ≤1 per chapter; prefer walking/bath song patterns.

## Author/Agent Workflow
1) Update `planning/tolly.md` with beats and continuity impacts.
2) Add or update entries in `background/*.md` (gloss, geography, timeline) before drafting.
3) Draft in `chapters/ch01.md` using the front matter scaffold.
4) Run checks:
   - `rg --ignore-case -f style/LEXICON/banned_modern.txt chapters || true`
   - `rg -n "\\b(km|kilometer|metre|meter|%)\\b" chapters && echo "Block metric units"`
   - Verify each `new_proper_nouns` appears in `background/glossary.md` within 3 paragraphs.
5) Update `qa_status` front matter and open PR with checklist from `checks/review_prompts.md`.

## Acceptance Criteria (per chapter)
- Front matter complete and valid; `song_present` ≤ 1; 2+ place anchors.
- All new names glossed; no banned lexis/units; time phrasing from `config.yml`.
- Evidence of cadence targets on a spot read; glossary and geography updated.

## Open Questions
- Do we want a tiny `checks/run_style_checks.sh` wrapper? If yes, place it in `checks/` and keep it POSIX‑sh only.
- Should we add `.editorconfig` to enforce two‑space indentation for lists and YAML? If approved, add at repo root.

---

## Next Required Steps (Pre‑Drafting)

Goal: finish belts‑and‑braces so the first prose pass can proceed without thrash.

1) Authoring Workflow Doc — add `planning/WORKFLOW.md` with a stage‑gated process (brief → anchors → background updates → scaffold → checks → PR). Include acceptance criteria and exact commands (use `checks/run_style_checks.sh`).
2) Front‑Matter Schema — document allowed keys and enums in `planning/FRONT_MATTER_SCHEMA.md` (authorable by hand; no code gen). Include examples and validation tips.
3) Geography & Gloss Coverage — expand `background/geography_shire.md` to ~20 entries and `background/glossary.md` with any planned new names for ch02–ch03 (placeholder stubs allowed).
4) Review Aids — finalize `checks/review_prompts.md` (done) and keep `checks/regexes.md` in sync as rules evolve. Optionally add a one‑shot `make check` alias later.
5) Repo Hygiene — add `.editorconfig` (2‑space indent, UTF‑8, LF) and a minimal PR template at `.github/pull_request_template.md` aligned to the review prompts.
6) Chapter Queue — create `chapters/ch03.md` scaffold when outline is ready; keep `chapters/_index.md` updated with beats and anchors.

Status
- 1) WORKFLOW — COMPLETED (`planning/WORKFLOW.md`).
- 2) Schema — COMPLETED (`planning/FRONT_MATTER_SCHEMA.md`).
- 3) Geo/Gloss — IN PROGRESS (initial set added; extend for ch02–ch03).
- 4) Review Aids — COMPLETED (initial); maintain as rules change.
- 5) Hygiene — COMPLETED (`.editorconfig`, `.github/pull_request_template.md`).
- 6) Chapter Queue — PENDING (await ch03 outline).
