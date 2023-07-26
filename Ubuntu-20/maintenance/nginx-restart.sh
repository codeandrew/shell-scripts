#!/bin/bash

sudo nginx -t

if [ $? -eq 0 ]
then
  echo "Syntax is ok, reloading NGINX"
  sudo systemctl stop nginx
  sudo systemctl start nginx
else
  echo "Syntax error, not reloading NGINX"
  exit 1
fi

sudo systemctl status nginx
nginx -v
