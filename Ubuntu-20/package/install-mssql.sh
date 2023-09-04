#!/bin/bash

sudo apt-get update
sudo apt-get install -y gcc g++ make
sudo apt-get install -y python3-pip
sudo apt-get install -y unixodbc-dev
pip3 install --upgrade pip
pip3 install pyodbc

sudo su 
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
exit
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17


# find and validate the driver
# sudo find / -name "libmsodbcsql*"

# this is for debugging tools
sudo apt-get install mssql-tools unixodbc-dev

