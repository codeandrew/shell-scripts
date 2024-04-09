#!/bin/bash
# v1.0.0
# Function to safely rename the USB drive
rename_usb() {
    old_mountpoint="$1"
    new_label="$2"

    # Check if the old mountpoint exists
    if [ -d "$old_mountpoint" ]; then
        # Unmount the USB drive if it's currently mounted
        sudo umount "$old_mountpoint" >/dev/null 2>&1

        # Rename the USB drive label
        sudo e2label "$(df -h "$old_mountpoint" | awk 'NR==2 {print $1}')" "$new_label"

        # Mount the USB drive again
        sudo mount "$old_mountpoint" >/dev/null 2>&1

        echo "Renamed USB drive at $old_mountpoint to $new_label"
    else
        echo "Error: $old_mountpoint does not exist or is not a valid mountpoint"
    fi
}

# EXAMPLE output of lsblk
# sda            8:0    1 115.5G  0 disk
# └─sda1         8:1    1 115.4G  0 part /media/j4f/J4F-PRIMARY
# sdb            8:16   1 230.9G  0 disk
# └─sdb1         8:17   1 230.9G  0 part /media/j4f/01XJAF
# sdc            8:32   1 117.2G  0 disk
# └─sdc1         8:33   1 117.2G  0 part /media/j4f/0x01TRADING

# Rename USB drives
rename_usb "/media/j4f/01XJAF" "0x00-j4f-primary-2024"
rename_usb "/media/j4f/J4F-PRIMARY" "0x01-devsecops-2024"
rename_usb "/media/j4f/0x01TRADING" "0x02-trading-2024"
