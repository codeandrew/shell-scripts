#!/bin/bash
sudo apt-get install transmission-cli

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Directory containing torrent files
TORRENT_DIR="$HOME/Downloads/torrents"

# Loop through each line in the file
while IFS= read -r line; do
    # Skip empty lines
    [ -z "$line" ] && continue

    # Download the torrent using transmission-cli
    transmission-cli "$line" -w "$TORRENT_DIR"

done < "$1"
