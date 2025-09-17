# TOLLY — Shire‑Centric Novella (TA 3017 / SR 1417)

TOLLY is an experimental creative‑writing project where a human author and an agent model collaborate on a Tolkien‑adjacent novella set in and around the Shire in TA 3017. It is a homage, not a copy: original prose that aims for authenticity of tone while respecting canon boundaries and copyright.

## Repo Overview
- `chapters/` — drafts with YAML front matter (start from `chNN.md`).
- `background/` — research notes: `geography_shire.md`, `glossary.md`, `timeline_TA3017.md`, `canon_edges.md`.
- `style/` — `STYLE_GUIDE.md`, metrics, and lexicon lists (banned/allowed).
- `checks/` — lint spec, review prompts, and `run_style_checks.sh`.
- `planning/` — series/character planning and the agent plan.
See `repo_structure.md` for a fuller map.

## Quickstart
1) Read `style/STYLE_GUIDE.md` and `background/canon_edges.md` (constraints), then skim `background/geography_shire.md` and `timeline_TA3017.md`.
2) Update beats/continuity in `planning/tolly.md`; consult `planning/AGENT_PLANNING.md` for the file plan.
3) Create a chapter from `chapters/chNN.md`, fill front matter keys, and list any `new_proper_nouns`.
4) Add one‑line glosses to `background/glossary.md`; extend geography/timeline if new places or anchors appear.
5) Run `checks/run_style_checks.sh` and address any failures, then open a PR using `checks/review_prompts.md`.

## Writing Rules (essentials)
- Diction leans Anglo‑Saxon; archaism budget ≤ 6 per 1000 words; avoid banned modern terms in `style/LEXICON/banned_modern.txt`.
- Time phrasing uses allowed anchors in `config.yml` (e.g., “after harvest”, “by bells”). Distances: miles/leagues only.
- ≤ 1 song per chapter; use hobbit walking/bath song patterns (see `songs/song_specs.md`).
- Place/road anchors appear about every ~700 words; keep movement mapable.

## Commands
- Run checks: `checks/run_style_checks.sh` (or pass a custom dir: `checks/run_style_checks.sh chapters`).
- Word count spot check: `wc -w chapters/ch01.md`.
- Manual grep for banned terms: `rg -n -f style/LEXICON/banned_modern.txt chapters`.

## Contributing
Follow `AGENTS.md` for contributor expectations. Keep commits scoped (scene, glossary sweep, or planning update) and include the PR checklist from `checks/review_prompts.md`.

## Legal & Ethics
No direct quotes or near‑verbatim passages from Tolkien. This project is legendarium‑adjacent and aims for applicability, not allegory. See `LICENSE` for licensing terms.
