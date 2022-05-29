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
NC='\e[0m'

# Getting
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

# RUN
ssr_folder="/usr/bin/wg-quick@wg0"
sswg=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

if [[ -e ${ssr_folder} ]]; then
if [[  $sswg == "running" ]]; then
      status_wg=" ${GREEN}WG INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
      status_wg=" ${GREEN}WG INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
      status_wg=" ${RED}WG NOT INSTALL ${NC}"
fi
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[0;100;31m         • MENU WIREGUARD •                \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e "Current status:$status_wg "
echo -e""
echo -e "[${CYAN}•1${NC}] $bd Create Account Wireguard ${NC}"
echo -e "[${CYAN}•2${NC}] $bd Delete Account Wireguard ${NC}"
echo -e "[${CYAN}•3${NC}] $bd Check User Login Wireguard ${NC}"
echo -e "[${CYAN}•4${NC}] $bd Renew Account Wireguard ${NC}"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e""
read -p "  Please Enter The Number  [1-4 or x] :  "  menu
echo -e ""
case $menu in
1)
addwg
;;
2)
delwg
;;
3)
cekwg
;;
4)
renewwg
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number"
sleep 1
menu-wg
;;
esac
