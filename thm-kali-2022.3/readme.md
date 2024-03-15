# Kali Linux - 2021.1 

## NetStat Debugging 

netstat -tunp
netstat -p tcp p udp

## IP Protocol

ip neighbor 

ip addr 


## Mount USB Devices

```bash
┌──(kali㉿wrench-rpi5)-[/media]
└─$ lsblk  # check if there's mount point
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    1 115.5G  0 disk
└─sda1        8:1    1 115.4G  0 part
mmcblk0     179:0    0  59.5G  0 disk
├─mmcblk0p1 179:1    0   255M  0 part /boot
└─mmcblk0p2 179:2    0  59.2G  0 part /

┌──(kali㉿wrench-rpi5)-[/media]
└─$ sudo mkdir /mnt/usbdrive
sudo: unable to resolve host wrench-rpi5: Name or service not known

┌──(kali㉿wrench-rpi5)-[/media]
└─$ sudo mount /dev/sda1 /mnt/usbdrive

┌──(kali㉿wrench-rpi5)-[/media]
└─$ cd /mnt/usbdrive

```
