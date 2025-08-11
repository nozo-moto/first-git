#!/usr/bin/env bash
set -eu

if [ ! -f .dircache/HEAD ]; then
  echo "no HEAD; make a commit first" >&2
  exit 1
fi

oid=$(cat .dircache/HEAD || true)
if [ -z "${oid:-}" ]; then
  echo "HEAD empty" >&2
  exit 1
fi

while [ -n "$oid" ] && [ -f ".dircache/objects/$oid" ]; do
  echo "commit $oid"
  file=".dircache/objects/$oid"
  awk '
    BEGIN{inmsg=0}
    /^$/ {inmsg=1; print ""; next}
    inmsg==0 && /^tree / {print; next}
    inmsg==0 && /^parent / {print; next}
    inmsg==0 && /^author / {print; next}
    inmsg==0 && /^committer / {print; next}
    inmsg==1 {print}
  ' "$file"
  echo
  oid=$(grep -m1 '^parent ' "$file" | awk '{print $2}' || true)
done