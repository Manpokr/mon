#!/bin/bash
# My Telegram : https://t.me/Manternet
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/trojanxtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Client xray tr-xtls renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	echo "     No  User  Expired "
	grep -E "^### " "/etc/xray/trojanxtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
	echo -e "==============================="
			read -rp " Select one client [1]: " CLIENT_NUMBER
		else
	echo -e "==============================="
			read -rp " Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (Days) : " masaaktif
user=$(grep -E "^### " "/etc/xray/trojanxtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/trojanxtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/trojanxtls.json

clear
echo ""
echo "================================"
echo "  Xray/Tr-XTLS Account Renewed  "
echo "================================"
echo "Username  : $user"
echo "Expired   : $exp4"
echo "================================"
echo "ScriptMod By Manternet"
