#!/bin/bash
export USER="jaf"

sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt install remmina remmina-plugin-vnc xrdp

adduser $USER
usermod -aG admin $USER ; usermod -aG sudo $USER;
su $USER
echo gnome-session>~/.xsession;
cp ~/.xsession /etc/skel". ">"

systemctl enable xrdp
sudo ufw allow 3389/tcp # FIREWALL 

systemctl start xrdp



# REFERENCES
# - https://www.digitalocean.com/community/tutorials/how-to-enable-remote-desktop-protocol-using-xrdp-on-ubuntu-22-04
# - https://www.digitalocean.com/community/questions/how-can-i-create-a-vm-with-ubuntu-desktop-in-digital-ocean
# - https://systemweakness.com/how-to-install-ubuntu-with-gui-on-digital-ocean-for-free-12301f464a3 
