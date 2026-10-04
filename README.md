# Russian Hunspell Dictionary

This repository contains a modern Russian Hunspell dictionary for Mozilla,
LibreOffice, CSpell, and other Hunspell-compatible applications. It is
distributed under the Mozilla Public License 2.0 (MPL 2.0).

## Release 1.0.9

Version 1.0.9 completes the remaining Issue #1, #5, and #6 work.

- Issue #1 residual acceptances received word-level review; none has evidence
  sufficient for a new automatic block.
- Issue #5 adds lower-case `к` to `TRY`, the supplied Russian `KEY` layout,
  and minimal `REP о а`; `корета` now suggests `карета` first.
- Issue #6 applies its verified MPL-2.0 patch despite the recorded source ZIP
  checksum mismatch. It keeps exact `кругляш`, adds exact `омуток` and
  `омутка`, accepts all 55 issue forms, and preserves protected rejections.
- 91,921 independently validated protected rejections remain rejected.
- `ru_RU.aff` SHA-256: `aebb6f2d4f80c38f3ed559b74aa6f178564cd98704f61970168f5436375f8448`.
- `ru_RU.dic` SHA-256: `a76c323b7342de1a2c26f11713603604e4c9a7b7ef45631fab2960f10450fb2d`.
- Dictionary entries: 575,484.
- Firefox/Thunderbird XPI SHA-256: `6e2795a52dc2e4be51fa4c7c73c86536bb838db00c6d9124f315faa25ef1dd28`.
- LibreOffice OXT SHA-256: `5add0fdfdd518142464109ada3d8a6e4fdb7d3bf0f3dd0ceed3e485259f516f5`.
- CSpell word list: 2,367,159 UTF-8 forms,
  SHA-256 `8ac7fbc26204d437d3e8be8609ba6a6e2a0afae17548cdfa0ff01c13de55e3fa`.

The XPI, OXT (with its checksum), Hunspell ZIP, and CSpell gzip are available
as [GitHub Release assets for 1.0.9](https://github.com/Goudron/ru-spelling-dictionary/releases/tag/v1.0.9).

## Files

- `ru_RU.aff` and `ru_RU.dic` — source Hunspell dictionary.
- `mozilla-add-on/` — current 1.0.9 Firefox/Thunderbird XPI, matching the
  GitHub Release asset.
- `cspell/` — CSpell package generated from the same sources.
- `libreoffice-extension/` — metadata and scripts to build the OXT; the OXT
  itself is a GitHub Release asset, not a tracked source file.

The package contains dictionary data and metadata only: no executable add-on
scripts, permissions, telemetry, analytics, or network access.
