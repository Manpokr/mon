#!/bin/bash
# My Telegram : https://t.me/Manternet
# ==========================================
# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
LIGHT='\033[0;37m'

# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
########################
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"                                                                                                               
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )                       
if [[ $MYIP = $IZIN ]]; then                                                                                                      
echo -e "${NC}${GREEN}Permission Accepted...${NC}"                                                                                
else                                                                                                                              
echo -e "${NC}${RED}Permission Denied!${NC}";                                                                                     
echo -e "${NC}${LIGHT}Please Contact Admin!!"                                                                                     
rm -f changeport.sh                                                                                                                    
exit 0                                                                                                                            
fi                                                                                                                                                                                                                                                  
clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                   ⇱ PORT CHANGER ⇲               \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e ""
echo -e "[${CYAN}•1${NC}] Change Port OpenVPN"
echo -e "[${CYAN}•2${NC}] Change Port Wireguard"
echo -e "[${CYAN}•3${NC}] Change Port Vmess"
echo -e "[${CYAN}•4${NC}] Change Port VLess"
echo -e "[${CYAN}•5${NC}] Change Port Trojan"
echo -e "[${CYAN}•6${NC}] Change Port Squid"
echo -e "[${CYAN}•7${NC}] Change Port XRay VMess"
echo -e "[${CYAN}•8${NC}] Change Port XRay VLess"
echo -e "[${CYAN}•9${NC}] Change Port XRay Trojan"
echo -e "[${CYAN}10${NC}] Change Port XRay XTLS"
echo -e "[${CYAN}11${NC}] Change Port Xray GRPC"
echo -e "[${CYAN}12${NC}] Change Port Trojan-go"
echo -e "[${CYAN}13${NC}] Change Port Trojan GRPC"
echo -e "[${CYAN}14${NC}] Change Port Trojan XTLS"
echo -e ""
echo -e "[${RED}•x${NC}] ${RED}Menu${NC}"
echo -e ""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
read -p "  silahkan masukkan nomor [1-14 or x] :  "  port
case $port in
1) clear ; portovpn ; exit ;;
2) clear ; portwg ; exit ;;
3) clear ; port-vmess ; exit ;; 
4) clear ; port-vless ; exit ;; 
5) clear ; port-trojan ; exit ;; 
6) clear ; portsquid ; exit ;; 
7) clear ; port-xws ; exit ;;
8) clear ; port-xvl ; exit ;; 
9) clear ; port-xtr ; exit ;;
10) clear ; port-xtls ; exit ;;
11) clear ; port-grpc ; exit ;;
12) clear ; port-trojan-go ; exit ;;
13) clear ; port-trgrpc ; exit ;; 
14) clear ; port-trxtls ; exit ;; 
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; changeport ;;
esac
