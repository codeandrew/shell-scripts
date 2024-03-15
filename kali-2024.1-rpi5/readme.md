# Kali RPI 5

## Initial Setup
make sure time is correct
```bash
timedatectl status
sudo systemctl restart systemd-timesyncd # force a timesync
```

manual timeupdate
```bash
sudo date MMDDhhmmYYYY
# Replace MM (month), DD (day), hh (hour), mm (minute), and YYYY (year) with the current date and time.
sudo hwclock -w
```

then verify NTP
sudo vim /etc/systemd/timesyncd.conf
```
[Time]
NTP=pool.ntp.org
```

## Mount USB Devices

```bash
dmesg | tail # to get details

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

┌──(kali㉿wrench-rpi5)-[/media]
└─$ sudo mount /dev/sda1 /mnt/usbdrive

┌──(kali㉿wrench-rpi5)-[/media]
└─$ cd /mnt/usbdrive

```