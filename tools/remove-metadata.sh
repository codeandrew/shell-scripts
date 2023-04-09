#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 file"
  exit 1
fi

FILE="$1"
MIME_TYPE=$(file -b --mime-type "$FILE")

case "$MIME_TYPE" in
  application/pdf)
    exiftool -Author= -Creator= -Producer= -CreationDate= -ModDate= -overwrite_original "$FILE"
    ;;
  application/vnd.openxmlformats-officedocument.wordprocessingml.document)
    exiftool -Creator= -LastModifiedBy= -Created= -Modified= -Company= -TotalEditTime= -Revision= -overwrite_original "$FILE"
    ;;
  image/jpeg|image/png)
    exiftool -Artist= -Copyright= -DateTimeOriginal= -GPSLatitude= -GPSLongitude= -GPSAltitude= -Make= -Model= -Software= -UserComment= -overwrite_original "$FILE"
    ;;
  *)
    echo "Unsupported file type: $MIME_TYPE"
    exit 1
    ;;
esac

echo "Metadata removed from $FILE."
