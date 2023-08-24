#!/bin/bash

# sudo apt-get install iptables-persistent
# sudo apt-get install ufw


sudo ufw reload # in theory this should be enough
# in reality, this motherfucker needs to disabled and enabled to really take effect 
sudo ufw disable
sudo ufw enable

# Check Status
sudo ufw status
