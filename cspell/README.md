# Russian CSpell dictionary

This directory contains a CSpell-compatible Russian dictionary generated from the validated ruspell-lab Hunspell package.

Release version: `1.0.9`.

## Contents

- `cspell.config.yaml` — reusable CSpell configuration fragment.
- `cspell-ext.json` — CSpell dictionary extension metadata.
- `dictionaries/ru_RU.txt.gz` — gzipped UTF-8 word list generated from the
  repository-root `ru_RU.aff` and `ru_RU.dic`.
- `dictionaries/manifest.json` — deterministic build manifest with counts and checksums.
- `smoke/positive.txt` — words that must be accepted.
- `smoke/negative.txt` — words that must be rejected.

## How to use in another project

Copy this `cspell/` directory into the target repository and add this to the target repository's root `cspell.config.yaml`:

    import:
      - ./cspell/cspell.config.yaml

Then run CSpell, for example:

    npx cspell "**/*.{md,txt,js,ts,json,yaml,yml}"

If the project already has a CSpell configuration, keep its existing settings and add only the `import` entry above.

## How to validate this package

First verify the published word-list checksum against
`dictionaries/manifest.json`:

    sha256sum dictionaries/ru_RU.txt.gz

For an actual CSpell smoke test from the repository root, run:

    npx --yes cspell@9 --config cspell/cspell.config.yaml cspell/smoke/positive.txt

Every word in `smoke/negative.txt` must be reported as an unknown word.

## Regeneration

The package is generated from the root Hunspell sources in the validated
ruspell-lab release workspace; it is not hand-edited.

## Build summary

- Source Hunspell encoding: `KOI8-R`.
- Source dictionary entries: `575484`.
- Generated unique CSpell words: `2367159`.
- Dictionary file: `dictionaries/ru_RU.txt.gz`.

## License and provenance

The CSpell package is derived from this repository's root Hunspell source files
and follows the same licensing and provenance boundary documented in `LICENSE`
and `README.md`.
