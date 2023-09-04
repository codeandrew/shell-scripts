#!/bin/bash


# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Add Nginx's official signing key
wget https://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

# Get the codename of the current Ubuntu release
codename=`lsb_release -cs`

# Add Nginx's repository to the sources list
echo "deb https://nginx.org/packages/mainline/ubuntu/ $codename nginx" | sudo tee /etc/apt/sources.list.d/nginx.list > /dev/null
echo "deb-src https://nginx.org/packages/mainline/ubuntu/ $codename nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list > /dev/null

# Update the package list and install the latest Nginx
sudo apt-get update
sudo apt-get install -y nginx

# Remove the downloaded key
rm nginx_signing.key

# Print Nginx version
nginx -v

#=======================================================
# Making sure to have the right permissions
#=======================================================

# Create a directory for the Nginx pid file
sudo mkdir -p /var/run/nginx

# Correct permissions for Nginx directories
sudo chown -R www-data:www-data /var/log/nginx
sudo chown -R www-data:www-data /var/run/nginx

# Adjust the pid file location in the Nginx config file
sudo sed -i 's|pid /run/nginx.pid;|pid /var/run/nginx.pid;|' /etc/nginx/nginx.conf

# Enable and start the Nginx service
sudo systemctl enable nginx
sudo systemctl start nginx




# TEST YOUR DNS
# https://toolbox.googleapps.com/apps/dig
