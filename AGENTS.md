# Repository Guidelines

## Project Structure & Module Organization
This repo is Markdown-first. `chapters/` stores draft chapters; use `chNN.md` as template and preserve YAML front matter. `background/me_eriador.md` holds lore notes that must back every gloss. `planning/tolly.md` tracks character and arc decisions; update it before structural changes. `style/` provides the binding rules (`STYLE_GUIDE.md`, metrics, lexicon lists). `checks/style_lint_spec.md` defines QA gates. Park any lyrics or experiments inside `songs/` until folded into a chapter.

## Build, Test, and Development Commands
Preferred: run the wrapper script.
- `checks/run_style_checks.sh` — bundles MUST/SHOULD ripgrep checks (banned lexis/units, time + place anchors, song quota, new-name glosses). Exits non‑zero on failure.

No build pipeline exists; run lightweight shell checks as needed:
- `rg --ignore-case -f style/LEXICON/banned_modern.txt chapters || true` – ensure banned modern lexis is absent (exit 1 with no matches is normal).
- `wc -w chapters/ch01.md` – confirm draft word counts vs. `wordcount_target`.
- `rg -n 'new_proper_nouns' chapters` then `rg -n 'Haygate Stone' background` – double-check new names have nearby glosses or documented research.
Share any reusable helper scripts inside `checks/` before expecting others to run them.

## Coding Style & Naming Conventions
Follow `style/STYLE_GUIDE.md`: Anglo-Saxon leaning diction, controlled polysyndeton, and gentle alliteration roughly once per paragraph. Keep YAML keys in lower_snake_case and do not rename existing ones. Headings stay at H1/H2, bullet lists use two-space indentation, and literal paths or commands go in backticks. Coin hobbit names from concrete morphemes (`Haygate`, `-brook`, `-foot`) and record glosses within three paragraphs or in background notes.

## Testing & QA Guidelines
Treat `checks/style_lint_spec.md` as the checklist. Validate time anchors against `config.yml`, confirm `song_present` never exceeds one per chapter, and reread for cadence targets. Update each file’s `qa_status` array (e.g., `["linted","peer_read"]`) as checkpoints pass, and call out unresolved risks—missing place anchors, gloss debts—in the PR body.

## Commit & Pull Request Guidelines
Keep commits scoped to a scene, glossary sweep, or planning update. Use imperative, ≤72-character titles such as `Add Sarn Ford fog beat`. PRs should state intent, list touched files, paste your QA checklist, and link to any new research sources. Include verse screenshots only when meter review is easier visually. Notify reviewers once lint checks pass and glossary updates are committed.  

Never do a remote push unless the developer explicitly requests it.

## Agent Workflow Tips
Revise planning notes before drafting prose so continuity contracts stay current. Stage new lexicon entries in `style/LEXICON/` only after confirming they meet the allowed strata. Store partial drafts or verse experiments in `songs/` or a scratch branch until ready for review.
