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
cat > &2 <<END
DONE! 
Things to do
--------------------------------
Check MySQL Service Status:
Ensure that the MySQL service is running correctly.

  sudo systemctl status mysql

If it's not running, you can start it with:

  sudo systemctl start mysql

Login
  mysql -u root -p

Change Root Password (Optional):
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_secure_password';

Create a New MySQL User (Optional but Recommended):
It's generally good practice to create a separate user account for your application rather than using the root account.

  CREATE USER 'foundation_user'@'localhost' IDENTIFIED BY 'user_password';
  GRANT ALL PRIVILEGES ON *.* TO 'foundation_user'@'localhost' WITH GRANT OPTION;
  FLUSH PRIVILEGES;

Example of creating a project database 

  CREATE DATABASE foundation;
  USE foundation;
  CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    hashed_password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    is_superuser BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );


To Reset the Root Password:

If you’ve forgotten the root password or are unsure what it is, you might need to reset it using the MySQL --skip-grant-tables method:
  sudo systemctl stop mysql
  sudo mysqld_safe --skip-grant-tables &

Then, reset the password:
  FLUSH PRIVILEGES;
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';

Finally, restart MySQL normally:
  sudo systemctl start mysql

END
