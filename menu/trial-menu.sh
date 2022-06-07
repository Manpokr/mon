#!/bin/bash
# TRIAL MENU
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
echo -e "\033[30;5;47m                   ⇱ MENU TRIAL ⇲                 \033[m"
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
echo -e "[${CYAN}•1${NC}] Create TRial XRay VMess Accounts "                     
echo -e "[${CYAN}•2${NC}] Create TRial XRay VLess Accounts "                    
echo -e "[${CYAN}•3${NC}] Create TRial XRay Trojan Accounts "                    
echo -e "[${CYAN}•4${NC}] Create TRial XRay XTLS Accounts "                          
echo -e "[${CYAN}•5${NC}] Create TRial XRay GRPC Accounts "    
echo -e "[${CYAN}•6${NC}] Create TRial XRAY TR-GRPC Accounts "                          
echo -e "[${CYAN}•7${NC}] Create TRial XRAY TR-XTLS Accounts "                            
echo -e "[${CYAN}•8${NC}] Create TRial V2Ray Vmess Websocket "                         
echo -e "[${CYAN}•9${NC}] Create TRial V2Ray Vless Websocket "                        
echo -e "[${CYAN}10${NC}] Create Trial V2Ray Trojan "                               
echo -e "[${CYAN}11${NC}] Create TRial ShadowsocksR "                             
echo -e "[${CYAN}12${NC}] Create TRial Shadowsocks "                           
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
echo -e "\033[5;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[m"
echo -e""
read -p " silahkan masukkan nomor [1-12 or x] :  "  menu
case $menu in 
1) clear ; trialxvmess ; exit ;;
2) clear ; trialxvless ; exit ;;
3) clear ; trialxtrojan ; exit ;; 
4) clear ; trialxtls ; exit ;; 
5) clear ; trialgrpc ; exit ;; 
6) clear ; trialtrgrpc ; exit ;; 
7) clear ; trialtrxtls ; exit ;;
8) clear ; trialvmess ; exit ;; 
9) clear ; trialvless ; exit ;;
10) clear ; trialtrojan ; exit ;;
11) clear ; trialssr ; exit ;;
12) clear ; trialss ; exit ;;
x) clear ; menu ;;
*) echo -e "" ; echo "Boh salah tekan " ; sleep 1 ; trial-menu ;;
esac

