#!/system/bin/sh

DEST_PATH="/data/vendor/thh"
FILES_MOVED="/data/vendor/thh/files_moved"
SRC_PATH="/data/thh"

if [ ! -f "$FILES_MOVED" ]; then
  for i in "$SRC_PATH/"*; do
    dest_path=$DEST_PATH/"${i#$SRC_PATH/}"
    if [ -d "$i" ]; then
      mkdir -p $dest_path -m 755
      mv $i "$DEST_PATH"
      find $dest_path -print0 | while IFS= read -r -d '' file
        do
          chgrp system "$file"
        done
    fi
  done
  restorecon -R "$DEST_PATH/"*
  echo 1 > "$FILES_MOVED"
fi
