# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary for Mozilla,
LibreOffice, CSpell, and other Hunspell-compatible applications. It is
distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.6

Version 1.0.6 is a narrowly reviewed recognition-quality correction. It
removes 245 direct or stem entries, so 279 confirmed misspelling surfaces from
the reviewed issue evidence are rejected. Valid-word/contextual substitutions
remain outside the word-level dictionary claim.

- D105 held-out suggestion recall at any rank: 197 → 197 of 204.
- All 6,845 D105 suggestion-regression pairs retain their target at some rank.
- `ru_RU.aff` SHA-256: `3c77ccd923ebfc686fd7ff7a33c5b42b762634d42e0ecd53081a58f09fc4ab74`
- `ru_RU.dic` SHA-256: `bda043e46298fd029f2660fa9cd45d3fa6d08bf91bedbff3dac4b9d19cee9fa0`
- Dictionary entries: 550,046.
- Firefox/Thunderbird XPI SHA-256: `ea4aee6448292bd77b925901ef5020b49ef03db4f4e2ff3860bbdfddad85f8b5`.
- CSpell word list: 2,341,007 UTF-8 forms,
  SHA-256 `75de02b45df08e28d36597c274813542fae43d141846722ef23dbee669a4afce`.

## Files

- `ru_RU.aff` and `ru_RU.dic` — source Hunspell dictionary.
- `mozilla-add-on/` — ready-to-upload Mozilla dictionary XPI.
- `cspell/` — CSpell package generated from the same sources.
- `libreoffice-extension/` — metadata and scripts to build the OXT.

The package contains dictionary data and metadata only: no executable add-on
scripts, permissions, telemetry, analytics, or network access.
