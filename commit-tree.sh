#!/bin/bash
# commit-tree.sh
tree="$1"
commit_message=$(cat -)
author="${COMMITTER_NAME:-Unknown} <${COMMITTER_EMAIL:-unknown}>"
timestamp=$(date -R)

data="tree $tree
author $author $timestamp

$commit_message"
commit_hash=$(echo -n "$data" | sha1sum | awk '{print $1}')

mkdir -p .dircache/objects
echo "$data" > .dircache/objects/"$commit_hash"
echo "
Commiting initial tree
$commit_hash"