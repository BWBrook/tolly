# Sticky Note for Future Agent
Last updated: 2025-09-18 (evening)

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
- Prologue (ch00) and ch01–ch05 drafted; British spelling and em‑dash rules enforced; all checks pass.
- Songs: ch02 (watch song AABB), ch04 (walking song AABB, polished for cadence).
- Triad reviews: Group 0 (Prologue–ch02) and Group 1 (ch03–ch05) complete; `planning/triad_tracking.md` updated.
- Next triad (ch06–ch08) up next; index has anchors/time through ch05.
- Tooling: wrapper lint script, review prompts, UK spelling map, italics advisory, triad coverage check, PR template, `.editorconfig`.

## Next Recommended Steps
- Draft ch06 (“False Cairns”), ch07 (“Knots on the Reeds”), ch08 (“Wolf‑Sign at Dawn”).
- Maintain British orthography; em‑dashes ≤ 3/chapter; italics sparingly.
- Update glossary/geography as new names/places appear (knot terms, cairn sites).
- Keep `planning/triad_tracking.md` current; after ch06–ch08, run Stage 6 Triad Review before moving to ch09–ch11.
- Run `checks/run_style_checks.sh` regularly; use review checklist for PRs.

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
