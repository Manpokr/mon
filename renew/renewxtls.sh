#!/bin/bash
# Renew xray
# ===============

# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

# Validate Your IP Address
MYIP=$(wget -qO- ipinfo.io/ip);
clear
CLIENT_001=$( grep -c -E "^### " "/etc/xray/xrayxtls.json" )
echo "=================================================="
echo "      LIST VLESS XTLS CLIENT ON THIS VPS"
echo "=================================================="
grep -e "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_002} -ge 1 && ${CLIENT_002} -le ${CLIENT_001} ]]; do
		if [[ ${CLIENT_002} == '1' ]]; then
                echo "=================================================="
			read -rp "Please Input an Client Number (1-${CLIENT_001}) : " CLIENT_002
		else
                echo "=================================================="
			read -rp "Please Input an Client Number (1-${CLIENT_001}) : " CLIENT_002
		fi
	done
# // Expired Date                                                                                                   
read -p "Expired (Days) : " masaaktif                                                                               
user=$(grep -E "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_002}"p)                       
exp=$(grep -E "^### " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_002}"p)                        
                                                                                                                    
# // Date Configration                                                                                              
now=$(date +%Y-%m-%d)                                                                                               
d1=$(date -d "$exp" +%s)                                                                                            
d2=$(date -d "$now" +%s)                                                                                            
exp2=$(( (d1 - d2) / 86400 ))                                                                                       
exp3=$(($exp2 + $masaaktif))                                                                                        
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`                                                                             
                      
# // Input To System Configuration                                        
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/xrayxtls.json       
systemctl restart xtls.service                                            
clear                                                                     
echo ""                                                                   
echo "==============================="                                    
echo "   Xray/Xtls Account Renewed  "                                       
echo "==============================="                                    
echo "Username  : $user"                                                  
echo "Expired   : $exp4"                                                                                    
echo "================================"
echo "ScriptMod By Manternet"
