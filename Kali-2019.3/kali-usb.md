## Making Kali Bootable USB

For Checking the correct path of the usb device

```bash
lsblk
sudo fdisk -l
```
In this case it's on /dev/sdb

```bash
sudo dd status=progress if=kali-linux-2020.2-live-amd64.iso of=/dev/sdb bs=1M
```

## Adding Persistence to a Kali Linux "Live" USB Drive

Get file total of your iso image, and use it as your start to end location to partition 

```bash
du -bcm kali-linux-2019.3-amd64.iso | tail -1
export start=2898
export end=7gb
echo $start $end

parted /dev/sdb mkpart primary $start $end
```  

to check
```
  lsblk
  sudo fdisk -l
```

Initialize the LUKS encryption on the newly-created partition
> This will make a warning several times, just ignore

```bash
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
sudo cryptsetup luksOpen /dev/sdb3 kali
```

Create the ext4 filesystem, and label it “persistence

```bash
sudo mkfs.ext4 -L persistence  /dev/mapper/kali
sudo e2label /dev/mapper/kali persistence
```

Create a mount point, mount our new encrypted partition there, set up the persistence.conf file, and unmount the partition.

```bash
sudo mkdir -p /mnt/kali
sudo mount /dev/mapper/kali /mnt/kali
sudo echo "/ union" > /mnt/kali/persitence.conf
sudo umount /dev/mapper/kali
```

Close the encrypted channel to our persistence partition.

```bash
cryptsetup luksClose /dev/mapper/kali
```


## Boot To Live Kali After DD

Get Flash Drive Path
```bash
fdisk -l
```
> In this case it's /dev/sdb


Create Primary Partition
```bash
fdisk /dev/sdb
- n
- p
- w
```

Check the partition if it's created
```bash
fdisk -l 
```

Now we're going to encrypt the new partition
```bash
cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
- YES
- $YOURPASSPHRASE
```

After Encrypting we need to open the partition for further configuration
```bash
cryptsetup luksOpen /dev/sdb3 kali
```

We makee ext4 partition and map it
```bash
mkfs.ext4 -L persistence  /dev/mapper/kali
```

Now we label and configure persitence
```bash
e2label /dev/mapper/kali persistence
sudo mkdir -p /mnt/kali
sudo mount /dev/mapper/kali /mnt/kali
echo "/ union" > /mnt/kali/persitence.conf
umount /dev/mapper/kali
```

Close luks
```bash
cryptsetup luksClose /dev/sdb3 kali
```

Now boot to live encrypted persistence
