# Ubuntu Monitoring


## Monitoring Services

```bash
systemctl --type=service

# example nginx
systemctl status nginx

# restarting the service
systemctl stop nginx
systemctl start nginx

# check all the files the that the service interacted
strace nginx
strings /usr/sbin/nginx
```
