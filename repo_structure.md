# Scope
Legendarium‑adjacent prose set in and around the Shire in TA 3017. This rubric enforces the companion Style Guide via hard gates (MUST) and soft gates (SHOULD). It assumes a repo with modular folders, automated checks, and human review.  

# Repo Map
.
├── style/
│   ├── STYLE_GUIDE.md
│   ├── LEXICON/
│   │   ├── anglo_core.txt
│   │   ├── latinate_allowed.txt
│   │   ├── archaic_whitelist.txt
│   │   └── banned_modern.txt
│   ├── METRICS.yml
│   └── examples_minimal.md
├── background/
│   ├── timeline_TA3017.md
│   ├── geography_shire.md
│   ├── glossary.md
│   └── canon_edges.md
├── planning/
│   ├── arc_outline.md
│   ├── beat_sheet.md
│   ├── scene_bank.md
│   └── name_table.tsv
├── chapters/
│   ├── ch01.md
│   ├── ch02.md
│   └── ... 
├── songs/
│   ├── song_specs.md
│   └── fragments/
├── checks/
│   ├── style_lint_spec.md
│   ├── regexes.md
│   └── review_prompts.md
├── config.yml
└── README.md
