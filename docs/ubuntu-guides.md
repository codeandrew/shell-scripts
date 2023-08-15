# Ubuntu 

## Desktop Installation


### Ubuntu Partition 
In Ubuntu and other Linux distributions, the partition type can be either "Primary" or "Logical." Here's a brief explanation of each:

1. Primary Partition: A primary partition is a basic partition that can be used to install an operating system or store data. In a standard partition table, you can have up to four primary partitions. If you want to have more than four partitions, you'll need to use an extended partition.

2. Logical Partition: A logical partition is a type of partition that resides within an extended partition. It allows you to create additional partitions beyond the four primary partitions limit. An extended partition can contain multiple logical partitions.

Now, let's discuss how you can partition your /dev/sda disk with the boot, root, home, and swap partitions.

1. Boot Partition: The boot partition is where the boot loader files are stored. It is typically a small partition (around 500MB) and is set as the bootable partition. You can create this as a primary partition.

2. Root Partition: The root partition ("/") is where the operating system files are installed. It contains the system files, program files, and other essential files. It is recommended to create this as a primary partition.

3. Home Partition: The home partition ("/home") is where user data, such as documents, pictures, music, etc., is stored. Separating the home partition allows you to reinstall or upgrade the operating system without losing your personal files. You can create this as a logical partition within the extended partition.

4. Swap Partition: The swap partition is used as virtual memory when the system runs out of RAM. Its size depends on the amount of RAM you have. As per your system's RAM size, you can create this as a primary or logical partition.

Based on the information provided, here's a suggested partition setup:

- Boot Partition: Primary, around 500MB
- Root Partition: Primary, size depending on your needs (e.g., 50GB)
- Home Partition: Logical (inside extended partition), remaining space (e.g., 52.5GB)
- Swap Partition: Primary or Logical, size depending on your RAM (e.g., 2GB)

You can use a partitioning tool like GParted (included in Ubuntu installation media) or the command-line tool `fdisk` or `parted` to create and manage the partitions during the Ubuntu installation process. Make sure to back up any important data before partitioning the disk.


## Networking

### Get Route Table

```
netstat -rn 
# -r This flag is used to display the Kernel routing tables
# -n This flag is used to display the numerical addresses

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         172.20.10.1     0.0.0.0         UG        0 0          0 wlp0s20f3
10.3.0.0        10.4.0.1        255.255.0.0     UG        0 0          0 tun0
10.4.0.0        0.0.0.0         255.255.128.0   U         0 0          0 tun0
10.10.0.0       10.4.0.1        255.255.0.0     UG        0 0          0 tun0
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 wlp0s20f3
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
172.20.10.0     0.0.0.0         255.255.255.240 U         0 0          0 wlp0s20f3

```


## Copying 

### RSYNC

`rsync` is a utility for efficiently transferring and synchronizing files across computer systems, by checking the timestamp and size of files. It's used for mirroring, backup, or migrating data across machines.

Examples:

1. Copy file from local to remote:
``bash
rsync -avz file.txt user@remote:/path/
``
2. Copy directory from local to remote:
``bash
rsync -avz /local/dir/ user@remote:/path/
``
3. Copy directory from remote to local:
``bash
rsync -avz user@remote:/path/dir/ /local/dir/
``
4. Synchronize a local directory with a remote directory:
``bash
rsync -avz --delete /local/dir/ user@remote:/path/dir/
``
Flags: `-a` (archive mode), `-v` (verbose), `-z` (compress), `--delete` (delete extraneous files from destination dirs).

Remember, rsync must be installed on both source and destination machines.


You can use `rsync` to copy files from your Linux system to a USB drive mounted at `/media/$USER`. Here's how you might do that:

``bash
rsync -avz /path/to/source/directory/ /media/$USER/USB_DRIVE_NAME/target_directory/
``

Here, `/path/to/source/directory/` is the directory you want to copy from your Linux system, and `/media/$USER/USB_DRIVE_NAME/target_directory/` is the directory on your USB drive where you want to copy the files to.

Please replace `USB_DRIVE_NAME` with your actual USB drive name and `target_directory` with the directory you want to create on the USB drive.

Here's what the options mean:

- `-a` : archive mode, it equals `-rlptgoD` (no -H,-A,-X)
- `-v` : verbose, to show the progress of the files being copied.
- `-z` : compress file data during the transfer.

Also, don't forget the trailing slash at the end of the source directory path, it's necessary to ensure `rsync` copies the directory contents, not the directory itself.

Make sure that your user has the necessary permissions to read/write to the USB drive.

The `-a` option in `rsync` is called "archive mode." This mode is a shortcut for a bunch of other options bundled together. When you use `-a`, it's the equivalent of using `-rlptgoD`, which includes:

- `-r` : Recursive, which means subdirectories will be copied as well.
- `-l` : Copies symlinks as symlinks.
- `-p` : Preserves file permissions.
- `-t` : Preserves modification times.
- `-g` : Preserves group ownerships. (Super-user only)
- `-o` : Preserves owner (root only)
- `-D` : Preserves devices files (super-user only) and special files.

So, essentially, archive mode is designed to preserve as much about the file as possible in the copy. It's commonly used for making backups and copying directories. It ensures that the copied files and directories retain their ownership, permissions, and timestamps, among other things.


Examples:

1. Copy file from local to remote:
```bash
rsync -avz file.txt user@remote:/path/
```
2. Copy directory from local to remote:
```bash
rsync -avz /local/dir/ user@remote:/path/
```
3. Copy directory from remote to local:
```bash
rsync -avz user@remote:/path/dir/ /local/dir/
```
4. Synchronize a local directory with a remote directory:
```bash
rsync -avz --delete /local/dir/ user@remote:/path/dir/
```
Flags: `-a` (archive mode), `-v` (verbose), `-z` (compress), `--delete` (delete extraneous files from destination dirs).

Remember, rsync must be installed on both source and destination machines.




