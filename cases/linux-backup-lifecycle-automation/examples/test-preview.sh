#!/usr/bin/env bash
set -euo pipefail
here=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
workspace=$(mktemp -d)
trap 'rm -rf -- "$workspace"' EXIT
mkdir -p "$workspace/source" "$workspace/archive"

for day in 01 02 03 04; do
  file="$workspace/source/2026-01-${day}_23:00:00-backup.sql"
  printf 'synthetic backup %s\n' "$day" > "$file"
  touch -d '10 days ago' "$file"
done

result=$(bash "$here/retention-preview.sh" "$workspace/source" "$workspace/archive")
printf '%s\n' "$result"
[[ $(grep -c '^CANDIDATE ' <<< "$result") == 2 ]]
[[ $(grep -c '^KEEP recent ' <<< "$result") == 2 ]]
[[ $(find "$workspace/source" -type f | wc -l) == 4 ]]
[[ $(find "$workspace/archive" -type f | wc -l) == 0 ]]
echo 'PASS: 2 candidates, 2 preserved, zero changed files.'
