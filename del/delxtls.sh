#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

#################
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###################

MYIP=$(wget -qO- ipinfo.io/ip);
clear

# // Getting V2Ray Client Data
CLIENT_001=$(grep -c -E "^### " "/etc/xray/xrayxtls.json")
	if [[ ${CLIENTS_001} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " Select No client Xray Xtls"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "   No  User  Expired "
        grep -e "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_002} -ge 1 && ${CLIENT_002} -le ${CLIENT_001} ]]; do
		if [[ ${CLIENT_002} == '1' ]]; then
               	echo " ==============================="
                read -rp " Select one client (1-${CLIENT_001}) : " CLIENT_002
		else
                echo " ==============================="
                read -rp " Select one client (1-${CLIENT_001}) : " CLIENT_002
		fi
	done
# // String For Username && Expired Date
user=$(grep -E "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_002}"p)                       
exp=$(grep -E "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_002}"p)

# // Removing Data From Server Configuration
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/xrayxtls.json

# // Restarting XRay Service
systemctl restart xtls.service

# // Clear
clear

# // Successfull
echo ""
echo "================================"
echo "    Xray/Xtls Account Deleted   "
echo "================================"
echo "Username  : $user"
echo "Expired   : $exp"
echo "================================"
echo "ScriptMod By Manternet"
