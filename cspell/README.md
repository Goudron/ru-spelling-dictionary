# Russian CSpell dictionary

This directory contains a CSpell-compatible Russian dictionary generated from the validated ruspell-lab Hunspell package.

Release version: `1.0.7`.

## Contents

- `cspell.config.yaml` — reusable CSpell configuration fragment.
- `cspell-ext.json` — CSpell dictionary extension metadata.
- `dictionaries/ru_RU.txt.gz` — gzipped UTF-8 word list generated from `dictionary/ru_RU.aff` and `dictionary/ru_RU.dic`.
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

From the ruspell-lab repository root:

    python3 scripts/test/validate_cspell_dictionary.py --release-version 1.0.7 --progress-interval 2

For an actual CSpell CLI smoke test, install CSpell in the repository or make it available on `PATH`, then run:

    python3 scripts/test/validate_cspell_dictionary.py --release-version 1.0.7 --require-cspell --progress-interval 2

If your Node.js version cannot run the latest CSpell release, pin the CLI explicitly, for example:

    python3 scripts/test/validate_cspell_dictionary.py --release-version 1.0.7 --cspell-command "npx --yes cspell@9" --require-cspell --progress-interval 2

## Regeneration

The package is generated, not hand-edited:

    python3 scripts/release/build_cspell_dictionary.py --release-version 1.0.7 --progress-interval 2

## Build summary

- Source Hunspell encoding: `KOI8-R`.
- Source dictionary entries: `550087`.
- Generated unique CSpell words: `2340963`.
- Dictionary file: `dictionaries/ru_RU.txt.gz`.

## License and provenance

The CSpell package is derived from the ruspell-lab `dictionary/` package and follows the same licensing and provenance boundary documented in `dictionary/LICENSE` and `dictionary/README.md`.
