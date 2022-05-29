#!/bin/bash
#Menu
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
bd='\e[1m'                                                                                                                                                                                        
#getting                                                                                                    
IP=$(wget -qO- ipinfo.io/ip);                                                                                       
echo "Checking VPS"                                                                                                 
clear 

# RUN
ssr_folder="/usr/bin/python"
wsdrop=$(systemctl status websocket | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                       

if [[ -e ${ssr_folder} ]]; then
if [[ $wsdrop == "running" ]]; then
        status_sshws=" ${GREEN}XRAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
        status_sshws=" ${GREEN}XRAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
        status_sshws=" ${RED}XRAY NOT INSTALL ${NC}"
fi     

# RUN

ssr_folder="/usr/sbin/sshd"
ssh=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)                                                                      


if [[ -e ${ssr_folder} ]]; then
if [[ $ssh == "running" ]]; then
        status_ssh=" ${GREEN}XRAY INSTALLED${NC} & ${GREEN}RUNNING${NC}"
else
        status_ssh=" ${GREEN}XRAY INSTALLED${NC} BUT ${RED}NOT RUNNING${NC}"
fi
cd "${ssr_folder}"
else
        status_ssh=" ${RED}XRAY NOT INSTALL ${NC}"
fi                
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[0;100;31m               • MENU SSH •                \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
echo -e "Current status:$status_ssh " 
echo -e "Current status:$status_sshws "                                                                    
echo -e""                                                                                                           
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
echo -e""                                                                                                           
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
read -p "  Please Enter The Number  [1-9 or x] :  "  menu
echo -e ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number"
sleep 1
menu-ssh
;;
esac
