#!/bin/bash

files=$(find . -maxdepth 1 -type f)
IFS=$'\n' # Set Internal Field Separator to newline to handle spaces in filenames

for file in $files; do
    # Extract the creation year of the file 
    creation_year=$(stat -f "%Sm" -t "%Y" "$file") # for mac
    # creation_year=$(stat -c %Y "$file" | date +'%Y' -f -) # for linux

    mkdir -p "$creation_year"
    mv "$file" "$creation_year/$(basename "$file")"
done
