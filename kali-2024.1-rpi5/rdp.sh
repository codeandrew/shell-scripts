sudo apt update && sudo apt upgrade -y
sudo apt install xrdp -y

sudo systemctl start xrdp
sudo systemctl enable xrdp
# sudo ufw allow 3389

# just use SSH over RDP for secure connection
echo "ssh -L 3390:localhost:3389 username@raspberry_pi_ip"
# Now, use an RDP client to connect to localhost:3390. 
# This connection will be securely tunneled to your Raspberry Pi's RDP server over SSH.



