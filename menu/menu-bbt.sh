#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'

clear
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e "\033[30;5;47m                    ⇱ BOT MENU ⇲                  \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e ""
echo -e "[${CYAN}•1${NC}] Create Bot Configuration "                                      
echo -e "[${CYAN}•2${NC}] Delete Bot Configuration "                                 
echo -e "[${CYAN}•3${NC}] Restart Bot Services "                                        
echo -e ""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"                                                          
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p "  silahkan masukkan nomor [1-3 or x] :  "  menu
case $menu in 
1) clear ; addbbt ; exit ;;
2) clear ; delbbt ; exit ;;
3) clear ; systemctl restart bbt ; menu ; exit ;; 
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; menu-bbt ;;
esac
