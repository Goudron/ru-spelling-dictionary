#!/usr/bin/env bash
# Build a LibreOffice/OpenOffice spelling-dictionary extension from root Hunspell files.
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
if ! command -v zip >/dev/null 2>&1; then
  printf '%s\n' 'Missing required command: zip' >&2
  exit 1
fi
if ! command -v python3 >/dev/null 2>&1; then
  printf '%s\n' 'Missing required command: python3' >&2
  exit 1
fi

required_files=(
  "${repo_root}/ru_RU.aff"
  "${repo_root}/ru_RU.dic"
  "${repo_root}/LICENSE"
  "${repo_root}/README.md"
  "${repo_root}/libreoffice-extension/META-INF/manifest.xml"
  "${repo_root}/libreoffice-extension/dictionaries.xcu"
  "${repo_root}/libreoffice-extension/description.xml"
)
for required_file in "${required_files[@]}"; do
  if [[ ! -f "${required_file}" ]]; then
    printf 'Missing required file: %s\n' "${required_file}" >&2
    exit 1
  fi
done

temporary_dir="$(mktemp -d "${TMPDIR:-/tmp}/ru-spelling-dictionary-oxt.XXXXXX")"
trap 'rm -rf -- "${temporary_dir}"' EXIT
output_dir="${repo_root}/dist"
output_path="${output_dir}/ru-spelling-dictionary-${release_version}.oxt"
mkdir -p "${temporary_dir}/META-INF" "${output_dir}"

cp -- "${repo_root}/ru_RU.aff" "${repo_root}/ru_RU.dic" "${repo_root}/LICENSE" "${repo_root}/README.md" "${temporary_dir}/"
cp -- "${repo_root}/libreoffice-extension/META-INF/manifest.xml" "${temporary_dir}/META-INF/manifest.xml"
cp -- "${repo_root}/libreoffice-extension/dictionaries.xcu" "${temporary_dir}/dictionaries.xcu"
RELEASE_VERSION="${release_version}" DESCRIPTION_TEMPLATE="${repo_root}/libreoffice-extension/description.xml" DESCRIPTION_OUTPUT="${temporary_dir}/description.xml" python3 - <<'PY'
import os
from pathlib import Path

source = Path(os.environ["DESCRIPTION_TEMPLATE"]).read_text(encoding="utf-8")
version = os.environ["RELEASE_VERSION"]
if "@VERSION@" not in source:
    raise SystemExit("description.xml is missing the @VERSION@ placeholder")
Path(os.environ["DESCRIPTION_OUTPUT"]).write_text(source.replace("@VERSION@", version), encoding="utf-8", newline="\n")
PY

find "${temporary_dir}" -type f -exec touch -t 202601010000 {} +
rm -f -- "${output_path}"
(
  cd "${temporary_dir}"
  LC_ALL=C find . -type f -printf '%P\n' | LC_ALL=C sort | zip -X -q "${output_path}" -@
)
printf '%s\n' "${output_path}"
