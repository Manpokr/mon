#!/bin/bash
# My Telegram : https://t.me/Manternet
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
xtls="$(cat /etc/xray/xrayxtls.json | grep port | sed 's/port//g' | sed 's/    "": //g' | sed 's/,//g' | sed 's/ //g')"
echo -e "======================================"
echo -e "         XRay XTLS Port Changer"
echo -e ""
echo -e "     [1]  Change Port XRay XTLS ${RED}$xtls${NC}"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""  
read -p "  silahkan masukkan nomor [1 or x] :  "  port                                                                                                                                                                                                                                                                                                                                                                                          
echo -e ""                                                                                                                                                                                                      
case $port in                                                                                                                                                                                                   
1)                                                                                                                                                                                                              
read -p "Type New Port For Xray Trojan : " xtls2
if [ -z $xtls2 ]; then                                                                                                                                                                                            
echo "Please Input Port"                                                                                                                                                                                        
exit 0                                                                                                                                                                                                          
fi                   

cek=$(netstat -nutlp | grep -w $xtls2)
if [[ -z $cek ]]; then
sed -i "s/$xtls/$xtls2/g" /etc/xray/xrayxtls.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xtls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xtls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $xtls2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $xtls2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port XTLS $xtls2 ${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $xtls2  Is Already Used"                                                                                                                                                          
fi
;;                                                                                                                                                                                                              
x)                                                                                                                                                                                                              
exit                                                                                                                                                                                                                                                                                                                                                                                                                      
;;                                                                                                                                                                                                              
*)                                                                                                                                                                                                              
echo "Boh salah tekan "  
port-xtls                                                                                                                                                                         
;;                                                                                                                                                                                                              
esac
