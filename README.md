# Aperto Bible

**An open-source Bible translation for everyone.**

Aperto (Latin: "open") is a modern Bible translation project released under [CC BY-SA 4.0](LICENSE). Our goal: make Scripture accessible, understandable, and alive — in every language, with cultural context built in.

## What Makes Aperto Different

- **Literary equivalence** — Aperto translates for literary impact, not word-by-word accuracy. The goal: a modern reader should feel what the original audience felt — the rhythm, the tension, the surprise.
- **Woven-in amplifications** — Ancient readers understood things modern readers miss: social codes, power dynamics, religious rituals, everyday assumptions. Aperto weaves brief contextual clues directly into the text (marked in *italics*), so you don't need a commentary to follow what's happening — you get it as you read.
- **Footnotes that explain, not just reference** — Every translation decision is documented inline. Cultural context, textual variants, apologetic notes, and reader helps are woven into the text via USFM footnotes.
- **Chapter-by-chapter structure** — Each chapter is its own file. Small diffs, easy reviews, accessible contributions.
- **31 languages from day one** — Full Luke in German, English, and Polish. Luke chapter 1 in 28 additional languages — a showcase and an invitation to help expand.
- **AI-assisted, human-governed** — We use AI tools for drafting, but every text goes through review. Pull requests welcome.

## Current Coverage

### Full Coverage

| Book | Languages |
|------|-----------|
| **Luke (Lukas)** | 🇩🇪 German (24 ch.), 🇬🇧 English (24 ch.), 🇵🇱 Polish (24 ch.) |
| **Psalms** | 🇩🇪 German (Ps 1–8, 23), 🇬🇧 English (Ps 1–8, 23), 🇵🇱 Polish (Ps 1–8, 23) |

### Luke Chapter 1 — 28 Additional Languages (Showcase)

These single-chapter translations demonstrate what's possible. We invite native speakers to review, improve, and expand them into full books.

Arabic, Bulgarian, Catalan, Czech, Danish, Greek, Spanish, Estonian, Finnish, French, Irish, Croatian, Hungarian, Italian, Lithuanian, Latvian, Maltese, Norwegian (Bokmål), Dutch, Portuguese, Romanian, Russian, Slovak, Slovenian, Albanian, Swedish, Turkish, Ukrainian

## Repository Structure

```
aperto-bible/
├── texts/
│   ├── de/                  ← German (full Luke + Psalms)
│   │   ├── 42-LUK/          ← Luke (24 chapters)
│   │   └── 19-PSA/          ← Psalms 1–8, 23
│   ├── en/                  ← English (full Luke + Psalms)
│   │   ├── 42-LUK/
│   │   └── 19-PSA/
│   ├── pl/                  ← Polish (full Luke + Psalms)
│   │   ├── 42-LUK/
│   │   └── 19-PSA/
│   ├── ar/42-LUK/           ← Arabic (Luke 1)
│   ├── bg/42-LUK/           ← Bulgarian (Luke 1)
│   └── ...                  ← 25 more languages (Luke 1 showcase)
├── scripts/
│   ├── merge-to-book.sh     ← Merge chapters into single-book USFM
│   └── validate.sh          ← USFM syntax validation
├── .github/workflows/       ← CI validation on PRs
└── metadata/                ← Book metadata and translation info
```

## File Naming Convention

```
{BookCode}{Chapter}_{language-code}.usfm
```

Examples:
- `42LUK01_ab-de.usfm` — Luke chapter 1, German
- `42LUK24_ab-en.usfm` — Luke chapter 24, English
- `19PSA023_ab-de.usfm` — Psalm 23, German

## USFM Format

All texts are in [USFM 3.0](https://ubsicap.github.io/usfm/) (Unified Standard Format Markers) — the industry standard for Bible translation software.

Our footnotes use these categories:

| Marker | Category | Purpose |
|--------|----------|---------|
| `\fk TEXT` | Textual decision | Why we chose this wording |
| `\fk KULTUR` | Cultural context | Historical and social background |
| `\fk APOLOGETICS` | Apologetics | Evidence and reasoning for skeptical readers |
| `\fk UNGLAUBLICH` | "Hard to believe" | Accessible explanations for difficult passages |
| `\fk KONTEXT` | Cross-reference context | Connections to other Scripture |

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Ways to contribute:**
- 🐛 **Fix a translation** — Spot an error? Open a PR.
- 📝 **Improve a footnote** — Add cultural context, clarify a decision.
- 🌍 **Add a language** — Translate Luke 1 into a new language.
- 📖 **Expand a showcase language** — Pick a language with only Luke 1 and translate more chapters.
- 📖 **Expand coverage** — Help translate more chapters or books.

## Quick Start

```bash
# Clone the repo
git clone https://github.com/oratioandco/aperto-bible.git
cd aperto-bible

# Read Luke 1 in German
cat texts/de/42-LUK/42LUK01_ab-de.usfm

# Merge all German Luke chapters into a single file
bash scripts/merge-to-book.sh de 42-LUK
```

## License

[Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE)

You are free to:
- **Share** — copy and redistribute the material in any medium or format
- **Adapt** — remix, transform, and build upon the material for any purpose, even commercially

Under the following terms:
- **Attribution** — Credit "Aperto Bible" and link to this repository
- **ShareAlike** — Derivatives must use the same license

## Links

- 🌐 [aperto.bible](https://aperto.bible) — Project website
- 💬 [GitHub Discussions](https://github.com/oratioandco/aperto-bible/discussions) — Questions and conversation
- 🐛 [Open an Issue](https://github.com/oratioandco/aperto-bible/issues) — Bug reports and suggestions

---

*Aperto — because the Word should be open.*
