

make-cadir ~/openvpn-ca
cd openvpn-ca


`vim vars`
> Change Variables  

```
source vars
./clean-all
./build-ca
```

> if there's error  
> `ln -s openssl-1.0.0.cnf openssl.cnf`


```
./build-key-server server
./build-dh
```

now generate the keys
```
openvpn --genkey --secret keys/ta.key
source vars
```

Now build client keys
```
./build-key client1
```


Now copy the ca certs

```
cd keys
sudo cp ca.crt server.crt server.key ta.key dh2048.pem /etc/openvpn
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz | sudo tee /etc/openvpn/server.conf
```






### Firewall
> UFW problem
> Source https://bugs.launchpad.net/ubuntu/+source/ufw/+bug/550976


After setting DEFAULT_INPUT_POLICY="ACCEPT" (default was DROP)
in /etc/default/ufw, everything finally works.
