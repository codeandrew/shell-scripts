#!/bin/bash

ifconfig | tee ifconfig.txt
sudo netstat -tuln | tee netstat.txt
sudo ss -tulnp | tee ss.txt 
sudo lsof -i | tee lsof.txt 
sudo nmap -sT localhost | tee nmap.txt
sudo ufw status | tee ufw.txt 
