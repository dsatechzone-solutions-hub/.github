#!/usr/bin/env bash
# Sync GitHub labels from .github/labels.yml to a repository.
# Usage: ./scripts/sync-labels.sh [--repo OWNER/REPO]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LABELS_FILE="${ROOT}/.github/labels.yml"
REPO="${1:-dsatechzone-solutions-hub/.github}"

if [[ "${1:-}" == "--repo" ]]; then
  REPO="${2:?Usage: $0 [--repo OWNER/REPO]}"
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "FAIL: gh CLI required" >&2
  exit 1
fi

if [[ ! -f "${LABELS_FILE}" ]]; then
  echo "FAIL: missing ${LABELS_FILE}" >&2
  exit 1
fi

if ! gh repo view "${REPO}" >/dev/null 2>&1; then
  echo "FAIL: cannot access repo ${REPO}" >&2
  exit 1
fi

name=""
color=""
description=""
count=0

flush_label() {
  [[ -n "${name}" ]] || return 0
  gh label create "${name}" \
    --repo "${REPO}" \
    --color "${color}" \
    --description "${description}" \
    --force >/dev/null
  echo "  ${name}"
  count=$((count + 1))
  name=""
  color=""
  description=""
}

while IFS= read -r line || [[ -n "${line}" ]]; do
  line="${line%$'\r'}"
  case "${line}" in
    "- name:"*)
      flush_label
      name="${line#- name: }"
      name="${name#\"}"
      name="${name%\"}"
      ;;
    "  color:"*)
      color="${line#  color: }"
      ;;
    "  description:"*)
      description="${line#  description: }}"
      description="${description#\"}"
      description="${description%\"}"
      ;;
  esac
done < "${LABELS_FILE}"

flush_label

echo "OK: synced ${count} labels to ${REPO}"
