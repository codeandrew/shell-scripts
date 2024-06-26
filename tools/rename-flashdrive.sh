#!/bin/bash
# v2.0.0

# sudo apt-get update && sudo apt-get install exfat-utils

# Function to safely rename the USB drive
rename_usb() {
    old_mountpoint="$1"
    new_label="$2"

    # Find the device identifier and file system type using the mount point
    read device fstype <<< $(lsblk -o MOUNTPOINT,PATH,FSTYPE -np | grep "$old_mountpoint" | awk '{print $2, $3}')

    # Check if the old mountpoint exists and the device was found
    if [ -d "$old_mountpoint" ] && [ ! -z "$device" ]; then
        # Unmount the USB drive if it's currently mounted
        sudo umount "$old_mountpoint" >/dev/null 2>&1

        # Rename the USB drive label based on the file system type
        case "$fstype" in
            ext2|ext3|ext4)
                sudo e2label "$device" "$new_label"
                ;;
            vfat)
                sudo fatlabel "$device" "$new_label"
                ;;
            ntfs)
                sudo ntfslabel "$device" "$new_label"
                ;;
            exfat)
                sudo exfatlabel "$device" "$new_label"
                ;;
            *)
                echo "Unsupported file system type: $fstype"
                return
                ;;
        esac

        # Optionally, remount the drive
        # Depending on your system setup, you might need to manually specify the mounting command
        # sudo mount -t exfat "$device" "$old_mountpoint" >/dev/null 2>&1

        echo "Renamed USB drive at $old_mountpoint to $new_label"
    else
        echo "Error: $old_mountpoint does not exist, is not a valid mountpoint, or device not found for this mountpoint"
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
