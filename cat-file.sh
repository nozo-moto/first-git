#!/bin/bash
# cat-file.sh
hash="$1"
tmp=$(mktemp)
cat .dircache/objects/"$hash" 