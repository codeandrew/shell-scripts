#!/bin/bash

MYSQL_ROOT_PASSWORD="s3cure_th1s_sh1t"

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
sudo systemctl stop mysql

# Make MySQL service directory
sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld

sudo mysqld_safe --skip-grant-tables > /dev/null 2>&1 &

# Sleep for 5 seconds to ensure MySQL has started
sleep 5
# Update User's password and plugin
mysql -u root -e "FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}';"
# Kill all MySQL Processes
sudo killall -u mysql

# Sleep for 5 seconds to ensure MySQL has stopped
sleep 5

sudo systemctl start mysql
echo "All done!"
