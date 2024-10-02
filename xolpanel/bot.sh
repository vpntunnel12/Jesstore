#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\e[0m'
rd='\e[36m' #cyan
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
xl='\e[91m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
YELL='\033[1;33m'
BGX="\033[42m"
UPDATE="https://raw.githubusercontent.com/Lite-VPN/v3/main/"
BOT="https://raw.githubusercontent.com/Lite-VPN/v3/main/"
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/scriswan/premiumsc/main/register"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/kytxz"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6285279323958"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc

echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC${f}                   BOT MANAGER                $NC${z} $NC"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall BOT CYBERVPN${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[5]${NC}${rd} Install Bot KYT${NC}"
echo -e "  ${ORANGE}[6]${NC}${rd} Hapus Bot KYT${NC}"
echo -e "  ${ORANGE}[7]${NC}${rd} Stop Bot KYT${NC}"
echo -e "  ${ORANGE}[8]${NC}${rd} Restart Bot KYT${NC}"
echo -e "  ${ORANGE}[9]${NC}${rd} Install Bot KYT For Public${NC}"
echo -e ""
echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
read -p "  Select From Options [ 1 - 9 or x] : " menu
case $menu in
1) clear ;
    bot2
    ;;
2) clear ;
    restart-bot2
    ;;
3) clear ;
    stop-bot2
    ;;
4) clear ;
    del-bot2
    ;;
5) clear ;
    add-bot
    ;;
6) clear ;
    hapus-bot
    ;;
7) clear ;
    stop-bot
    ;;
8) clear ;
    restart-bot
    ;;
9) clear ;
    add-bot-bersama
   ;;
x)
    menu
   ;;
esac