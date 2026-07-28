# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary intended for use with Mozilla Firefox, Mozilla Thunderbird, LibreOffice, and other Hunspell-compatible applications.

The dictionary is distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.4

Release 1.0.4 contains 550,291 Hunspell entries. It expands contemporary Russian coverage while preserving the existing Hunspell morphology and validation boundaries.

- `ru_RU.aff` SHA-256: `e90dfa0b0ec8f346b350e1d514e2ac2ec7595067fbc9335ebdbcc61c4cb2ae38`
- `ru_RU.dic` SHA-256: `d1b727cd2c059e7ec7850808fe610ae2ca5ea07de768484ac6344aba89947438`
- Firefox/Thunderbird dictionary XPI: `mozilla-add-on/russian-spelling-dictionary-1.0.4.xpi` (SHA-256 `9db57c47a1ce8911a6e6ae733a1de06ce1732fdbaa58f2a312d4be3d6e2e3e8b`)
- CSpell word list: 2,342,788 UTF-8 words in `cspell/dictionaries/ru_RU.txt.gz` (SHA-256 `ec026b1bb187e11fb20ac863c8d4c15fb304ec16126c47d9730a8635060083b2`)

## Scope

The dictionary focuses on contemporary Russian usage, including general vocabulary, modern technical vocabulary, browser and application user-interface terminology, and words commonly encountered in Russian-language software documentation and online technical writing.

The word list has been expanded and validated against several real-text sources, including Mozilla Russian localization materials, Habr technical texts, and OpenCorpora. These corpora were used only for evaluation and candidate discovery; the released package contains only the Hunspell dictionary files and public documentation.

## Files

- `ru_RU.aff` — Hunspell affix rules.
- `ru_RU.dic` — Russian dictionary word list.
- `LICENSE` — licensing information and required notices.
- `README.md` — this file.
- `mozilla-add-on/` — ready-to-upload Mozilla dictionary add-on XPI.
- `cspell/` — CSpell package generated from the same Hunspell sources.

## Encoding

The dictionary files use the encoding declared in `ru_RU.aff`. For compatibility with the existing Russian Hunspell ecosystem, `ru_RU.dic` is encoded according to that Hunspell configuration.

## Licensing

This dictionary is released under the Mozilla Public License 2.0 (MPL 2.0).

Copyright © 2026 Valery Ledovskoy.

This package also preserves the required copyright and attribution notices for earlier Russian Hunspell dictionary work incorporated into the final dictionary. See `LICENSE` for the full license text and notices.

## Intended use

The dictionary is intended as a practical Russian spell-checking dictionary for end users and application vendors. It is suitable for packaging with Mozilla Firefox, Mozilla Thunderbird, LibreOffice, and other software that accepts Hunspell dictionaries under MPL 2.0-compatible licensing terms.

## Notes for maintainers

The released package is intentionally minimal. It does not include development corpora, internal analysis data, candidate review files, or generation logs. Future updates should keep this package focused on the public dictionary artifacts required by downstream applications.
