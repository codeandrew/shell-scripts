# Ways to Connect to Kali

- kali in browser

## Kali in Browser
> https://www.kali.org/docs/general-use/novnc-kali-in-browser/



```bash
sudo apt update
sudo apt install -y novnc x11vnc

# Next we start up a VNC session
x11vnc -display :0 -autoport -localhost -nopw -bg -xkb -ncache -ncache_cr -quiet -forever
```


example:
```bash
kali@kali:~$ sudo apt update
kali@kali:~$ sudo apt install -y novnc x11vnc

# Next we start up a VNC session. We have chosen to do this only on loopback, 
# making it more secure (We are skipping x11vnc’s in-built HTTP function. 
# That requires Java, and we don’t want to install it on any of our clients as noVNC gives a HTML5 experience):


kali@kali:~$ x11vnc -display :0 -autoport -localhost -nopw -bg -xkb -ncache -ncache_cr -quiet -forever

The VNC desktop is:      localhost:0
PORT=5900

# NOTE: We are using display :0 which is our current desktop.
# We can double check which port is being used for VNC:


kali@kali:~$ ss -antp | grep vnc
LISTEN    0         32                127.0.0.1:5900            0.0.0.0:*        users:(("x11vnc",pid=8056,fd=8))
LISTEN    0         32                    [::1]:5900               [::]:*        users:(("x11vnc",pid=8056,fd=9))

# We can see it is using port 5900.
kali@kali:~$ /usr/share/novnc/utils/novnc_proxy --listen 8081 --vnc localhost:5900

# now enable SSH
kali@kali:~$ sudo systemctl enable ssh --now

# SSH then 
ssh kali@192.168.13.37 -L 8081:localhost:8081
```





