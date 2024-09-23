# Raspberry Pi

## RPI 5 
OverClocking to 
- CPU 3.0 GHZ
- GPU 1.0 GHZ

requirements: 
- RPI Official Cooler
- Temp not going above 80c

in `bootfs` folder look for `config.txt` add these lines
```
...
[all]
over_voltage=3
arm_freq=3000
gpu_freq=1000
```
in `over_voltage` you can go upto 8, but some says 3 are already stable.
we can try to experiment about that later


## VNC

VNC Quick Start Guide on Kali Linux (Raspberry Pi)
Start VNC Server:
```bash
vncserver :1 -geometry 1920x1080
# Set/Change VNC Password:
vncpasswd
# Stop VNC Server:
vncserver -kill :1
```

**UBUNTU CLIENT**
```bash
sudo apt install tigervnc-viewer -y
Open VNC Viewer and connect to:
mathematica
Copy code
<Raspberry Pi IP>:5901
```
