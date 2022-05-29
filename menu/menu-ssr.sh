#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
bd='\e[1m'

IP=$(wget -qO- ipinfo.io/ip);
ssr_folder="/usr/local/shadowsocksr"
ssr=$(systemctl status ssrmu | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

if [[ -e ${ssr_folder} ]]; then
if [[ $ssr == "running" ]]; then
         status_ssr=" ${GREEN}SSR INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
         status_ssr=" ${GREEN}SSR INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
         status_ssr=" ${RED}SSR NOT INSTALL ${NC}"
fi
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[0;100;31m              • MENU SSR / SS •             \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e "Current status:$status_ssr "
echo -e""                                                                                                           
echo -e "[${CYAN}•1${NC}] $bd  Create Account ShadowsocksR ${NC}"
echo -e "[${CYAN}•2${NC}] $bd  Create Account Shadowsocks  ${NC}"
echo -e "[${CYAN}•3${NC}] $bd  Delete Account ShadowsocksR ${NC}"
echo -e "[${CYAN}•4${NC}] $bd  Delete Account Shadowsocks ${NC}"
echo -e "[${CYAN}•5${NC}] $bd  Renew Account ShadowsocksR ${NC}"
echo -e "[${CYAN}•6${NC}] $bd  Renew Account Shadowsocks ${NC}"
echo -e "[${CYAN}•7${NC}] $bd  Check User Login SSR & SS ${NC}"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
read -p " Please Enter The Number  [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addssr
;;
2)
addss
;;
3)
delssr
;;
4)
delss
;;
5)
renewssr
;;
6)
renewss
;;
7)
cekss
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number" 
sleep 1
menu-ssr
;;
esac
