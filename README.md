# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary for Mozilla,
LibreOffice, CSpell, and other Hunspell-compatible applications. It is
distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.7

Version 1.0.7 is a focused recognition-quality follow-up. It rejects 69
owner-selected false-accept surfaces from the D107 review. Rows excluded by
the owner and all `е/ё`-equivalent forms are unchanged.

- All 6,585 protected baseline-accepted D105 regression targets remain accepted.
- `ru_RU.aff` SHA-256: `e8dc652231a2c0c34b04d9c9acc63f801c20111865f05e57091c3dc81c786136`
- `ru_RU.dic` SHA-256: `a8c0bff5f6a1e890a8548eeae4adfb1406d3dbb11c2632bb1f190ca281078e38`
- Dictionary entries: 550,087.
- Firefox/Thunderbird XPI SHA-256: `f6c1c8977af50a3d524477d73d2ae5b2e8d03817fee4775d0c28877e9886235f`.
- CSpell word list: 2,340,963 UTF-8 forms,
  SHA-256 `f84112727988c0da38960d5023b1af20fe613b2d0ac22fab8435575a11da621b`.

## Files

- `ru_RU.aff` and `ru_RU.dic` — source Hunspell dictionary.
- `mozilla-add-on/` — ready-to-upload Mozilla dictionary XPI.
- `cspell/` — CSpell package generated from the same sources.
- `libreoffice-extension/` — metadata and scripts to build the OXT.

The package contains dictionary data and metadata only: no executable add-on
scripts, permissions, telemetry, analytics, or network access.
