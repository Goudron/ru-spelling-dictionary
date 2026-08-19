# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary for Mozilla,
LibreOffice, CSpell, and other Hunspell-compatible applications. It is
distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.8

Version 1.0.8 aggressively expands coverage from two independent Russian
literature corpora. It adds 25,388 exact Hunspell entries selected only when
they are known to pymorphy3 or accepted by the independent FBE comparator.
Historical and name-like forms are included; all `е/ё` candidates remain
outside this delta.

- 91,921 prior exposed or curated error forms remain rejected.
- 205 explicitly excluded D108 forms remain rejected.
- `ru_RU.aff` SHA-256: `e8dc652231a2c0c34b04d9c9acc63f801c20111865f05e57091c3dc81c786136`
- `ru_RU.dic` SHA-256: `b565654f9942fea6c5a7ac0f748e2fb0e33b49eff5f951720d5f7b0350d65b77`
- Dictionary entries: 575,475.
- Firefox/Thunderbird XPI SHA-256: `8bcbab994b72a99d5c0006ce16015d543ea8e016966fc5dc6aafe9a611c92993`.
- CSpell word list: 2,357,415 UTF-8 forms,
  SHA-256 `3519d33eb85dc5d3821b9d1af7b33ef723579e72f4633d495d41762a4b7dd2b7`.

## Files

- `ru_RU.aff` and `ru_RU.dic` — source Hunspell dictionary.
- `mozilla-add-on/` — ready-to-upload Mozilla dictionary XPI.
- `cspell/` — CSpell package generated from the same sources.
- `libreoffice-extension/` — metadata and scripts to build the OXT.

The package contains dictionary data and metadata only: no executable add-on
scripts, permissions, telemetry, analytics, or network access.
