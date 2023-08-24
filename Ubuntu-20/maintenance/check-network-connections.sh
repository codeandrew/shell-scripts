#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

mkdir -p reports
export version=$(date +'%y.%m.%d')
export filename=reports/network-enum-${version}.txt

echo -n "[+] IP Config" | tee -a $filename
ifconfig | tee -a $filename

echo -n "\n[+] Network Statistics" | tee -a $filename
sudo netstat -tuln | tee -a $filename

echo -n  "\n[+] Socket Statistics" | tee -a $filename
sudo ss -tulnp | tee -a $filename

echo -n "\n[+] List Open Files" | tee -a $filename
sudo lsof -i | tee -a $filename


echo -n "\n[+] NMAP" | tee -a $filename
sudo nmap -sT localhost | tee -a $filename

echo -n "\n[+] UFW" | tee -a $filename
sudo ufw status | tee -a $filename


echo -n "\n[+] IP FORWARDING" | tee -a $filename
cat /proc/sys/net/ipv4/ip_forward | tee -a $filename
