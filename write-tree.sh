#!/bin/bash
# write-tree.sh
contents=$(sort .dircache/index | tr '\n' ' ')
tree_hash=$(echo -n "$contents" | sha1sum | awk '{ print $1 }')
echo "$tree_hash"