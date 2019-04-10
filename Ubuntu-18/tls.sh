#!/bin/sh
#DOMAIN="ghost.whitecloak.io"
DOMAIN=""

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj\
"/CN=$DOMAIN" -days 365


# kubectl create secret tls ghost-whitecloak-com-tls --cert=tls.crt --key=tls.key
kubectl create secret tls "$DOMAIN"-tls --cert=tls.crt --key=tls.key
