# Aperto Bible — Translation Style Guide

## Philosophy

Aperto exists because the Bible should be **open** — open to read, open to understand, open to improve. Every translation choice is documented. Every cultural gap is bridged. Every reader, whether believer or skeptic, deserves clarity.

## Core Principles

### 1. Faithful, Not Literal

Translate the *meaning*, not just the words. The goal is that a reader today understands what the original audience understood.

**Bad:** "Und es geschah in jenen Tagen" (word-for-word from Greek)
**Good:** "In jenen Tagen" (same meaning, natural German)

### 2. Readable Aloud

The biblical texts were heard before they were read. If a translation sounds stiff when spoken, it needs reworking. Read your translation out loud before submitting.

### 3. Honest About Ambiguity

When the original text is genuinely ambiguous:
- Choose the most likely reading for the main text
- Document alternative readings in a footnote (`\fk TEXT`)
- Never force one interpretation by hiding others

### 4. Cultural Context Built In

Modern readers lack the cultural background the original audience had. Aperto footnotes bridge this gap:
- Historical and social context (`\fk KULTUR`)
- Textual decisions and alternatives (`\fk TEXT`)
- Connections to other Scripture (`\fk KONTEXT`)
- Apologetic helps for skeptical readers (`\fk APOLOGETICS`)
- Accessible explanations of "hard to believe" passages (`\fk UNGLAUBLICH`)

### 5. No Denominational Bias

Aperto is a translation, not a theology. Present the text faithfully without privileging any particular theological tradition. Where traditions disagree, note it in a footnote.

## Language-Specific Guidelines

### German (de)

- Use contemporary German (no archaic forms like "siehe" unless stylistically justified)
- "Du" form for prayer and address to God (standard in German Bible tradition)
- Keep sentence structure clear — break long Greek periods into readable German sentences
- Use German quotation marks: „…" (not "…" or »…«)

### English (en)

- Contemporary, dignified English
- Avoid both archaic ("behold") and overly casual ("God's got this") registers
- Use em-dashes sparingly
- Paragraph breaks where the sense requires them

### Polish (pl)

- Follow Polish typographic conventions
- Contemporary literary Polish
- Maintain the register appropriate for sacred text without being archaic

### Other Languages

- Follow the conventions of contemporary Bible translation in your language
- When in doubt, align with the German or English edition's translation decisions
- Add language-specific footnotes where local cultural context requires it

## Footnote Categories

| Category | Code | Purpose | Example |
|----------|------|---------|---------|
| **Text** | `\fk TEXT` | Translation decision, textual variant | Why we chose this specific word |
| **Culture** | `\fk KULTUR` | Historical/social context | Priestly rotation system in the Temple |
| **Context** | `\fk KONTEXT` | Cross-references and connections | Connection to Malachi's prophecy |
| **Apologetics** | `\fk APOLOGETICS` | Evidence-based reasoning | Manuscript evidence for the text |
| **Hard to believe** | `\fk UNGLAUBLICH` | Accessible explanations | Multiple ways to understand "angels" |

## What Not To Do

- **Don't embellish** — If the text is sparse, keep it sparse. Don't add dramatic flair.
- **Don't harmonize** — If Gospel accounts differ, preserve the differences. Note them.
- **Don't preach** — Footnotes explain, they don't proselytize.
- **Don't plagiarize** — Aperto is original. If you reference another translation, cite it.
- **Don't guess** — If you're unsure about a translation, flag it with a footnote saying "uncertain" rather than guessing.

## Review Criteria

Pull requests are reviewed against these criteria:

1. **Accuracy** — Does it faithfully represent the source text?
2. **Readability** — Does it flow naturally in the target language?
3. **Consistency** — Are key terms translated consistently across chapters?
4. **Footnotes** — Are translation decisions documented? Is cultural context provided?
5. **USFM compliance** — Are markers used correctly?
