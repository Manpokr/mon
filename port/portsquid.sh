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
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e "======================================"
echo -e "         Squid Port Changer"
echo -e ""
echo -e "    [1] Change Port ${RED}$sqd${NC}"
echo -e "    [2] Change Port ${RED}$sqd2${NC}"
echo -e "    [x] Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "  silahkan masukkan nomor [1-2 or x] :  "  prot                                                                                                                                                                                                 
echo -e ""
case $prot in
1)
read -p "New Port Squid: " squid
if [ -z $squid ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
/etc/init.d/squid restart > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Squid $squid${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $squid Is Already Used"                                                                                                                                                          
fi
;;
2)
read -p "New Port Squid: " squid
if [ -z $squid ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
/etc/init.d/squid restart > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Squid $squid${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $squid Is Already Used"                                                                                                                                                          
fi
;;
x)
exit
;;
*)
echo "Boh salah tekan"
portsquid
;;
esac

