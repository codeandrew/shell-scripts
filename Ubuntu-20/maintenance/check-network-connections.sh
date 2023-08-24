#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

mkdir -p reports
export version=$(date +'%y.%m.%d')
export filename=reports/network-enum-${version}.txt

ifconfig | tee -a $filename
sudo netstat -tuln | tee -a $filename
sudo ss -tulnp | tee -a $filename 
sudo lsof -i | tee -a $filename 
sudo nmap -sT localhost | tee -a $filename
sudo ufw status | tee -a $filename 
