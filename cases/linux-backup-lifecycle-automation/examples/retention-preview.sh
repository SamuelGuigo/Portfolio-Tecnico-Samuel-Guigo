#!/usr/bin/env bash
# Independent PUBLIC educational example. Never copies, moves or deletes backups.
set -euo pipefail
export LC_ALL=C

usage() {
  printf 'Usage: %s SOURCE_DIR DEST_DIR [KEEP_NEWEST] [MIN_AGE_HOURS]\n' "$0" >&2
  exit 2
}

(( $# >= 2 && $# <= 4 )) || usage
source_dir=$1
dest_dir=$2
keep_newest=${3:-2}
min_age_hours=${4:-48}

[[ $keep_newest =~ ^[0-9]+$ && $min_age_hours =~ ^[0-9]+$ ]] || usage
[[ -d $source_dir && -d $dest_dir ]] || { echo 'ERROR: both directories must exist.' >&2; exit 1; }
[[ ! -L $source_dir && ! -L $dest_dir ]] || { echo 'ERROR: symlink directories are refused.' >&2; exit 1; }

source_dir=$(realpath -e -- "$source_dir")
dest_dir=$(realpath -e -- "$dest_dir")
[[ $source_dir != "$dest_dir" && $source_dir != / && $dest_dir != / ]] || {
  echo 'ERROR: unsafe directory selection.' >&2; exit 1;
}

# Synthetic filenames, intentionally unrelated to actual production naming.
shopt -s nullglob
files=("$source_dir"/20??-??-??_??:??:??-backup.sql)
shopt -u nullglob
count=${#files[@]}
now=$(date +%s)
cutoff=$((count - keep_newest))
(( cutoff > 0 )) || cutoff=0

printf 'DRY-RUN ONLY | files=%d | keep_newest=%s | min_age_hours=%s\n' \
  "$count" "$keep_newest" "$min_age_hours"
printf 'No files will be copied, moved, overwritten or deleted.\n'

for ((i=0; i<count; i++)); do
  file=${files[i]}
  name=${file##*/}
  [[ -f $file && ! -L $file ]] || { printf 'SKIP not_regular %s\n' "$name"; continue; }
  if (( i >= cutoff )); then
    printf 'KEEP recent %s\n' "$name"
    continue
  fi
  mtime=$(stat -c %Y -- "$file")
  if (( (now - mtime) < min_age_hours * 3600 )); then
    printf 'SKIP too_young %s\n' "$name"
    continue
  fi
  if [[ -e "$dest_dir/$name" || -L "$dest_dir/$name" ]]; then
    printf 'SKIP destination_exists %s\n' "$name"
    continue
  fi
  printf 'CANDIDATE migration_review_required %s\n' "$name"
done

printf 'Review mountpoints, open handles, backup-job concurrency, free space, integrity and rollback before any actual migration.\n