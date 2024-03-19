#!/bin/bash

# Fetch the current time for the Manila time zone
response=$(curl -s http://worldtimeapi.org/api/timezone/Asia/Manila)

# Extract date and time in MMDDhhmmYYYY format
datetime=$(echo $response | jq -r '.datetime' | sed -E 's/^(....)-(..)-(..)T(..):(..):(..).*$/\2\3\4\5\1/')

# Check if datetime is empty
if [ -z "$datetime" ]; then
    echo "Failed to fetch time."
    exit 1
fi

echo "Setting system time to: $datetime"

# Use sudo to set system date and time
sudo date $datetime

# Synchronize hardware clock with system clock
sudo hwclock -w

echo "Time set successfully."

