#!/bin/bash

# Existing script setup...

# New function to display online users
check_online_users() {
    # This assumes user sessions are stored in some form of a log or process.
    # You could track users by checking for active processes related to XRAY, WebSocket connections, or other means.

    echo -e "${BICyan}Checking Online Users...${NC}"
    
    # Example: Check active connections to the server (e.g., XRAY, WebSocket sessions)
    # This is a placeholder logic, adjust as needed for your system.
    online_users=$(ps aux | grep xray | grep -v 'grep' | awk '{print $1}' | sort | uniq)

    if [ -z "$online_users" ]; then
        echo -e "${BIRed}No users are currently online.${NC}"
    else
        echo -e "${BIGreen}Online Users:${NC}"
        echo "$online_users"
    fi
}

# Your existing menu options...

echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "     ${BIWhite}${UWhite}MENU VMESS ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] Create Account XRAY Vmess Websocket "
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] Trial Account XRAY Vmess     "
echo -e "     ${BICyan}[${BIWhite}03${BICyan}] Extending Account XRAY Vmess Active "
echo -e "     ${BICyan}[${BIWhite}04${BICyan}] Delete Account XRAY Vmess Websocket  "
echo -e "     ${BICyan}[${BIWhite}05${BICyan}] Check User Login XRAY Vmess     "
echo -e "     ${BICyan}[${BIWhite}06${BICyan}] Check Online Users           " 
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu :  "  opt
echo -e ""

case $opt in
    1) clear ; add-ws ; exit ;;
    2) clear ; trialvmess ; exit ;;
    3) clear ; renew-ws ; exit ;;
    4) clear ; del-ws ; exit ;;
    5) clear ; cek-ws ; exit ;;
    6) clear ; check_online_users ; exit ;;  # New case for checking online users
    0) clear ; menu ; exit ;;
    x) exit ;;
    *) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
