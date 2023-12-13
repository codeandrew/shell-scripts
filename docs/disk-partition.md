# Disk Partition

## OSX

### REFORMAT USB

List the available disks and identify the USB drive by running the following command:
```bash
╰─$ diskutil list
/dev/disk0 (internal):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                         251.0 GB   disk0
   1:             Apple_APFS_ISC ⁨⁩                        524.3 MB   disk0s1
   2:                 Apple_APFS ⁨Container disk3⁩         245.1 GB   disk0s2
   3:        Apple_APFS_Recovery ⁨⁩                        5.4 GB     disk0s3

/dev/disk3 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +245.1 GB   disk3
                                 Physical Store disk0s2
   1:                APFS Volume ⁨Macintosh HD⁩            23.8 GB    disk3s1
   2:              APFS Snapshot ⁨com.apple.os.update-...⁩ 23.8 GB    disk3s1s1
   3:                APFS Volume ⁨Preboot⁩                 468.0 MB   disk3s2
   4:                APFS Volume ⁨Recovery⁩                1.6 GB     disk3s3
   5:                APFS Volume ⁨Data⁩                    203.1 GB   disk3s5
   6:                APFS Volume ⁨VM⁩                      2.1 GB     disk3s6

/dev/disk4 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *125.8 GB   disk4
   1:       Microsoft Basic Data ⁨⁩                        4.9 GB     disk4s1
   2:                        EFI ⁨ESP⁩                     5.2 MB     disk4s2
   3:       Microsoft Basic Data ⁨⁩                        307.2 KB   disk4s3
                    (free space)                         120.9 GB   -
```
This command will display a list of all connected disks and partitions. Your USB drive will be listed with a name like /dev/diskX (e.g., /dev/disk2).

Formats you can choose
```
sudo diskutil eraseDisk ExFAT USB_DRIVE_NAME /dev/diskX
sudo diskutil eraseDisk FAT32 USB_DRIVE_NAME /dev/diskX
sudo diskutil eraseDisk APFS USB_DRIVE_NAME /dev/diskX

```

```bash
diskutil unmountDisk /dev/disk4
sudo diskutil eraseDisk ExFAT repobackups /dev/disk4                                                                                          1 ↵
Started erase on disk4
Unmounting disk
Creating the partition map
[ \ 0%..10%..20%..30%..40%..50%.......................... ]

```
