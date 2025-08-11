# update-ref.sh
#!/bin/bash
ref="$1"
oid="$2"
echo "$oid" > ".$ref"
echo "$oid" > .dircache/HEAD
echo "Updated $ref -> $oid"