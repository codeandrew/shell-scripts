#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Check if a command exists
function command_exists {
  command -v "$1" >/dev/null 2>&1
}

# Function to check dependencies
function check_dependencies {
  dependencies=("ifconfig" "netstat" "ss" "lsof" "nmap" "ufw")

  for cmd in "${dependencies[@]}"; do
    if ! command_exists $cmd; then
      echo "Please install $cmd or ensure it is in your PATH."
      exit 1
    fi
  done
}

# Check for dependencies before proceeding
check_dependencies

mkdir -p reports
export version=$(date +'%y.%m.%d')
export filename=reports/network-enum-${version}.txt

echo -e "[+] IP Config" | tee -a $filename
ifconfig | tee -a $filename

echo -e "\n[+] UFW" | tee -a $filename
sudo ufw status | tee -a $filename

echo -e "\n[+] IP FORWARDING" | tee -a $filename
cat /proc/sys/net/ipv4/ip_forward | tee -a $filename

echo -e "\n[+] NMAP" | tee -a $filename
sudo nmap -sT localhost | tee -a $filename

echo -e "\n[+] Network Statistics" | tee -a $filename
sudo netstat -tuln | tee -a $filename

echo -e "\n[+] Socket Statistics" | tee -a $filename
sudo ss -tulnp | tee -a $filename

echo -e "\n[+] List Open Files" | tee -a $filename
sudo lsof -i | tee -a $filename
