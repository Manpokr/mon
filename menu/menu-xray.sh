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
clear
echo -e "          ═══[XRAY CORE MENU]═══" | lolcat
echo -e " \e[32m═══════════════════════════════\e[m" | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create Account Vmess TCP (${color2}addxray${color3})"
echo -e "${color1}2${color3}.$bd Create Account Vless TCP (${color2}addxray${color3})"
echo -e "${color1}3${color3}.$bd Create Account Trojan (${color2}addxray${color3})"
echo -e "${color1}4${color3}.$bd Create Account Xtls (${color2}addxray${color3})"
echo -e "${color1}5${color3}.$bd Create Account GRPC (${color2}addxray${color3})"
echo -e "${color1}6${color3}.$bd Create Account TR-XTLS (${color2}addxray${color3})"
echo -e "${color1}7${color3}.$bd Create Account TR-GRPC (${color2}addxray${color3})"
echo -e "-----------------------------------------------------------------------------------" | lolcat
echo -e "${color1}8${color3}.$bd Delete Account Vmess TCP (${color2}delray${color3})"
echo -e "${color1}9${color3}.$bd Delete Account Vless TCP (${color2}delxray${color3})"
echo -e "${color1}10${color3}.$bd Delete Account Trojan (${color2}delxray${color3})"
echo -e "${color1}11${color3}.$bd Delete Account Xtls (${color2}delxray${color3})"
echo -e "${color1}12${color3}.$bd Delete Account GRPC (${color2}delxray${color3})"
echo -e "${color1}13${color3}.$bd Delete Account TR-XTLS (${color2}delxray${color3})"
echo -e "${color1}14${color3}.$bd Delete Account TR-GRPC (${color2}delxray${color3})"
echo -e "-----------------------------------------------------------------------------------" | lolcat
echo -e "${color1}15${color3}.$bd Renew Account Vmess TCP(${color2}renewxray${color3})"
echo -e "${color1}16${color3}.$bd Renew Account Vless TCP(${color2}renewxray${color3})"
echo -e "${color1}17${color3}.$bd Renew Account Trojan (${color2}renewxray${color3})"
echo -e "${color1}18${color3}.$bd Renew Account Xtls (${color2}renewxray${color3})"
echo -e "${color1}19${color3}.$bd Renew Account GRPC (${color2}renewxray${color3})"
echo -e "${color1}20${color3}.$bd Renew Account TR-XTLS (${color2}renewxray${color3})"
echo -e "${color1}21${color3}.$bd Renew Account TR-GRPC (${color2}renewxray${color3})"
echo -e "-----------------------------------------------------------------------------------" | lolcat
echo -e "${color1}22${color3}.$bd Check Account Vmess TCP (${color2}cekxray${color3})"
echo -e "${color1}23${color3}.$bd Check Account Vless TCP (${color2}cekxray${color3})"
echo -e "${color1}24${color3}.$bd Check Account Trojan (${color2}cekxray${color3})"
echo -e "${color1}25${color3}.$bd Check Account Xtls (${color2}cekxray${color3})"
echo -e "${color1}26${color3}.$bd Check Account GRPC (${color2}cekxray${color3})"
echo -e "${color1}27${color3}.$bd Check Account TR-XTLS (${color2}cekxray${color3})"
echo -e "${color1}28${color3}.$bd Check Account TR-GRPC (${color2}cekxray${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addxvmess
;;
2)
addxvless
;;
3)
addxtrojan
;;
4)
addxtls
;;
5)
addgrpc
;;
6)
addtrxtls
;;
7)
addtrojangrpc
;;
8)
delxvmess
;;
9)
delxvless
;;
10)
delxtrojan
;;
11)
delxtls
;;
12)
delgrpc
;;
13)
deltrxtls
;;
14)
deltrgrpc
;;
15)
renewxvmess
;;
16)
renewxvless
;;
17)
renewxtrojan
;;
18)
renewxtls
;;
19)
renewgrpc
;;
20)
renewtrxtls
;;
21)
renewtrgrpc
;;
22)
cekxvmess
;;
23)
cekxvless
;;
24)
cekxtrojan
;;
25)
cekxtls
;;
26)
cekgrpc
;;
27)
cektrxtls
;;
28)
cektrgrpc
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
menu-xray
;;
esac
