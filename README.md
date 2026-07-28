# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary intended for use with Mozilla Firefox, Mozilla Thunderbird, LibreOffice, CSpell, and other Hunspell-compatible applications.

The dictionary is distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.5

Release 1.0.5 substantially improves correction suggestions while preserving all 550,291 Hunspell entries and their morphology from 1.0.4.

- Held-out top-1 correct suggestions: 109 → 146.
- Held-out top-5 correct suggestions: 165 → 192.
- Held-out targets found at any rank: 169 → 197.
- The user-reported `сабака` → `собака` correction is ranked first in Hunspell, Firefox, and LibreOffice.
- `ru_RU.aff` SHA-256: `3c77ccd923ebfc686fd7ff7a33c5b42b762634d42e0ecd53081a58f09fc4ab74`
- `ru_RU.dic` SHA-256: `d1b727cd2c059e7ec7850808fe610ae2ca5ea07de768484ac6344aba89947438`
- Firefox/Thunderbird XPI SHA-256: `fb720f2309f8eb7b954fb0e971235132d1c07b05ea759814567701ecb8c3cc25`
- CSpell word list: 2,342,788 UTF-8 words, SHA-256 `ec026b1bb187e11fb20ac863c8d4c15fb304ec16126c47d9730a8635060083b2`.

The release changes only Hunspell suggestion directives (`TRY` and `REP`). Direct recognition, dictionary entries, affix morphology, and the generated CSpell word list are unchanged from 1.0.4.

## Files

- `ru_RU.aff` and `ru_RU.dic` — source Hunspell dictionary.
- `LICENSE` — licensing information and required notices.
- `mozilla-add-on/` — ready-to-upload Mozilla dictionary add-on XPI.
- `cspell/` — CSpell package generated from the same Hunspell sources.
- `libreoffice-extension/` — metadata used to build the LibreOffice/OpenOffice OXT.

## LibreOffice and OpenOffice extension

Build and validate the extension from the repository root:

```bash
scripts/build-libreoffice-oxt.sh
scripts/validate-libreoffice-oxt.sh
```

The generated file is `dist/ru-spelling-dictionary-<version>.oxt`. Install it through LibreOffice Extension Manager or run `unopkg add --force ./dist/ru-spelling-dictionary-<version>.oxt`, then restart LibreOffice.

## Encoding and privacy

The Hunspell files use `SET KOI8-R`; do not recode them independently. The packages contain dictionary data and metadata only: no executable add-on scripts, permissions, telemetry, analytics, or network access.

## Licensing

Copyright © 2026 Valery Ledovskoy. See `LICENSE` for MPL-2.0 terms and preserved upstream notices.
