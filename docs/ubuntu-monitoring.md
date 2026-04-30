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

## Network Monitoring

### LSOF
> list open files
```
sudo lsof -i
# Check the port and dig deeper using PID 
```

### Netstat

```
sudo netstat -tupln
```


## Cron Jobs

What are the cron executed?
```bash
#Run this command to check the system-wide cron logs:
grep CRON /var/log/syslog

# Or for RHEL-based systems:
grep CRON /var/log/cron
```

What jobs are scheduled?
```bash
crontab -l
ls -alh /var/spool/cron
ls -al /etc/ | grep cron
ls -al /etc/cron*
cat /etc/cron*
cat /etc/at.allow
cat /etc/at.deny
cat /etc/cron.allow
cat /etc/cron.deny
cat /etc/crontab
cat /etc/anacrontab
cat /var/spool/cron/crontabs/root
```


