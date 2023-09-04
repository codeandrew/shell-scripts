sudo apt update
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx 

# Add a renewal cronjob
(crontab -l 2>/dev/null; echo "15 3 * * * /usr/bin/certbot renew --quiet") | crontab -
