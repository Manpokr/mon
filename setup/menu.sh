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


        echo -e "   Uptime : $(neofetch | grep Uptime | cut -d " " -f 2-100)" | lolcat
	echo -e "   Domain : $(cat /etc/xray/domain)" | lolcat
	echo -e "   \e[033;1mIPVPS:\e[0m $MYIP" | lolcat
echo -e  ""
echo -e  "   -------------------------MENU OPTIONS------------------------"
echo -e   "   1\e[1;33m)\e[m SSH & OpenVPN Menu" 
echo -e   "   2\e[1;33m)\e[m Panel Wireguard " 
echo -e   "   3\e[1;33m)\e[m Panel L2TP & PPTP Account" 
echo -e   "   4\e[1;33m)\e[m Panel SSTP  Account" 
echo -e   "   5\e[1;33m)\e[m Panel SSR & SS Account" 
echo -e   "   6\e[1;33m)\e[m Panel V2Ray" 
echo -e   "   7\e[1;33m)\e[m Panel VLess" 
echo -e   "   8\e[1;33m)\e[m Panel Trojan" 
echo -e   "   9\e[1;33m)\e[m Panel TrojanGO"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "                             SYSTEM MENU\e[m"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "   10\e[1;33m)\e[m  Add Subdomain Host For VPS" 
echo -e   "   11\e[1;33m)\e[m  Renew Certificate V2RAY" 
echo -e   "   12\e[1;33m)\e[m  Change Port All Account"
echo -e   "   13\e[1;33m)\e[m  Backup Data VPS" 
echo -e   "   14\e[1;33m)\e[m  Restore Data VPS" 
echo -e   "   15\e[1;33m)\e[m  Webmin Menu" 
echo -e   "   16\e[1;33m)\e[m  Limit Bandwith Speed Server" 
echo -e   "   17\e[1;33m)\e[m  Check Usage of VPS Ram"  
echo -e   "   18\e[1;33m)\e[m  Reboot VPS" 
echo -e   "   19\e[1;33m)\e[m  Speedtest VPS" 
echo -e   "   20\e[1;33m)\e[m  Information Display System" 
echo -e   "   21\e[1;33m)\e[m  Info Script Auto Install" 
echo -e   "   22\e[1;33m)\e[m  Install BBR" 
echo -e   "   23\e[1;33m)\e[m  Add ID Cloudflare"
echo -e   "   24\e[1;33m)\e[m  Cloudflare Add-Ons" 
echo -e   "   25\e[1;33m)\e[m  Pointing BUG" 
echo -e   "   26\e[1;33m)\e[m  Clear log" 
echo -e   "   27\e[1;33m)\e[m  Auto Reboot" 
echo -e   "   28\e[1;33m)\e[m  Check Service Running"
echo -e   "   29\e[1;33m)\e[m  Update Lates Script"
echo -e   "   30\e[1;33m)\e[m  Pointing VPS"
echo -e   "   31\e[1;33m)\e[m  Cek Bandwidth VPS"
echo -e   "   32\e[1;33m)\e[m  Wildcard"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   ""
read -p "     Select From Options [1-29 or x] :  " menu
echo -e   ""
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
menu-trojango
;;
7)
vleess
;;
8)
trojaan
;;
9)
trojanGO
;;
10)
add-host
;;
11)
sudo certv2ray
;;
12)
change-port
;;
13)
backup
;;
14)
restore
;;
15)
wbmn
;;
16)
limit-speed
;;
17)
ram
;;
18)
reboot
;;
19)
speedtest
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
23)
cff
;;
24)
cfd
;;
25)
cfh
;;
26)
clear-log
;;
27)
autoreboot
;;
28)
sudo running
;;
29)
update
;;
30)
point
;;
31)
vnstat
;;
32)
wget https://raw.githubusercontent.com/halluboys/px/main/wildcard.sh; chmod +x wildcard.sh; ./wildcard.sh; rm -f wildcard.sh
;;
x)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
