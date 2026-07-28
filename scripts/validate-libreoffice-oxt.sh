#!/usr/bin/env bash
# Validate the structure and source binding of a built LibreOffice extension.
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/.." && pwd)"
release_version="${1:-}"
if [[ -z "${release_version}" ]]; then
  release_version="$(git -C "${repo_root}" describe --tags --exact-match 2>/dev/null | sed 's/^v//' || true)"
fi
if [[ -z "${release_version}" ]]; then
  release_version="$(sed -n 's/^## Release \([0-9][0-9.]*\)$/\1/p' "${repo_root}/README.md" | head -n 1)"
fi
if [[ -z "${release_version}" ]]; then
  printf '%s\n' 'Unable to determine the release version; pass it as the first argument.' >&2
  exit 1
fi

archive_path="${repo_root}/dist/ru-spelling-dictionary-${release_version}.oxt"
if [[ ! -f "${archive_path}" ]]; then
  printf 'Missing OXT archive: %s\n' "${archive_path}" >&2
  exit 1
fi
if ! command -v python3 >/dev/null 2>&1; then
  printf '%s\n' 'Missing required command: python3' >&2
  exit 1
fi

ARCHIVE_PATH="${archive_path}" REPO_ROOT="${repo_root}" RELEASE_VERSION="${release_version}" python3 - <<'PY'
import os
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET

archive_path = Path(os.environ["ARCHIVE_PATH"])
repo_root = Path(os.environ["REPO_ROOT"])
version = os.environ["RELEASE_VERSION"]
required = {
    "LICENSE",
    "META-INF/manifest.xml",
    "README.md",
    "description.xml",
    "dictionaries.xcu",
    "ru_RU.aff",
    "ru_RU.dic",
}
with zipfile.ZipFile(archive_path) as archive:
    names = set(archive.namelist())
    if names != required:
        raise SystemExit(f"unexpected OXT contents: {sorted(names)}")
    if any(name.startswith(("./", "libreoffice-extension/", "ru-spelling-dictionary-")) for name in names):
        raise SystemExit("OXT contains an extra top-level directory")
    if archive.read("ru_RU.aff") != (repo_root / "ru_RU.aff").read_bytes():
        raise SystemExit("packaged ru_RU.aff differs from the source")
    if archive.read("ru_RU.dic") != (repo_root / "ru_RU.dic").read_bytes():
        raise SystemExit("packaged ru_RU.dic differs from the source")
    if b"SET KOI8-R" not in archive.read("ru_RU.aff"):
        raise SystemExit("packaged ru_RU.aff does not declare SET KOI8-R")
    manifest = ET.fromstring(archive.read("META-INF/manifest.xml"))
    dictionaries = ET.fromstring(archive.read("dictionaries.xcu"))
    description = ET.fromstring(archive.read("description.xml"))

manifest_ns = "{http://openoffice.org/2001/manifest}"
entries = manifest.findall(f"{manifest_ns}file-entry")
if not any(entry.get(f"{manifest_ns}full-path") == "dictionaries.xcu" and entry.get(f"{manifest_ns}media-type") == "application/vnd.sun.star.configuration-data" for entry in entries):
    raise SystemExit("manifest.xml does not register dictionaries.xcu")
if "%origin%/ru_RU.aff %origin%/ru_RU.dic" not in "".join(dictionaries.itertext()):
    raise SystemExit("dictionaries.xcu does not reference both root dictionary files")
if "DICT_SPELL" not in "".join(dictionaries.itertext()) or "ru-RU" not in "".join(dictionaries.itertext()):
    raise SystemExit("dictionaries.xcu does not register DICT_SPELL for ru-RU")
description_ns = "{http://openoffice.org/extensions/description/2006}"
if description.find(f"{description_ns}identifier").get("value") != "org.goudron.ru-spelling-dictionary":
    raise SystemExit("description.xml has an unexpected extension identifier")
if description.find(f"{description_ns}version").get("value") != version:
    raise SystemExit("description.xml version does not match the output file name")
names = {(node.get("lang"), node.text) for node in description.findall(f".//{description_ns}display-name/{description_ns}name")}
if ("ru", "Современный русский орфографический словарь") not in names or ("en", "Modern Russian Spelling Dictionary") not in names:
    raise SystemExit("description.xml is missing required localized names")
if "Valery Ledovskoy" not in "".join(description.itertext()) or description.find(f"{description_ns}platform").get("value") != "all":
    raise SystemExit("description.xml publisher or platform is invalid")
print(f"LibreOffice OXT validation passed: {archive_path}")
PY
