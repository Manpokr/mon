#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
IP=$(wget -qO- ipinfo.io/ip);
echo -e "checking vps"
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED}          • MENU WIREGUARD •          ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e""
echo -e "[${CYAN}•1${NC}] $bd Create Account Wireguard ${NC}"
echo -e "[${CYAN}•2${NC}] $bd Delete Account Wireguard ${NC}"
echo -e "[${CYAN}•3${NC}] $bd Check User Login Wireguard ${NC}"
echo -e "[${CYAN}•4${NC}] $bd Renew Account Wireguard ${NC}"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
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
exit
;;
*)
echo "pilih nomor yang tersedia"
sleep 1
menu-wg
;;
esac
