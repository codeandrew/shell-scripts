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
