#!/bin/bash

# Clear the screen
clear

# Print SSH login title
echo "◇━━━━━━━━━━━━━━━━━◇"
echo "   🔸 User SSH Logins 🔸"
echo "◇━━━━━━━━━━━━━━━━━◇"

# Telegram Bot token and chat ID
BOT_TOKEN="7419626014:AAF1JeOd0PrcMbbrb5DdZ9Ue3PByULkooWc"
CHAT_ID="-1002029496202"

# Function to send a message to Telegram
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d chat_id="$CHAT_ID" \
        -d text="$message"
}

# Determine the log file location based on the system
if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
elif [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
else
    echo "Log file not found!"
    exit 1
fi

# Temporary file to store login information
> /tmp/user_login_ips.txt

# Fetch Dropbear process IDs
dropbear_pids=($(ps aux | grep -i dropbear | awk '{print $2}'))

# Extract successful Dropbear login attempts
grep -i "dropbear" "$LOG" | grep -i "Password auth succeeded" > /tmp/login-db.txt

# Loop through each Dropbear process and log successful login information
for PID in "${dropbear_pids[@]}"; do
    login_info=$(grep "dropbear$PID" /tmp/login-db.txt)
    if [ -n "$login_info" ]; then
        USER=$(echo "$login_info" | awk '{print $10}')
        IP=$(echo "$login_info" | awk '{print $12}')
        echo "$USER $IP" >> /tmp/user_login_ips.txt
    fi
done

# Extract SSHD login attempts
grep -i "sshd" "$LOG" | grep -i "Accepted password for" > /tmp/login-sshd.txt

# Fetch SSHD process IDs
sshd_pids=($(ps aux | grep "priv" | awk '{print $2}'))

# Loop through each SSHD process and log successful login information
for PID in "${sshd_pids[@]}"; do
    login_info=$(grep "sshd$PID" /tmp/login-sshd.txt)
    if [ -n "$login_info" ]; then
        USER=$(echo "$login_info" | awk '{print $9}')
        IP=$(echo "$login_info" | awk '{print $11}')
        echo "$USER $IP" >> /tmp/user_login_ips.txt
    fi
done

# Generate unique user-IP login information
echo "◇━━━━━━━━━━━━━━━━━◇"
echo " 🔸 User Login IP Summary 🔸"
echo "◇━━━━━━━━━━━━━━━━━◇"
cat /tmp/user_login_ips.txt | sort | uniq > /tmp/unique_user_login_ips.txt

# Prepare a message for Telegram that will include all user-IP login details
telegram_message="🔸 User Login IP Summary 🔸\n\n"

# Loop through each user and count unique IP logins
users=($(awk '{print $1}' /tmp/unique_user_login_ips.txt | sort | uniq))

for user in "${users[@]}"; do
    # Get the number of unique IPs per user
    ip_count=$(grep -w "$user" /tmp/unique_user_login_ips.txt | awk '{print $2}' | sort -u | wc -l)
    
    # Prepare the user info to be sent to Telegram
    telegram_message="$telegram_message\nUser: $user - IP Count: $ip_count"
    user_ips=$(grep -w "$user" /tmp/unique_user_login_ips.txt | awk '{print $2}' | sort -u | nl)
    
    telegram_message="$telegram_message\n$user_ips"
    
    # Print to the terminal
    echo "User: $user - IP Count: $ip_count"
    echo "Logged IPs:"
    echo "$user_ips"
    echo ""

done

# Check OpenVPN TCP logs, if available
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    echo " "
    vpn_tcp_info=$(grep -w "^CLIENT_LIST" /etc/openvpn/server/openvpn-tcp.log | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g')
    echo "$vpn_tcp_info"
    telegram_message="$telegram_message\n\nOpenVPN TCP Log:\n$vpn_tcp_info"
fi

# Check OpenVPN UDP logs, if available
if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    echo " "
    vpn_udp_info=$(grep -w "^CLIENT_LIST" /etc/openvpn/server/openvpn-udp.log | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g')
    echo "$vpn_udp_info"
    telegram_message="$telegram_message\n\nOpenVPN UDP Log:\n$vpn_udp_info"
fi

# Send the full login details to Telegram
send_telegram_message "$telegram_message"

# Clean up temporary files
rm -f /tmp/login-db.txt /tmp/login-sshd.txt /tmp/user_login_ips.txt /tmp/unique_user_login_ips.txt

echo ""
# Uncomment the line below if you want to pause and return to a menu
# read -n 1 -s -r -p "Press [ Enter ] to go back to the menu"
