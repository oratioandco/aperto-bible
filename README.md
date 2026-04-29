# Aperto Bible

**An open-source Bible translation for everyone.**

Aperto (Latin: "open") is a modern Bible translation project released under [CC BY-SA 4.0](LICENSE). Our goal: make Scripture accessible, understandable, and alive — in every language, with cultural context built in.

## What Makes Aperto Different

- **Footnotes that explain, not just reference** — Every translation decision is documented inline. Cultural context, textual variants, apologetic notes, and reader helps are woven into the text via USFM footnotes.
- **Chapter-by-chapter structure** — Each chapter is its own file. Small diffs, easy reviews, accessible contributions.
- **Multi-language from day one** — Luke chapter 1 is available in 28 languages. Full Luke in German, English, and Polish.
- **AI-assisted, human-governed** — We use AI tools for drafting, but every text goes through review. Pull requests welcome.

## Current Coverage

### Complete Books

| Book | Languages |
|------|-----------|
| **Luke (Lukas)** | 🇩🇪 German (24 chapters), 🇬🇧 English (24 chapters), 🇵🇱 Polish (24 chapters) |
| **Psalms** | 🇩🇪 German (Ps 1–8, 23) |

### Luke Chapter 1 — 28 Languages

Arabic, Bulgarian, Catalan, Czech, Danish, Dutch, English, Estononian, Finnish, French, German, Greek, Hungarian, Irish, Italian, Croatian, Latvian, Lithuanian, Maltese, Norwegian (Bokmål), Polish, Portuguese, Romanian, Russian, Slovak, Slovenian, Albanian, Spanish, Swedish, Turkish, Ukrainian

## Repository Structure

```
aperto-bible/
├── texts/
│   ├── de/42-LUK/          ← German Luke (per-chapter USFM files)
│   ├── en/42-LUK/          ← English Luke
│   ├── pl/42-LUK/          ← Polish Luke
│   ├── de/19-PSA/          ← German Psalms
│   └── luke-01/            ← Luke chapter 1 in 28 languages
│       ├── ar/             ← Arabic
│       ├── bg/             ← Bulgarian
│       └── ...
├── commentary/             ← Supplementary commentary (optional)
├── scripts/
│   ├── merge-to-book.sh    ← Merge chapters into single-book USFM
│   └── validate.sh         ← Basic USFM syntax validation
├── .github/workflows/      ← CI validation on PRs
└── metadata/               ← Book metadata and translation info
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
- 📧 hello@treppmann.design — Contact

---

*Aperto — because the Word should be open.*
