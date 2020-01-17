
wget -O bettercap.zip https://github.com/bettercap/bettercap/releases/download/v2.26.1/bettercap_linux_amd64_v2.26.1.zip

unzip bettercap.zip -d . 

sleep 500

sudo find / -name libpcap.so 2> /dev/null

sudo ln -s /usr/lib/x86_64-linux-gnu/libpcap.so /usr/lib/x86_64-linux-gnu/libpcap.so.1
sudo apt-get install libnetfilter-queue-dev

echo
echo

echo "To output bettercaps events into a string"
echo "set events.stream.output OUTPUT_FILE_PATH" 

