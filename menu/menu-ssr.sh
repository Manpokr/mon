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
echo -e "Current Status:${GREEN} SSR INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "Current Status:${GREEN} SSR INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
echo -e "Current Status: ${RED}SSR NOT INSTALL${NC}"
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
echo -e "Current Status:${GREEN} SS INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
echo -e "Current Status:${GREEN} SS INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
else
echo -e "Current Status: ${RED}SS NOT INSTALL${NC}"
fi
}

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;31m                  ⇱ SSR / SS MENU ⇲               \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
menu_ssr
menu_sts
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
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
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
