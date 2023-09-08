# Ubuntu Mac Dualboot

```
sudo apt-get purge bcmwl-kernel-source
sudo apt update
sudo update-pciids
sudo apt install firmware-b43-installer
sudo reboot #note that this will restart your computer
sudo iwconfig wlp3s0 txpower 10dBm
#sudo iwconfig wlp2s0 txpower 10dBm
```



## References

- https://gist.github.com/torresashjian/e97d954c7f1554b6a017f07d69a66374
- https://www.amirootyet.com/post/how-to-get-wifi-to-work-after/
- https://gist.github.com/rob-hills/9134b7352ee7471c4d4f4fbd6454c4b9
