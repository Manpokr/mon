#!/bin/bash
#Menu ssh
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
LIGHT='\033[0;37m'
                                                                                                                                                                                      
#getting           
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f menu-wg
exit 0
fi
clear

# Running
wg_folder="/etc/wireguard/"
kjj='wg0'
chck_pid(){
PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_wg(){
if [[ -e ${wg_folder} ]]; then
chck_pid
if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} WG INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} WG INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${wg_folder}"
else
echo -e "\033[0;37mCurrent Status:\033[m ${RED}WG NOT INSTALL${NC}"
fi
}

clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                 ⇱ WIREGUARD MENU ⇲               \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
menu_wg
echo -e""
echo -e "[${CYAN}•1${NC}]  Create Account Wireguard "
echo -e "[${CYAN}•2${NC}]  Delete Account Wireguard "
echo -e "[${CYAN}•3${NC}]  Check User Login Wireguard "
echo -e "[${CYAN}•4${NC}]  Renew Account Wireguard "
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p "  silahkan masukkan nomor [1-4 or x] :  "  menu
echo -e ""
case $menu in
1) clear ; addwg ; exit ;;
2) clear ; delwg ; exit ;;
3) clear ; cekwg ; exit ;;
4) clear ; renewwg ; exit ;;
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-wg ;;
esac
