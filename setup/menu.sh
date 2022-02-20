#!/bin/bash
#Menu

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
echo -e " ║       AutoScript VPN By Manternet       ║ "|lolcat
echo -e " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
echo -e "Uptime : $(neofetch | grep Uptime | cut -d " " -f 2-100)" |lolcat
echo -e "Domain : $(cat /etc/xray/domain)" |lolcat
echo -e "IP VPS : $MYIP" |lolcat
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
echo -e ""
echo -e "[${CYAN}1${NC}] • >> SSH / OPenVPN Menu" |lolcat
echo -e "[${CYAN}2${NC}] • >> Wireguard Menu" |lolcat
echo -e "[${CYAN}3${NC}] • >> SS / SSR Menu" |lolcat
echo -e "[${CYAN}4${NC}] • >> XRay Core Menu" |lolcat
echo -e "[${CYAN}5${NC}] • >> V2Ray Core Menu" |lolcat
echo -e "[${CYAN}6${NC}] • >> ALL TRial Menu" |lolcat
echo -e "[${CYAN}7${NC}] • >> System  Menu" |lolcat
echo -e "[${CYAN}8${NC}] • >> Menu Bot" |lolcat
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
echo -e "Version : ${BLUE}$(cat /home/ver)${NC}" |lolcat
echo -e "Client Name : Manternet" |lolcat
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
echo -e "Telegram : t.me/Manternet" |lolcat
echo -e "Github   : https://github.com/Manternet" |lolcat
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ "|lolcat
read -p "Select Menu Options [ 1 - 7 ] : " menu
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-xray
;;
5)
menu-v2ray
;;
6)
trial-menu
;;
7)
system-menu
;;
8)
menu-bbt
;;
*)
clear
menu
;;
esac
