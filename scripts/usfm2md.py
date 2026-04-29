#!/usr/bin/env python3
"""Convert USFM files to readable Markdown for GitHub browsing."""

import re
import sys
import os
from pathlib import Path


def convert_usfm_to_md(text: str) -> str:
    lines = text.split('\n')
    output = []
    footnotes = []
    fn_num = 0

    for line in lines:
        stripped = line.strip()

        # Skip metadata
        if re.match(r'^\\(id|usfm|ide|toc\d?)\s', stripped):
            continue

        # Book header
        m = re.match(r'^\\h\s+(.+)$', stripped)
        if m:
            output.append(f'\n# {m.group(1)}\n')
            continue

        # Book title
        m = re.match(r'^\\mt\d?\s+(.+)$', stripped)
        if m:
            output.append(f'\n# {m.group(1)}\n')
            continue

        # Chapter
        m = re.match(r'^\\c\s+(\d+)', stripped)
        if m:
            output.append(f'\n---\n\n## Kapitel {m.group(1)}\n')
            continue

        # Section heading
        m = re.match(r'^\\s\d?\s+(.+)$', stripped)
        if m:
            output.append(f'\n### {m.group(1)}\n')
            continue

        # Paragraph break
        if re.match(r'^\\p\s*$', stripped):
            output.append('')
            continue
        if re.match(r'^\\p\s', stripped):
            output.append('')
            continue

        # Blank line
        if re.match(r'^\\b\s*$', stripped):
            output.append('')
            continue

        # Poetry
        m = re.match(r'^\\q\d?\s+(.+)$', stripped)
        if m:
            output.append(f'> {m.group(1)}')
            continue
        if re.match(r'^\\q\d?\s*$', stripped):
            continue

        # Skip marker-only lines
        if re.match(r'^\\[a-z]+$', stripped):
            continue

        # Empty lines
        if not stripped:
            continue

        # Process inline markers
        processed = stripped

        # Verse numbers: \v N → **N**
        processed = re.sub(r'\\v\s+(\d+)\s', r' **\1** ', processed)
        processed = re.sub(r'^\\v\s+(\d+)\s', r'**\1** ', processed)

        # Footnotes: \f + ... \f* → [^N]
        def replace_footnote(match):
            nonlocal fn_num
            fn_num += 1
            fn_text = match.group(1)

            fn_cat = ''
            fn_term = ''
            fn_body = ''

            cat_m = re.search(r'\\fk\s+([^\\]+)', fn_text)
            if cat_m:
                fn_cat = cat_m.group(1).strip()
            term_m = re.search(r'\\fq\s+([^\\]+)', fn_text)
            if term_m:
                fn_term = term_m.group(1).strip()
            body_m = re.search(r'\\ft\s+(.+)', fn_text)
            if body_m:
                fn_body = body_m.group(1).strip()

            entry = f'[^{fn_num}]: '
            if fn_cat:
                entry += f'**{fn_cat}**'
                if fn_term:
                    entry += f' — *{fn_term}*:'
                entry += ' '
            entry += fn_body

            footnotes.append(entry)
            return f'[^{fn_num}]'

        processed = re.sub(r'\\f\s+\+(.*?)\\f\*', replace_footnote, processed)

        # Added words: \add ... \add* → *italic*
        processed = re.sub(r'\\add\s+', '*', processed)
        processed = re.sub(r'\s*\\add\*', '*', processed)

        # Words of Jesus: \wj ... \wj* → **bold**
        processed = re.sub(r'\\wj\s+', '**', processed)
        processed = re.sub(r'\\wj\*', '**', processed)

        # Cross-references in section headers
        processed = re.sub(r'\\r\s+', '', processed)

        # Clean remaining markers
        processed = re.sub(r'\\[a-z]+\*', '', processed)

        if processed.strip():
            output.append(processed.strip())

    # Add footnotes
    if footnotes:
        output.append('\n---\n')
        output.append('\n## Anmerkungen\n')
        for fn in footnotes:
            output.append(fn)

    return '\n'.join(output)


def main():
    if len(sys.argv) < 2:
        print("Usage: usfm2md.py <file.usfm> | --all")
        sys.exit(1)

    if sys.argv[1] == '--all':
        count = 0
        for usfm_file in sorted(Path('texts').rglob('*.usfm')):
            md_file = usfm_file.with_suffix('.md')
            with open(usfm_file, 'r', encoding='utf-8') as f:
                usfm_text = f.read()
            md_text = convert_usfm_to_md(usfm_text)
            with open(md_file, 'w', encoding='utf-8') as f:
                f.write(md_text)
            print(f'  {usfm_file.name} → {md_file.name}')
            count += 1
        print(f'\nDone! {count} files converted.')
    else:
        with open(sys.argv[1], 'r', encoding='utf-8') as f:
            usfm_text = f.read()
        print(convert_usfm_to_md(usfm_text))


if __name__ == '__main__':
    main()
