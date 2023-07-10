#!/bin/bash

# Prevent start
# Create an empty file to prevent the service from starting

sudo touch /etc/cloud/cloud-init.disabled

# Uninstall
# Disable all services (uncheck everything except "None"):

sudo dpkg-reconfigure cloud-init

# Uninstall the package and delete the folders

sudo dpkg-reconfigure cloud-init
sudo apt-get purge cloud-init
sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/

# Restart the computer
sudo reboot



# 
# https://linuxhint.com/install-ubuntu-server-raspberry-pi/
# https://ubuntu.com/core/docs/install-raspberry-pi
# https://gist.github.com/zoilomora/f862f76335f5f53644a1b8e55fe98320
