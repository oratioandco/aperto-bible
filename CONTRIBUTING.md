# Contributing to Aperto Bible

Thank you for your interest in contributing! This document explains how.

## Ways to Contribute

### 1. Fix a Translation Error

Found a mistake? Open a pull request.

1. Navigate to the file in the `texts/` directory
2. Click the edit button (pencil icon)
3. Make your correction
4. Add a clear commit message explaining what changed and why
5. Open a Pull Request

### 2. Improve a Footnote

Our footnotes are the heart of Aperto. To improve one:

- Edit the footnote directly in the USFM file
- Footnotes use this structure: `\f + \fr REF \fk CATEGORY \fq TERM \ft EXPLANATION\f*`
- Keep explanations concise (1-3 sentences)
- Cite sources where possible

### 3. Add a New Language

To translate Luke chapter 1 into a new language:

1. Create a new directory under `texts/luke-01/{language-code}/`
2. Use the template in `templates/usfm_templates/template_ab-de.usfm` as a starting point
3. Follow the naming convention: `42LUK01_ab-{lang}.usfm`
4. Maintain all USFM markers from the source text
5. Translate footnotes too — cultural context matters in every language

### 4. Translate Additional Chapters

1. Pick the next chapter that hasn't been translated yet
2. Follow the same structure and markers as existing chapters
3. Name the file: `42LUK{NN}_ab-{lang}.usfm` (zero-padded chapter number)

## Translation Principles

See [STYLE-GUIDE.md](STYLE-GUIDE.md) for detailed translation guidelines.

**Core principles:**
- **Faithful, not literal** — Capture meaning, not just words
- **Readable aloud** — If it sounds awkward spoken, rework it
- **Honest about ambiguity** — When the original is unclear, say so in a footnote rather than forcing an interpretation
- **Cultural context** — Help modern readers understand the ancient world
- **No denominational bias** — Present the text, not a theological system

## USFM Formatting Rules

1. Every file starts with `\id`, `\usfm 3.0`, `\ide UTF-8`, and book headers
2. Chapters use `\c {number}`
3. Verses use `\v {number}`
4. Footnotes: `\f + \fr REF \fk CATEGORY \fq TERM \ft TEXT\f*`
5. Added words (not in original): `\add text\add*`
6. Words of Jesus: `\wj text\wj*` (for red-letter editions)
7. Section headings: `\s1 Title`
8. Paragraph breaks: `\p`
9. Poetry indentation: `\q1`, `\q2`

## Pull Request Guidelines

- **One chapter per PR** — Easier to review
- **Clear title** — e.g. "DE: Fix Luke 5:8 translation" or "FR: Add Luke chapter 1"
- **Describe changes** — What changed and why
- **Reference issues** — If applicable, link to the issue number

## Code of Conduct

Be respectful. We're working on something that matters to people deeply. Disagreements about translation choices are expected — handle them with grace.

## Questions?

Open a [GitHub Discussion](https://github.com/oratioandco/aperto-bible/discussions) or [open an issue](https://github.com/oratioandco/aperto-bible/issues).
