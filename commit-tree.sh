#!/bin/bash
# commit-tree.sh
tree="$1"
commit_message=$(cat -)
author="${COMMITTER_NAME:-Unknown} <${COMMITTER_EMAIL:-unknown}>"
timestamp=$(date -R)

parent=""
if [ -f .dircache/HEAD ]; then
  prev=$(cat .dircache/HEAD) 
  if [ -n "$prev" ]; then parent="parent $prev"; fi
fi

data="tree $tree
$parent
author $author $timestamp

$commit_message"
commit_hash=$(echo -n "$data" | sha1sum | awk '{print $1}')

mkdir -p .dircache/objects
echo "$data" > .dircache/objects/"$commit_hash"
echo "$commit_hash"