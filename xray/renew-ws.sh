#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers » Riswanvpn
# Email      » Riswanvpn@gmail.com
# telegram   » https://t.me/Riswanvpn

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Riswanvpn

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'    # Warna oranye
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
YELLOW='\033[0;33m'   # Mengganti warna menjadi kuning

# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    clear
    echo ""
    echo "Anda tidak memiliki klien yang ada!"
    exit 1
fi

clear
echo ""
echo "Pilih klien yang ingin Anda perpanjang"
echo " Tekan CTRL+C untuk kembali"
echo -e "==============================="
# Menampilkan semua username dan tanggal expired-nya dengan nomor urut
grep -E "^### " "/etc/xray/config.json" | nl -s ') ' | while read line; do
    user=$(echo $line | cut -d ' ' -f 2)
    exp=$(echo $line | cut -d ' ' -f 3)
    echo "$user - Expired: $exp"
done

# Ambil input nomor klien yang ingin diperpanjang
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    read -rp "Pilih salah satu klien [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
done

# Ambil username dan tanggal kedaluwarsa dari klien yang dipilih
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

# Proses perpanjangan
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
read -p "Expired (Hari): " masaaktif
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`

# Update file konfigurasi dan restart layanan
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
systemctl restart xray.service
service cron restart

clear
echo ""
echo "==============================="
echo "  Akun Xray/Vmess Diperpanjang  "
echo "==============================="
echo "Username      : $user"
echo -e "Tanggal Expired : ${YELLOW}$exp4${NC}"   # Mengganti label Tanggal Expired dengan warna kuning
echo "==============================="
echo "Skrip Mod Oleh Riswanvpn"
read -n 1 -s -r -p "Tekan tombol apapun untuk kembali ke menu"
menu
