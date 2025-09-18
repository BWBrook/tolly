
## Automated Style Lint

`checks/style_lint_spec.md` defines **rules with IDs** for deterministic evaluation. Each has **Intent**, **Method**, **Threshold**, **Failure Mode**, **Fix Hint**.

> **Legend:** MUST = hard gate. SHOULD = soft gate (score impact). MAY = informational.

### Diction & Register

* **SL‑DIC‑001 (MUST)** — *Anglo‑Saxon bias*
  **Intent:** Maintain pastoral English texture.
  **Method:** Sliding window (500w). Count hits from `LEXICON/anglo_core.txt` vs `latinate_allowed.txt`. Compute ratio.
  **Threshold:** Shire scenes ≥ 3:1; Lore scenes ≥ 2:1.
  **Failure:** Flag location and ratio.
  **Fix:** Replace abstract Latinate nouns with earthbound Anglo terms; simplify verbs.

* **SL‑ARC‑002 (MUST)** — *Archaism budget*
  **Method:** Tokenize against `archaic_whitelist.txt` (e.g., ere, nigh, whither, yonder, oft, hearkened).
  **Threshold:** ≤ 6 per 1000 words.
  **Failure:** Report counts, suggest pruning.
  **Fix:** Remove gratuitous archaisms; keep 1–2 where register lifts.

* **SL‑BAN‑003 (MUST)** — *Modern lexis ban*
  **Method:** Exact/regex match against `banned_modern.txt` (ok/okay, yeah, sorta, vibe, random, percent, metric units, deadline, industry unless dwarven‑context whitelisted).
  **Threshold:** 0 occurrences.
  **Failure:** Hard fail; list offending tokens with line numbers.
  **Fix:** Replace with idiomatic equivalents or recast.

* **SL‑UNI‑004 (MUST)** — *Units and time*
  **Method:** Detect `\b(km|kilometer|kilometre|meters|metres|%|degree[SC])\b` or weekday/business time idioms. Confirm presence of allowed units/time phrases per `config.yml`.
  **Threshold:** 0 banned units; ≥ 1 allowed anchor per chapter.
  **Failure:** Hard fail on banned; soft warning on missing anchor.
  **Fix:** Switch to miles/leagues; rephrase time (e.g., “by sundown”).

### Cadence & Prosody

* **SL‑LEN‑101 (SHOULD)** — *Sentence length band*
  **Method:** Compute distribution.
  **Threshold:** 90% sentences within 8–28 words; ≤ 2 long sentences (35–45w) per 1000w.
  **Failure:** Deviation reduces style score.
  **Fix:** Split or braid sentences; vary cadence.

* **SL‑POLY‑102 (SHOULD)** — *Polysyndeton presence*
  **Method:** Count sequences of “and” joining ≥ 3 clauses without coma series.
  **Threshold:** ≥ 1 per \~300–500w.
  **Failure:** Style score nudge.
  **Fix:** Introduce one rolling line where appropriate.

* **SL‑ALLI‑103 (SHOULD)** — *Gentle alliteration*
  **Method:** Heuristic: headword bigrams sharing initial consonant within a clause (exclude stop words).
  **Threshold:** \~1 instance per paragraph.
  **Failure:** Advisory only.
  **Fix:** Subtle sound echoes, not tongue‑twisters.

### Anchoring & World Feel

* **SL‑PLC‑201 (MUST)** — *Place/road anchor frequency*
  **Method:** Ensure a named place/road/hedge/bridge every ≤ 2 pages (\~700w).
  **Threshold:** Pass/Fail.
  **Failure:** Hard fail when absent.
  **Fix:** Add specific toponyms from `background/geography_shire.md`.

* **SL‑GEO‑202 (SHOULD)** — *Mapability*
  **Method:** Heuristic check for movement verbs + cardinal hints + landforms.
  **Threshold:** ≥ 3 per chapter.
  **Failure:** Style score decrease.
  **Fix:** Add “breasted the slope,” “over the stile,” compass cues.

### Songs

* **SL‑SNG‑301 (MUST)** — *Song quota*
  **Method:** Parse front‑matter `song_present` and count fenced verse blocks.
  **Threshold:** ≤ 1 per chapter.
  **Failure:** Hard fail on excess.
  **Fix:** Cut or relocate.

* **SL‑SNG‑302 (SHOULD)** — *Meter and rhyme sanity*
  **Method:** Approximate anapestic pattern (unstressed–unstressed–stressed) by syllable grouping; rhyme scheme check AABB/ABAB.
  **Threshold:** ≥ 70% lines fit; rhyme holds.
  **Failure:** Advisory with line numbers.
  **Fix:** Adjust stress by rewording; fix rhyme.

### Dialogue & Voice Separation

* **SL‑DIA‑401 (SHOULD)** — *Voice fingerprinting*
  **Method:** Tag speaker lines; compare clause length and lexis against voice profiles:

  * Hobbit: short clauses, idioms, understatement.
  * Bree‑folk: plain, hospitable, newsy.
  * Ranger: longer sentences, strong verbs, few questions.
    **Threshold:** Cosine distance between profiles ≥ ε.
    **Failure:** Style score decrease.
**Fix:** Recast lines to match profiles.

### Orthography & Punctuation

* **SL-UK-701 (MUST)** — British spelling for common variants
  **Method:** Whole-word scan using `style/LEXICON/american_to_british.tsv` (e.g., colour, traveller, grey, honour, armour).
  **Threshold:** 0 US variants.
  **Failure:** List offending tokens with line numbers.
  **Fix:** Replace with British forms; when in doubt, prefer OED-friendly spellings (‑our, ‑re, doubled L; allow -ise/-ize as editorial choice).

* **SL-PUNC-702 (SHOULD)** — Em‑dashes used sparingly
  **Method:** Count U+2014 occurrences per chapter.
  **Threshold:** ≤ 3 per chapter.
  **Failure:** Advisory; reduce where possible by using commas, colons, or parentheses.
  **Fix:** Replace excess em‑dashes with alternative punctuation that fits cadence.

* **SL-ITAL-703 (SHOULD)** — Italics used occasionally
  **Method:** Count inline `*italic*` spans per chapter (heuristic).
  **Threshold:** ≤ 4 per chapter.
  **Failure:** Advisory; reduce emphasis or switch to diction/cadence for stress.
  **Fix:** Remove or recast emphasis; keep rare for key beats.

### Naming Discipline

* **SL‑NAM‑501 (MUST)** — *Gloss within proximity*
  **Method:** For each `new_proper_nouns`, search same chapter for gloss within ≤ 3 paragraphs or entry in `background/glossary.md`.
  **Threshold:** 100% coverage.
  **Failure:** Hard fail; list orphan names.
  **Fix:** Add organic gloss in narration or glossary.

* **SL‑NAM‑502 (SHOULD)** — *Productive morphemes*
  **Method:** Check names against allowed morphemes list.
  **Threshold:** ≥ 80% compliant (exceptions allowed for pre‑existing canon‑adjacent patterns with good euphony).
  **Failure:** Advisory.
  **Fix:** Rename or justify in glossary.

### Canon & Chronology

* **SL‑CAN‑601 (MUST)** — *TA 3017 boundaries*
  **Method:** Scan for hard bans and timeline contradictions using `background/canon_edges.md`.
  **Threshold:** 0 breaches.
  **Failure:** Hard fail with excerpts.
  **Fix:** Remove or reframe as rumor; shift event offstage or to hearsay.

---

## Style Scorecard (CI gate)

**Base 100. Passing ≥ 85.** Hard fails short‑circuit.

| Band         | Rule IDs                             | Weight |
| ------------ | ------------------------------------ | ------ |
| Core Diction | SL‑DIC‑001, SL‑ARC‑002, SL‑BAN‑003   | 35     |
| Cadence      | SL‑LEN‑101, SL‑POLY‑102, SL‑ALLI‑103 | 20     |
| Anchoring    | SL‑PLC‑201, SL‑GEO‑202               | 20     |
| Songs        | SL‑SNG‑301, SL‑SNG‑302               | 10     |
| Dialogue     | SL‑DIA‑401                           | 10     |
| Naming       | SL‑NAM‑501, SL‑NAM‑502               | 5      |

**Computation:** For each SHOULD rule, full compliance = full weight; partial = proportional; miss = 0. MUST rules are pass/fail; fail halts.

---

## Naming & Gloss Protocol

* **When coining:** Prefer concrete roots (hedge, brook, hay, stock, rush) + suffix (‑gate, ‑bridge, ‑holm).
* **Glossing:** Deliver unobtrusively within 3 paragraphs or add a one‑line entry to `background/glossary.md`.

**Gloss formats:**

* *Inline:* “They reached **Haygate Stone**, an old boundary‑marker where hay‑fields once met the lane.”
* *Glossary:* `Haygate Stone — boundary stone at the lane’s end; hayfield gate stood here in elder days.`

**Rejected:** Apostrophe‑laden exotica, unless non‑Shire (and then justify).

---

## Planning Artifacts (minimum viable)

### `planning/arc_outline.md`

Flat structure only.

* Premise (1–2 lines)
* Themes (2)
* Chapter list with beats: `ch01: quiet_open → boundary_crossed`; …
* Eucatastrophe note (novella‑scale, humane)
* Return with addition (token/promise/changed proverb)

### `planning/beat_sheet.md`

| Ch | Beat             | Function                | Image Anchor               |
| -- | ---------------- | ----------------------- | -------------------------- |
| 1  | Quiet opening    | Establish hearth, rumor | kettle + mist on the Water |
| 1  | Boundary crossed | First small choice      | stile at Hay Gate          |
| 2  | Encounter        | Courtesy exchange       | Ranger’s cup at the door   |
| …  | …                | …                       | …                          |

### `planning/name_table.tsv`

`name	pattern	gloss	appears_in	justification`

```
Haygate Stone     suffix:-gate   boundary stone; hay fields met here    ch02    fits hedge-edge morphology
Rushholm          suffix:-holm   grassy islet by the Rushy brook        ch03    local landform
```

---

## Background (non‑negotiable stubs)

* `background/timeline_TA3017.md` — one page with what **is** and **is not** happening locally; Rangers vigilant; Gandalf scarce; no Riders in the Shire; no Sharkey; dwarves on the Road.
* `background/geography_shire.md` — roads, gates, bridges, hedges, fords; distances between 3–15 miles for day‑walks.
* `background/canon_edges.md` — enumerated bans + allowed offstage currents.
* `background/glossary.md` — append as you coin; keep entries one line.

---

## Songs Module

`songs/song_specs.md` defines minimal verifiable patterns.

* **Hobbit song template (AABB/ABAB; anapestic bias)**
  *Acceptance tests:*

  1. Each tetrameter line 11–14 syllables, stress near end.
  2. Trimeter clinch 7–9 syllables.
  3. Lexicon: food, road, water, tools; avoid high myth unless quoted.

* **Lore fragments:** alliterative half‑lines permitted **only as heard** (wind‑borne, distance). Keep to 2–6 lines.

* **Function rule:** A song must *advance tone or memory*. If removable without tonal loss, it fails SL‑SNG‑301 even if quota is met.

---

## Dialogue Profiles (operational)

**Hobbit**

* Clauses: short to medium.
* Moves: understatement, proverb, domestic referents.
* Lexical markers: tidy, fair bit, now then, no call to…

**Bree‑folk**

* Clauses: plain, hospitable, news‑tilted.
* Markers: if you take my meaning, no harm in, custom at the Pony (if Bree appears).

**Ranger**

* Clauses: longer; verbs strong; few adjectives.
* Moves: courtesy, reserve; names withheld; thanks precise.

**Review prompt:** For any page of dialogue, can you attribute speakers blind? If not, rewrite.

---

## Human Review Checklist (PR template)

**Title:** `chNN – <title> — style/anchor/canon review`

* [ ] Front‑matter valid and complete.
* [ ] Hard bans: none present.
* [ ] Place/road anchors present at required cadence.
* [ ] One paragraph opens a door to deep time (without exegesis).
* [ ] Mercy/hospitality enacted in scene (not lectured).
* [ ] New proper nouns glossed.
* [ ] If song present: meter sane; alters tone/memory.
* [ ] Dialogue voices separable.
* [ ] Ending image or proverb; no abstract fade‑out.

**Margin notes:**

* *Where does the map want another line?*
* *Which sentence is thesaurus‑gloss? Cut it.*
* *Does any paragraph read like a wiki? Rewrite as occasioned speech or found text.*

---

## Lexicon Files

Existing files (seed content) are:

`style/LEXICON/anglo_core.txt`
`style/LEXICON/latinate_allowed.txt` (measured elevation)
`style/LEXICON/archaic_whitelist.txt`
`style/LEXICON/banned_modern.txt`

Extend prudently.

---

## Regexes & Heuristics (developer‑facing)

`checks/regexes.md` (snippets)

* Metric units: `\b(km|kilomet(re|er)s?|met(re|er)s?|cm|mm)\b`
* Percent: `\b\d{1,3}\s?%`
* Weekday/business idioms: `\b(Monday|Tuesday|Wednesday|Thursday|Friday|weekend|deadline|schedule)\b`
* Song block fence: start `^>{0,3}\s*[\*\-]?\s*` not reliable; prefer fenced code‑like markers:
  Use triple tildes around verse blocks:

  ```
  ~~~verse
  <lines>
  ~~~
  ```
* Archaism tokenization: `\b(ere|nigh|whither|yonder|oft|hearkened|slumber)\b`

---

## Examples (minimal, for rhythm only—do not copy tone wholesale)

* **Anchor sentence:**
  *Mist lay along the Water, and Tom set his hoe to the hedge while the south lane brightened.*
  *Compliance notes:* place anchor ✓, weather ✓, cadence 18w ✓, Anglo bias ✓.

* **Inline gloss:**
  *They rested by **Rushholm**, the grassy isle in the brook where rushes keep their own weather.*
  *Compliance notes:* name + gloss ✓.

* **Hobbit quip:**
  *“That’s a tidy walk for a Tuesday,” said May, “and no sense hurrying when the lane isn’t.”*
  *Compliance notes:* idiom ✓, understatement ✓.

---

## Workflow: from Planning to Chapter

1. **Plan beats** (`planning/beat_sheet.md`), confirm against §9 themes.
2. **Draft chapter** in `chapters/`, include front‑matter.
3. **Run lints** (implementers: wire to CI; rules §3).
4. **Self‑audit** with PR checklist (§10).
5. **Peer read** (one pass for cadence aloud; one for mapability).
6. **Update glossary** for any new names (§5).
7. **Record decisions** in commit message: `ch03: add stile at Haygate; replace “percent” with “share”; song pruned`.

---

## Quality Gates & Debt

* **Hard gates:** SL‑DIC‑001, SL‑ARC‑002, SL‑BAN‑003, SL‑UNI‑004, SL‑PLC‑201, SL‑SNG‑301, SL‑NAM‑501, SL‑CAN‑601.
* **Style debt:** Any SHOULD failure accrues debt; debt > 12 triggers mandatory edit before next chapter merges.
* **Release readiness:** All chapters ≥ 85 score; average ≥ 90; zero hard fails; glossary complete.

---

## Maintenance: How to Extend Without Drift

* If you add an archaism to the whitelist, reduce the budget by an equivalent token elsewhere.
* Expanding the anglo_core list? Add no more than 20 at a time; re‑run a sample to ensure ratios don’t become trivial.
* New morphemes for names require an example + justification in `planning/name_table.tsv`.

---

## Reviewer Prompts (for useful friction)

* **Diction:** Which three words can be made one syllable shorter without loss?
* **Cadence:** Where does a long sentence earn its keep? Mark any that don’t.
* **Anchoring:** Draw the path on a map from this chapter. Where do you hesitate?
* **Ethos:** Where is mercy or hospitality *done*, not said?
* **Lore:** Which sentence opens deep time without explanation? If none, add one.

---

## CI Configuration Hints (non‑binding)

* Run lints on every push to `chapters/`.
* Compute style score; block merge on hard fails or score < 85.
* Generate a per‑chapter report: counts, ratios, flagged lines, glossary delta.
* Nightly job: scan repo for banned modern lexis; fail if any drift.

---

## Safety & Canon Edges (quick table)

| Item                  | Status              | Note                                             |
| --------------------- | ------------------- | ------------------------------------------------ |
| Nazgûl on Shire roads | **BANNED**          | Not in 3017.                                     |
| Sharkey/ruffians      | **BANNED**          | Post‑War only.                                   |
| Gandalf cameo         | **RARE/REPORTED**   | Offstage or remembered, not corridor‑casual.     |
| Rangers in Shire      | **ALLOWED (quiet)** | Courtesy, reserve.                               |
| Dwarven trade         | **ALLOWED**         | Blue Mountains/Greenway traffic.                 |
| Fireworks             | **DISCOURAGED**     | No event in 3017 unless historical recollection. |

---

### Final note

This rubric is not decoration; it is constraint. If an effect you want cannot survive these gates, it does not belong in a Shire novella of TA 3017. Conversely, if you pass on paper but the page doesn’t smell of hedge and pipe‑smoke, rework until it does.
