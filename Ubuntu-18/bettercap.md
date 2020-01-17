## link 
> https://linuxhint.com/install-bettercap-on-ubuntu-18-04-and-use-the-events-stream/

* find the libcap
```
sudo find / -name libpcap.so 2> /dev/null
```

* Now create a symlink
```
sudo ln -s /usr/lib/x86_64-linux-gnu/libpcap.so /usr/lib/x86_64-linux-gnu/libpcap.so.1
```

* Install last dependency

```
sudo apt-get install libnetfilter-queue-dev

```

* To redirect bettercap's events to another file
```
set events.stream.output OUTPUT_FILE_PATH
```
