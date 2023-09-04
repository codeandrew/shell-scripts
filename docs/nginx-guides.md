# Nginx Guides

## Stream 

**Stream Logs**
```conf
stream {
    log_format basic '$remote_addr [$time_local] '
                     '$protocol $status $bytes_sent $bytes_received '
                     '$session_time';

    access_log /var/log/nginx/access_stream.log basic;
    error_log  /var/log/nginx/error_stream.log;

    server {
        listen      4444;
        proxy_pass  100.100.100.100:80;
    }

    # ... other server blocks ...
}

```
