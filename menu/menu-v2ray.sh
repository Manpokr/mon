#!/bin/bash
#Menu v2ray
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
LIGHT='\033[0;37m'

# GETTING
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f menu_v2ray
exit 0
fi
clear

# Running
v2ray1_folder="/usr/bin/v2ray"
kjj='/etc/v2ray/config.json'
chck_pid(){
PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_v2ray1(){
if [[ -e ${v2ray1_folder} ]]; then
chck_pid
if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} V2RAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} V2RAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${v2ray1_folder}"
else
echo -e "\033[0;37mCurrent Status:\033[m ${RED}V2RAY NOT INSTALL${NC}"
fi
}
clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                   ⇱ V2RAY MENU ⇲                 \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
menu_v2ray1
echo -e""
echo -e "[${CYAN}•1${NC}]  Create Account Vmess Websocket "
echo -e "[${CYAN}•2${NC}]  Create Account Vless Websocket "
echo -e "[${CYAN}•3${NC}]  Create Account Trojan "
echo -e "[${CYAN}•4${NC}]  Delete Account Vmess Websocket "
echo -e "[${CYAN}•5${NC}]  Delete Account Vless Websocket "
echo -e "[${CYAN}•6${NC}]  Delete Account Trojan "
echo -e "[${CYAN}•7${NC}]  Renew Account Vmess Websocket "
echo -e "[${CYAN}•8${NC}]  Renew Account Vless Websocket "
echo -e "[${CYAN}•9${NC}]  Renew Account Trojan "
echo -e "[${CYAN}10${NC}]  Check Account Vmess Websocket "
echo -e "[${CYAN}11${NC}]  Check Account Vless Websocket "
echo -e "[${CYAN}12${NC}]  Check Account Trojan "
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p "  silahkan masukkan nomor [1-12 or x] :  "  menu
echo -e ""
case $menu in
1) clear ; addvmess ; exit ;;
2) clear ; addvless ; exit ;;
3) clear ; addtrojan ; exit ;;
4) clear ; delvmess ; exit ;;
5) clear ; delvless ; exit ;;
6) clear ; deltrojan ; exit ;;
7) clear ; renewvmess ; exit ;;
8) clear ; renewvless ; exit ;;
9) clear ; renewtrojan ; exit ;;
10) clear ; cekvmess ; exit ;;
11) clear ; cekvless ; exit ;;
12) clear ; cektrojan ; exit ;;
x) clear ; menu ; exit ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-v2ray ;;
esac
