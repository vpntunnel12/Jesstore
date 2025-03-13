#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/vpntunnel12/Jesstore/main/register | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
        echo "Permission Accepted"
        res="Permission Accepted"
    else
        res="Permission Denied!"
    fi
}

PERMISSION

if [ -f /home/needupdate ]; then
    echo -e "${RED}Your script needs to be updated first!${NC}"
    exit 0
elif [ "$res" = "Permission Accepted" ]; then
    echo "Access granted."
else
    echo -e "${RED}Permission Denied!${NC}"
    exit 0
fi

# Color Definitions
BIBlack='\033[1;90m'
BIRed='\033[1;91m'
BIGreen='\033[1;92m'
BIYellow='\033[1;93m'
BIBlue='\033[1;94m'
BIPurple='\033[1;95m'
BICyan='\033[1;96m'
BIWhite='\033[1;97m'
UWhite='\033[4;37m'
On_IPurple='\033[0;105m'
On_IRed='\033[0;101m'
ORANGE='\033[0;33m'

# Exporting Language to UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear
function display_menu {
    # Define color variables
LIGHTGREEN="\033[1;32m"
NC="\033[0m"  # Reset color

echo -e "\033[1;32m──────────────────────────────────────────\033[0m"
echo -e "\e[44;97;1m               BOT TELEGRAM               $NC"
echo -e "\033[1;32m anda bisa mengunakan bot simpel untuk\033[0m"
echo -e "\033[1;32m membuat akun lewat telegram silahkan\033[0m"
echo -e "\033[1;32m anda buat bot di telegram cari bot\033[0m"
echo -e "\033[1;32m @BotFather silahkan buat bot anda ambil\033[0m"
echo -e "\033[1;32m token&id anda untuk cek id\033[0m"
echo -e "\033[1;32m @CekIDTelegram_bot\033[0m"
echo -e "\033[1;32m──────────────────────────────────────────\033[0m"
echo -e "  ${LIGHTGREEN}[1].${NC}\033[1;97m Install Bot Reseller${NC}"
echo -e "  ${LIGHTGREEN}[2].${NC}\033[1;97m Restart Bot Reseller${NC}"
echo -e "  ${LIGHTGREEN}[3].${NC}\033[1;97m Stop Bot Reseller${NC}"
echo -e "  ${LIGHTGREEN}[4].${NC}\033[1;97m Hapus bot Reseller${NC}"
echo -e "\033[1;32m──────────────────────────────────────────\033[0m"
}

# Fungsi utama
function main {
    while true; do
        display_menu
        read -p "Select From Options [ 1 - 10 or x ] : " menu
        echo -e ""

        case $menu in
            1)
                echo "Installing BOT CYBERVPN..."
                bot2
                ;;
            2)
                echo "Restarting BOT CYBERVPN..."
                restart-bot2
                ;;
            3)
                echo "Stopping BOT CYBERVPN..."
                stop-bot2
                ;;
            4)
                echo "Uninstalling BOT CYBERVPN..."
                del-bot2
                ;;
            5)
                echo "Installing Bot KYT..."
                add-bot
                ;;
            6)
                echo "Hapus Bot KYT..."
                hapus-bot
                ;;
            7)
                echo "Stopping Bot KYT..."
                stop-bot
                ;;
            8)
                echo "Restarting Bot KYT..."
                restart-bot
                ;;
            
            x)
                echo "Exiting..."
                menu
                ;;
            *)
                echo "Pilihan tidak valid."
                ;;
        esac
        echo -e "\n"
    done
}

# Jalankan fungsi utama
main
