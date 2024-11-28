## Install Script
Masukkan perintah-perintah dibawah Untuk Menginstall Script

## Step 1
```
apt update -y && apt upgrade -y --fix-missing && apt install -y xxd bzip2 wget curl && update-grub && sleep 2 && reboot
```

## Step 2
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/scriswan/premiumsc/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
## INSTALL UDP COSTUM
masukan perintah ctrl + c enter
```
wget https://raw.githubusercontent.com/gemilangvip/autoscript/main/files/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
```
## UPDATE Script
```
wget https://raw.githubusercontent.com/scriswan/premiumsc/main/update.sh && chmod +x update.sh && ./update.sh
```
## pic.jpg
https://github.com/scriswan/premiumsc/blob/c7e231478bc908c84e8312e31f6047bc6e8ac499/Pic.jpg

Mod BY RISWAN VPNSTORE
