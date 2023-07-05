#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx

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
