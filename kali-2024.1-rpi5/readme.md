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

## Enhanced Security Connection

use SSH tunneling over RDP

### SHH Tunneling for RDP

```bash
sudo apt-get update
sudo apt-get install xrdp

# xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp
```

now SSH 
```bash
ssh -L 3390:localhost:3389 username@raspberry_pi_ip
```

### Fail2Ban for Enhanced Security

```bash
sudo apt-get update
sudo apt-get install fail2ban

# Step 2: Configure Fail2Ban
# Fail2Ban configurations can be done in /etc/fail2ban/jail.local file. 
# If it doesn't exist, copy the default configuration file:
sudo cp /etc/fail2ban/jail.{conf,local}

sudo vi /etc/fail2ban/jail.local
```

Ensure you have the following section for SSH (it may already exist or you might need to add it):
```
[sshd]
enabled = true
port    = ssh
filter  = sshd
logpath = /var/log/auth.log
maxretry = 5
```

Start Fail2Ban
```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
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


