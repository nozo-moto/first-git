#!/bin/bash
# show-diff.sh
if [ $# -eq 0 ]; then
  files=$(awk '{print $1}' .dircache/index)
else
  files="$@"
fi
for f in $files; do
  if [ -f "$f" ]; then
    diff -u <(echo "old content?") "$f"
  else
    echo "$f: no such file"
  fi
done