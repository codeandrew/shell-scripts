Sure! Here’s a Markdown cheat sheet you can save for future reference.  

---

### 🕒 Kali Linux (Raspberry Pi) Time Sync Troubleshooting Cheat Sheet  
Fixing time synchronization issues with `systemd-timesyncd` and NTP.

---

## 🛠️ 1. Check Current Time Status
```bash
timedatectl status
```
Look for:  
- `System clock synchronized: no` → Not syncing  
- `NTP service: active` → Service is running  

---

## 📡 2. Restart & Force Time Sync
```bash
sudo systemctl restart systemd-timesyncd
sudo timedatectl set-ntp true
timedatectl status
```
If still not synced, proceed to the next steps.

---

## 🌍 3. Check NTP Server Connectivity
```bash
ntpdate -q 0.asia.pool.ntp.org
```
- If it times out, your network may be blocking NTP (UDP 123).  

Check system logs for errors:
```bash
sudo journalctl -u systemd-timesyncd --no-pager | tail -50
```

---

## 🔄 4. Change NTP Servers
1️⃣ Edit the timesync config file:
```bash
sudo nano /etc/systemd/timesyncd.conf
```
2️⃣ Replace or add these lines:
```
[Time]
NTP=time.google.com time.cloudflare.com
FallbackNTP=ntp.ubuntu.com
```
3️⃣ Save and exit (`CTRL+X`, `Y`, `Enter`)  
4️⃣ Restart timesync service:
```bash
sudo systemctl restart systemd-timesyncd
timedatectl status
```

---

## 🚪 5. Open UDP Port 123 (If Blocked)
```bash
sudo ufw allow 123/udp
sudo systemctl restart systemd-timesyncd
```
---

## 🛑 6. Manually Sync Time (Temporary Fix)
If NTP still fails, manually set the time:
```bash
sudo date -s "2025-03-11 15:45:00"
sudo hwclock -w
```
---

## ✅ 7. Verify Everything
Check NTP sources:
```bash
ntpq -p
```
Check sync status:
```bash
timedatectl status
```
Enable sync on startup:
```bash
sudo systemctl enable systemd-timesyncd
```
---

### 📌 Quick Fix Command (One-Liner)
If you just need a quick fix:
```bash
sudo timedatectl set-ntp true && sudo systemctl restart systemd-timesyncd && timedatectl status
```

---

### 📁 Save This for Later
Save this file as `time-sync-cheatsheet.md` for future reference:
```bash
nano ~/time-sync-cheatsheet.md
```
Paste the contents, save (`CTRL+X`, `Y`, `Enter`).

Let me know if you need any modifications! 🚀
