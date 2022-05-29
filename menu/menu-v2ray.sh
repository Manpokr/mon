#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
bd='\e[1m'

IP=$(wget -qO- ipinfo.io/ip);
ssr_folder="/usr/bin/v2ray"
status=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

if [[ -e ${ssr_folder} ]]; then
if [[ $status == "running" ]]; then
        Current_status=" ${GREEN}V2RAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
        Current_status=" ${GREEN}V2RAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
        Current_status=" ${RED}V2RAY NOT INSTALL ${NC}"
fi
clear   
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[0;100;31m               • MENU V2RAY •                \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e "Current status:$Current_status "
echo -e""
echo -e "[${CYAN}•1${NC}] $bd Create Account Vmess Websocket ${NC}"
echo -e "[${CYAN}•2${NC}] $bd Create Account Vless Websocket ${NC}"
echo -e "[${CYAN}•3${NC}] $bd Create Account Trojan ${NC}"
echo -e "[${CYAN}•4${NC}] $bd Delete Account Vmess Websocket ${NC}"
echo -e "[${CYAN}•5${NC}] $bd Delete Account Vless Websocket ${NC}"
echo -e "[${CYAN}•6${NC}] $bd Delete Account Trojan ${NC}"
echo -e "[${CYAN}•7${NC}] $bd Renew Account Vmess Websocket ${NC}"
echo -e "[${CYAN}•8${NC}] $bd Renew Account Vless Websocket ${NC}"
echo -e "[${CYAN}•9${NC}] $bd Renew Account Trojan ${NC}"
echo -e "[${CYAN}10${NC}] $bd Check Account Vmess Websocket ${NC}"
echo -e "[${CYAN}11${NC}] $bd Check Account Vless Websocket ${NC}"
echo -e "[${CYAN}12${NC}] $bd Check Account Trojan ${NC}"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
addvless
;;
3)
addtrojan
;;
4)
delvmess
;;
5)
delvless
;;
6)
deltrojan
;;
7)
renewvmess
;;
8)
renewvless
;;
9)
renewtrojan
;;
10)
cekvmess
;;
11)
cekvless
;;
12)
cektrojan
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number"
sleep 1
menu-v2ray
;;
esac
