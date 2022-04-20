#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear
IP=$(wget -qO- ipinfo.io/ip);
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${PURPLE}          • MENU V2RAY •          ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
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
echo -e "[${RED}x${NC}].${RED} Menu${NC}"
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
exit
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
menu-v2ray
;;
esac
