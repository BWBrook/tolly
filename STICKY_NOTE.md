# Sticky Note for Future Agent
Last updated: 2025-09-18

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

## Current Status (last session)
- Prologue (ch00), ch01, ch02 drafted; British spelling and em‑dash rules enforced; all checks pass.
- ch02 includes a short hobbit watch‑song (AABB) placed at the Hay Gate.
- Triad system in place: Stage 6 in `planning/WORKFLOW.md`; `planning/triad_tracking.md` Group 0 logged; Group 1 (ch03–ch05) prepped.
- ch03 scaffolded; anchors/time added in `chapters/_index.md` for ch03–ch05.
- Geography expanded (incl. Westfarthing); glossary seeded (Ferrystone, Lantern Shutter, Buyer’s Seal, etc.).
- Tooling: wrapper lint script, review prompts, UK spelling map, italics advisory, PR template, `.editorconfig`.

## Next Recommended Steps
- Draft ch03 (“Leaf and Ledger”), then ch04 (“Road Through Green Hills”), then ch05 (“First Watch at the Ford”).
- Maintain British orthography; keep em‑dashes ≤ 3/chapter; italics sparingly.
- Update `background/glossary.md` and `background/geography_shire.md` as new names/places appear.
- Keep `planning/triad_tracking.md` current; after ch03–ch05, perform Stage 6 Triad Review (edit pass + checks) before proceeding.
- Run `checks/run_style_checks.sh` regularly; open PRs with the review checklist when scaffolds/drafts are ready.

## Style Snapback (voice reminders)
- Anglo‑Saxon leaning diction; gentle alliteration per paragraph; measured polysyndeton.
- Archaism budget ≤ 6/1000 words; avoid modern filler.
- Pastoral foreground, epic horizon; courtesy before courage; small eucatastrophes.

## Evidence Thread (“memory chain”)
- Preserve artifacts gathered in‑story: knot primer, tar scrap, tally‑marks, depth notes; epilogue deposits them in the Mathom‑house.

## When in Doubt
- Check `planning/WORKFLOW.md` for the next stage.
- Re‑read `background/canon_edges.md` before adding tension.
- Ask for anchors first, then prose. Keep commits scoped: scaffold vs. prose vs. glossary sweep.

Good luck, future me. Keep the watches.
