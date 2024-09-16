# Ubuntu Macbook Pro Dual Boot

## Ubuntu 24.04 on Macbook Pro 2017

works before installation on ( usb boot ) 
- wifi
- keyboard
- mouse
- usb c ports
- bluetooth

no sounds

works after installation
- keyboard
- mouse
- usb c ports


**WIFI ADAPTER PROBLEMS**
Attach an external adapter
```bash
sudo apt-get update
sudo apt-get --reinstall install bcmwl-kernel-source
sudo modprobe -r b43 ssb wl brcmfmac brcmsmac bcma
sudo modprobe wl
# reboot
```
internal wifi adapter worked.

next bluetooth


### SUSPEND PROBLEM

1. Test 
`/etc/rc.local`
```
#!/bin/bash
echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/d3cold_allowed
echo 0 > /sys/bus/pci/devices/0000\:04\:00.0/d3cold_allowed
```

2. Test from this repo
Putting the MacBook Pro into suspend mode works on all models, but successful resume requires additional prerequisites as explained below.

Models with Apple's NVMe controller (MacBookPro13,1, MacBookPro13,2, MacBookPro14,1 and MacBookPro14,2) require disabling the d3cold PCIe power state for the NVMe controller to successfully wake up again:
```
echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/d3cold_allowed
```

 
## REFERENCES
- https://gist.github.com/almas/5f75adb61bccf604b6572f763ce63e3e
- https://ubuntuforums.org/showthread.php?t=2492426
- https://www.reddit.com/r/macbookair/comments/1ck8t69/ubuntu_2404_lts_on_2014_macbook/
- https://kernel.ubuntu.com/mainline/
- https://askubuntu.com/questions/1513028/suspend-laptop-when-lid-is-closed-in-ubuntu-24-04
- https://www.reddit.com/r/linux4noobs/comments/zjwwdg/unable_to_get_wifi_working_on_a_macbook_pro/
- https://github.com/Dunedan/mbp-2016-linux
