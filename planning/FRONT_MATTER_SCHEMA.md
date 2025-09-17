# Front Matter Schema (Chapters)

Use this schema for every file under `chapters/`. Keep keys and enums exact; add only documented fields.

## Keys
- `id` (string) — unique chapter ID. Example: `"ch01"`.
- `title` (string) — short title. Example: `"Mist on the Water"`.
- `pov` (enum) — `Hobbit` | `Bree-folk` | `Ranger`.
- `register` (enum) — `hearth` | `road` | `lore` | `encounter`.
- `place_anchors` (array[string], len ≥ 2) — named places/roads. Example: `["Bywater Road","The Water"]`.
- `time_anchor` (enum) — choose from `config.yml` `time_phrasing_allowed`: `after harvest` | `first frost` | `spring sowing` | `by sundown` | `at first light` | `by bells`.
- `song_present` (bool) — true only if a single original song appears.
- `theme_tick` (array[string], 1–2) — small moral/tonal axes. Examples: `hospitality`, `pity`, `watchfulness`.
- `wordcount_target` (int) — aim per chapter (500–4000). Default 2500.
- `beats` (array[string]) — use tokens from the outline, e.g., `quiet_open`, `boundary_crossed`, `encounter`, `return_with_addition`.
- `new_proper_nouns` (array[string]) — any newly coined names; must be glossed within ≤ 3 paragraphs or in `background/glossary.md`.
- `qa_status` (array[enum]) — `scaffolded` | `linted` | `peer_read` | `revised` | `approved`.

## Example
```yaml
---
id: "ch02"
title: "Lanterns at the Hay Gate"
pov: "Hobbit"
register: "road"
place_anchors: ["Stock Road","Hay Gate"]
time_anchor: "by sundown"
song_present: false
theme_tick: ["watchfulness","courtesy"]
wordcount_target: 2500
beats: ["quiet_open","boundary_crossed","encounter","return_with_addition"]
new_proper_nouns: ["Ferrystone"]
qa_status: ["scaffolded","linted"]
---
```

## Validation
- Run `checks/run_style_checks.sh` (banned lexis/units, anchors, song quota, glossing).
- Spot-check word counts with `wc -w chapters/chXX.md`.
- Keep enums exact; avoid adding ad‑hoc keys without updating this file.
