#!/usr/bin/env bash

sudo apt-get update

## PACKAGES
packages=(
  build-essential
  libpcap-dev
  net-tools
  zip
  ruby-dev
  ruby
  nmap
  aircrack-ng
  dnsniff
  wireshark
  smbclient
)

for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing $package"
  echo
  sudo apt -y install $package
  echo
  echo "---------------------------------"
  echo
  echo
done


wget https://raw.githubusercontent.com/CiscoCXSecurity/enum4linux/master/enum4linux.pl -O /usr/local/bin/enum4linux
sudo chmod +x /usr/local/bin/enum4linux



# Install MSF console and venom

# Install necessary packages
sudo apt-get install -y build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt1-dev locate libreadline6-dev libcurl4-openssl-dev git-core libssl-dev libyaml-dev openssl autoconf libtool ncurses-dev bison curl wget postgresql postgresql-contrib libpq-dev libapr1 libaprutil1 libsvn1 libpcap-dev libsqlite3-dev libgmp-dev libgmp10 libgmp-dev
sudo git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework
sudo gem install bundler

cd /opt/metasploit-framework
bundle install

# Create a symbolic link to /usr/local/bin
sudo ln -sf /opt/metasploit-framework/msfconsole /usr/local/bin/
sudo ln -sf /opt/metasploit-framework/msfvenom /usr/local/bin/

echo "Installation complete. You can now use Metasploit and msfvenom from any location in your terminal."


echo "Downloading SecLists in /usr/share/wordlists"
sudo mkdir -p /usr/share/wordlists
cd /usr/share/wordlists
sudo  wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip 
sudo unzip SecList.zip
sudo rm -f SecList.zip
sudo chmod -R 755 /usr/share/wordlists
