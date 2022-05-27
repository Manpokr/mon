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

clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                 
echo -e "${RED}           • BOT MENU •          ${NC}"               
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "[${CYAN}•1${NC}] $bd Create Bot Configuration ${NC}"                                      
echo -e "[${CYAN}•2${NC}] $bd Delete Bot Configuration ${NC}"                                 
echo -e "[${CYAN}•3${NC}] $bd Restart Bot Services ${NC}"                                        
echo -e ""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"                                                          
echo -e""
read -p "     Select From Options [1-4] :  " menu
case $menu in 
1)
addbbt
;;
2)
delbbt
;;
3)
systemctl restart bbt 
menu
;;
x)
sleep 1
menu
;;
*)
echo "Input The Correct Number !"
sleep 1
menu-bbt
;;
esac
