# LibreOffice extension

`ru-spelling-dictionary-1.0.9.oxt` is the installable LibreOffice/OpenOffice
spelling-dictionary plugin for release 1.0.9. Verify it with the adjacent
`ru-spelling-dictionary-1.0.9.oxt.sha256` file before installation.

The OXT contains the same Hunspell `ru_RU.aff` and `ru_RU.dic` sources as the
repository root. Do not install the raw Hunspell files as a LibreOffice
extension; install the OXT package instead.

`description.xml`, `dictionaries.xcu`, and `META-INF/manifest.xml` are the
version-independent template used by `scripts/build-libreoffice-oxt.sh` to
build later OXT releases.
