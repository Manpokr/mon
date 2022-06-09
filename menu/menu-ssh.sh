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
IP=$(wget -qO- ipinfo.io/ip);                                                                                       
echo "Checking VPS"                                                                                                 
clear 

chck_pid(){
	PID=`ps -ef |grep -v grep | grep dropbear |awk '{print $2}'`
}
menu_sts(){
	if dpkg -s dropbear > /dev/null 2>&1; then
		chck_pid
		if [[ ! -z "${PID}" ]]; then
			echo -e "\033[0;37mCurrent Status :\033[m ${GREEN}SSH INSTALLED${NC} & ${GREEN}RUNNING${NC}"
		else
			echo -e "\033[0;37mCurrent Status :\033[m ${GREEN}SSH INSTALLED${NC} but ${RED}NOT RUNNING${NC}"
		fi
	#	cd "${ssr_folder}"
	else
		echo -e "\033[0;37mCurrent Status :\033[m ${RED}SSH NOT INSTALLED${NC}"
	fi
}
chck_sshwb(){
	PID=`ps -ef |grep -v grep | grep websocket |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			echo -e "\033[0;37mCurrent Status :\033[m ${GREEN}SSHWS INSTALLED${NC} & ${GREEN}RUNNING${NC}"
			sts="\033[0;32m◉ \033[0m"
		else
			echo -e "\033[0;37mCurrent Status :\033[m ${GREEN}SSHWS INSTALLED${NC} but ${RED}NOT RUNNING${NC}"
			sts="\033[1;31m○ \033[0m"
    fi
}
clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                   ⇱ MENU SSH ⇲                   \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
menu_sts
chck_sshwb
echo -e ""                                                                                                           
echo -e "[${CYAN}•1${NC}] $bd Create Account SSH & OpenVPN ${NC}"                                                   
echo -e "[${CYAN}•2${NC}] $bd Trial Account SSH & OpenVPN ${NC}"                                                    
echo -e "[${CYAN}•3${NC}] $bd Renew Account SSH & OpenVPN ${NC}"                                                    
echo -e "[${CYAN}•4${NC}] $bd Delete Account SSH & OpenVPN ${NC}"                                                   
echo -e "[${CYAN}•5${NC}] $bd Check User Login SSH & OpenVPN ${NC}"                                                 
echo -e "[${CYAN}•6${NC}] $bd Daftar Member SSH & OpenVPN ${NC}"                                                    
echo -e "[${CYAN}•7${NC}] $bd Padam User SSH & OpenVPN Exp ${NC}"                                                   
echo -e "[${CYAN}•8${NC}] $bd Set up Autokill SSH ${NC}"                                                            
echo -e "[${CYAN}•9${NC}] $bd Check User Multi Login SSH ${NC}"                                                     
echo -e "[${CYAN}10${NC}] $bd Restart All Service${NC} "                                                            
echo -e ""                                                                                                           
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e ""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e ""
read -p "  silahkan masukkan nomor [1-10 or x] :  "  menu
echo -e ""
case $menu in
1) clear ; addssh ; exit ;;
2) clear ; trialssh ; exit ;;
3) clear ; renewssh ; exit ;; 
4) clear ; delssh ; exit ;; 
5) clear ; cekssh ; exit ;; 
6) clear ; member ; exit ;; 
7) clear ; delexp ; exit ;;
8) clear ; autokill ; exit ;; 
9) clear ; ceklim ; exit ;;
10) clear ; restart ; exit ;;
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-ssh ;;
esac
