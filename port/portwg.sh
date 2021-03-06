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
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
clear
wg="$(cat /etc/wireguard/params | grep SERVER_PORT | sed s'/SERVER_PORT=//g')"
echo -e "======================================"
echo -e "         Wireguard Port Changer"
echo -e ""
echo -e "      [1] Change Port ${RED}$wg${NC}"
echo -e "      [x] Exit"
echo -e ""
echo -e "======================================"
echo -e ""  
read -p "  silahkan masukkan nomor [1 or x] :  "  port                                                                                                                                                                                                 
echo -e ""                                                                                                                                                                                                      
case $port in                                                                                                                                                                                                   
1)
read -p "New Port Wireguard : " wg2
if [ -z $wg2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $wg2)
if [[ -z $cek ]]; then
sed -i "s/$wg/$wg2/g" /etc/wireguard/wg0.conf
sed -i "s/$wg/$wg2/g" /etc/wireguard/params
iptables -D INPUT -i $NIC -p udp --dport $wg -j ACCEPT
iptables -I INPUT -i $NIC -p udp --dport $wg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl reload wg-quick@wg0 > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port WG $wg2${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $wg2 Is Already Used"                                                                                                                                                          
fi
;;                                                                                                                                                                                                              
x)                                                                                                                                                                                                              
exit                                                                                                                                                                                                                                                                                                                                                                                                                      
;;                                                                                                                                                                                                              
*)                                                                                                                                                                                                              
echo "Boh salah tekan "  
portwg                                                                                                                                                                         
;;                                                                                                                                                                                                              
esac
