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
rm -f menu-ssr
exit 0
fi
clear

# Running
ssr_folder="/usr/local/shadowsocksr"
kjj='server.py'
chck_pid(){
PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_ssr(){
if [[ -e ${ssr_folder} ]]; then
chck_pid
if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} SSR INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} SSR INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
echo -e "\033[0;37mCurrent Status:\033[m ${RED}SSR NOT INSTALL${NC}"
fi
}
ss_folder="/usr/bin/ss-server"
kjjj='ss-server'
chckk_pid(){
PIDD=`ps -ef |grep -v grep | grep $kjjj |awk '{print $2}'`
}
menu_sts(){
if [[ -e ${ss_folder} ]]; then
chckk_pid
if [[ ! -z "${PIDD}" ]]; then
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} SS INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "\033[0;37mCurrent Status:\033[m${GREEN} SS INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
else
echo -e "\033[0;37mCurrent Status:\033[m ${RED}SS NOT INSTALL${NC}"
fi
}

clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                  ⇱ SSR / SS MENU ⇲               \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
menu_ssr
menu_sts
echo -e""
echo -e "[${CYAN}•1${NC}] Create Account ShadowsocksR"
echo -e "[${CYAN}•2${NC}] Create Account Shadowsocks"
echo -e "[${CYAN}•3${NC}] Delete Account ShadowsocksR"
echo -e "[${CYAN}•4${NC}] Delete Account Shadowsocks"
echo -e "[${CYAN}•5${NC}] Renew Account ShadowsocksR"
echo -e "[${CYAN}•6${NC}] Renew Account Shadowsocks"
echo -e "[${CYAN}•7${NC}] Check User Login SSR & SS"
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p "  silahkan masukkan nomor [1-7 or x] :  "  menu
echo -e ""
case $menu in
1) clear ; addssr ; exit ;;
2) clear ; addss ; exit ;;
3) clear ; delssr ; exit ;;
4) clear ; delss ; exit ;;
5) clear ; renewssr ; exit ;;
6) clear ; renewss ; exit ;;
7) clear ; cekss ; exit ;;
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-ssr ;;
esac
