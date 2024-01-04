#!/bin/bash

files=$(find . -maxdepth 1 -type f)

for file in $files; do
    # Extract the creation year of the file
    creation_year=$(stat -c %Y "$file" | date +'%Y' -f -)

    mkdir -p "$creation_year"
    mv "$file" "$creation_year/"
done
