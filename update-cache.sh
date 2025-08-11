#!/bin/bash
file="$1"
hash=$(sha1sum "$file" | awk '{ print $1 }')
echo "$file $hash" >> .dircache/index
echo "indexed $file: $hash"