#!/bin/bash
#Menu xray
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
LIGHT='\033[0;37m'

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f menu_xray
exit 0
fi
clear
xray1_folder="/usr/local/xray"
kjj='/etc/xray/config.json'
chck_pid(){
PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_xray1(){
if [[ -e ${xray1_folder} ]]; then
chck_pid
if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} XRAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} XRAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${xray1_folder}"
else
echo -e "\033[0;37mCurrent Status:\033[m ${RED}XRAY NOT INSTALL${NC}"
fi
}
clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                    ⇱ XRAY MENU ⇲                 \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
menu_xray1
echo -e""
echo -e "[${CYAN}•1${NC}]  Create Account Vmess TCP"
echo -e "[${CYAN}•2${NC}]  Create Account Vless TCP"
echo -e "[${CYAN}•3${NC}]  Create Account Trojan"
echo -e "[${CYAN}•4${NC}]  Create Account Xtls  "
echo -e "[${CYAN}•5${NC}]  Create Account GRPC "
echo -e "[${CYAN}•6${NC}]  Create Account TR-XTLS "
echo -e "[${CYAN}•7${NC}]  Create Account TR-GRPC "
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
echo -e "[${CYAN}•8${NC}]  Delete Account Vmess TCP "
echo -e "[${CYAN}•9${NC}]  Delete Account Vless TCP "
echo -e "[${CYAN}10${NC}]  Delete Account Trojan "
echo -e "[${CYAN}11${NC}]  Delete Account Xtls "
echo -e "[${CYAN}12${NC}]  Delete Account GRPC "
echo -e "[${CYAN}13${NC}]  Delete Account TR-XTLS "
echo -e "[${CYAN}14${NC}]  Delete Account TR-GRPC "
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
echo -e "[${CYAN}15${NC}]  Renew Account Vmess TCP "
echo -e "[${CYAN}16${NC}]  Renew Account Vless TCP "
echo -e "[${CYAN}17${NC}]  Renew Account Trojan "
echo -e "[${CYAN}18${NC}]  Renew Account Xtls "
echo -e "[${CYAN}19${NC}]  Renew Account GRPC "
echo -e "[${CYAN}20${NC}]  Renew Account TR-XTLS "
echo -e "[${CYAN}21${NC}]  Renew Account TR-GRPC "
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
echo -e "[${CYAN}22${NC}]  Check Account Vmess TCP "
echo -e "[${CYAN}23${NC}]  Check Account Vless TCP "
echo -e "[${CYAN}24${NC}]  Check Account Trojan "
echo -e "[${CYAN}25${NC}]  Check Account Xtls "
echo -e "[${CYAN}26${NC}]  Check Account GRPC "
echo -e "[${CYAN}27${NC}]  Check Account TR-XTLS "
echo -e "[${CYAN}28${NC}]  Check Account TR-GRPC "
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p "  silahkan masukkan nomor [1-28 or x] :  "  menu
echo -e ""
case $menu in
1) clear ; addxvmess ; exit ;;
2) clear ; addxvless ; exit ;;
3) clear ; addxtrojan ; exit ;;
4) clear ; addxtls ; exit ;;
5) clear ; addgrpc ; exit ;;
6) clear ; addtrxtls ; exit ;;
7) clear ; addtrgrpc ; exit ;;
8) clear ; delxvmess ; exit ;;
9) clear ; delxvless ; exit ;;
10) clear ; delxtrojan ; exit ;;
11) clear ; delxtls ; exit ;;
12) clear ; delgrpc ; exit ;;
13) clear ; deltrxtls ; exit ;;
14) clear ; deltrgrpc ; exit ;;
15) clear ; renewxvmess ; exit ;;
16) clear ; renewxvless ; exit ;;
17) clear ; renewxtrojan ; exit ;;
18) clear ; renewxtls ; exit ;;
19) clear ; renewgrpc ; exit ;;
20) clear ; renewtrxtls ; exit ;;
21) clear ; renewtrgrpc ; exit ;;
22) clear ; cekxvmess ; exit ;;
23) clear ; cekxvless ; exit ;;
24) clear ; cekxtrojan ; exit ;;
25) clear ; cekxtls ; exit ;;
26) clear ; cekgrpc ; exit ;;
27) clear ; cektrxtls ; exit ;;
28) clear ; cektrgrpc ; exit ;;
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-xray ;;
esac
