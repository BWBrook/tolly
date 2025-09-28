# Sticky Note for Future Agent
Last updated: 2025-09-28

If you are a fresh instance, start here to regain context fast and avoid canon/style slips.

## What This Project Is
- Tolkien‑adjacent novella set in TA 3017 (SR 1417), Shire + Sarn Ford focus.
- Homage, not copy: no direct quotes; original prose matching tone/texture.
- Core premise: “strange goings‑on at Sarn Ford” as a prelude to later troubles.

## Read These First (order)
1) `README.md` — quick project overview and commands.
2) `AGENTS.md` — contributor rules and where things live.
3) `planning/WORKFLOW.md` — stage‑gated process from brief → draft.
4) `planning/structural_plan.md` — 30k outline (Prologue + 18 ch + Epilogue).
5) `planning/mind_map.md` — tension levers, set‑pieces, rails.
6) `planning/tolly.md` — series bible; motifs and continuity.
7) `style/STYLE_GUIDE.md` + `checks/style_lint_spec.md` — voice and QA gates.
8) `config.yml` — time/units and hard bans.
9) `background/` — geography, glossary, timeline, canon edges.

## Non‑Negotiable Rails (3017)
- No Nazgûl/Sharkey/Scouring; Saruman never named; no pitched battles in Shire lanes.
- Rangers hold Sarn Ford; dangers appear as rumor/sign/brief glimpse beyond bounds.
- Distances: miles/leagues only. Time phrasing: use `config.yml` list.
- ≤ 1 song per chapter; keep songs original (AABB/ABAB guidance in `songs/song_specs.md`).
- Keep banned modern lexis/metric units out (see `style/LEXICON/`).

## Quick Checks
- Run all: `checks/run_style_checks.sh` (requires `rg`).
- Word count spot: `wc -w chapters/chXX.md`.
- Manual grep (if needed): `rg -n -f style/LEXICON/banned_modern.txt chapters`.

- ## Current Status (complete through ch19)
- Drafted: Prologue (ch00) and ch01–ch19 complete in draft. Group 4 (ch12–ch14), Group 5 (ch15–ch17), and Group 6 (ch18–ch19) drafted and reviewed per outlines.
- Checks: All chapters pass `checks/run_style_checks.sh` (UK spelling; em‑dashes within limits; anchors/time; song quota; gloss proximity; triad coverage; italics advisory).
- Songs: ch02 watch song (AABB); ch04 walking song (AABB, polished); ch08 distant Ranger lay fragment (4 lines); ch16 hobbit work‑song (AABB, 2 stanzas). All within quota.
- Triad status: Groups 0–6 completed; see `planning/triad_tracking.md` for details.
- Evidence chain (so far): tallies → coloured twine → tar crumb → rope fibre → false cairn map → reed‑knot primer + distances → near‑miss scrape/rope strain → integrated statement for Mayor/Mathom-house.
- Courtesy/Watch rules in play: By bells; Lantern low, never still; One token tale/day; Name little, mark much; no answers to unknown reeds; double watches at dawn/dusk while water sits lower.

- ## Next Recommended Steps (resume here)
- Prep final review:
  - Run `checks/run_style_checks.sh` (all chapters) — confirm zero fails.
  - Read for cadence drift; trim any stray em‑dashes; keep UK orthography.
  - Open PR “Triad Reviews 4–6 consolidation” with checklist; attach planning updates.
  - Optional: begin pass for sentence‑length bands and light line edits per `style/STYLE_GUIDE.md`.
- Maintain UK orthography; keep em‑dashes ≤ 3/chapter; italics sparingly and purposeful.
- Keep tokens short: split stick or notch (not both). No tampering with markers unless in coordinated action with Rangers (later ch16).
- Update `planning/triad_tracking.md` Group 6 during drafting; then run Stage 6 Triad Review before proceeding.
- Run `checks/run_style_checks.sh` after each draft; post any new courtesy/rule language to `background/glossary.md`.

## Style Snapback (voice reminders)
- Anglo‑Saxon leaning diction; gentle alliteration per paragraph; measured polysyndeton.
- Archaism budget ≤ 6/1000 words; avoid modern filler.
- Pastoral foreground, epic horizon; courtesy before courage; small eucatastrophes.

## Evidence Thread (“memory chain”)
- Preserve artifacts gathered in‑story: knot primer, tar scrap, tally‑marks, depth notes; epilogue deposits them in the Mathom-house.

## When in Doubt
- Check `planning/WORKFLOW.md` for the next stage.
- Re‑read `background/canon_edges.md` before adding tension.
- Ask for anchors first, then prose. Keep commits scoped: scaffold vs. prose vs. glossary sweep.

## Quick Resume Pointer
- Read: `planning/structural_plan.md` (ch12–ch14 beats), `planning/triad_tracking.md` (Group 4 prep), `chapters/_index.md` (ensure anchors/time), then open `chapters/ch12.md` to draft.

Good luck, future me. Keep the watches.

## Epilogue Guardrails (tone + resolution)
- Endings stay modest and local: bells, drawers, lanes, and kept courtesy carry the weight.
- Hint at wider unrest only obliquely (no named powers onstage); keep the Shire’s peace earned and ordinary.
- Let records and small habits close the circle (Mathom-house copy; posted boards; private note).
