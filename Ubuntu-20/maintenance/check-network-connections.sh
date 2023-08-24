#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

ifconfig | tee ifconfig.txt
sudo netstat -tuln | tee netstat.txt
sudo ss -tulnp | tee ss.txt 
sudo lsof -i | tee lsof.txt 
sudo nmap -sT localhost | tee nmap.txt
sudo ufw status | tee ufw.txt 
