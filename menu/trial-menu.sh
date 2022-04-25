#!/bin/bash
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED}          • MENU TRIAL •          ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e""

echo -e "[${CYAN}•1${NC}] $bd Create TRial XRay VMess Accounts ${NC}"                     
echo -e "[${CYAN}•2${NC}] $bd Create TRial XRay VLess Accounts ${NC}"                    
echo -e "[${CYAN}•3${NC}] $bd Create TRial XRay Trojan Accounts ${NC}"                    
echo -e "[${CYAN}•4${NC}] $bd Create TRial XRay XTLS Accounts ${NC}"                          
echo -e "[${CYAN}•5${NC}] $bd Create TRial XRay GRPC Accounts ${NC}"                          
echo -e "[${CYAN}•6${NC}] $bd Create TRial V2Ray Vmess Websocket ${NC}"                         
echo -e "[${CYAN}•7${NC}] $bd Create TRial V2Ray Vless Websocket ${NC}"                        
echo -e "[${CYAN}•8${NC}] $bd Create Trial V2Ray Trojan ${NC}"                               
echo -e "[${CYAN}•9${NC}] $bd Create TRial ShadowsocksR ${NC}"                             
echo -e "[${CYAN}10${NC}] $bd Create TRial Shadowsocks ${NC}"                           
echo -e "[${CYAN}11${NC}] $bd Create TRial SSTP Accounts ${NC}"                          
echo -e "[${CYAN}12${NC}] $bd Create TRial PPTP Accounts ${NC}"                            
echo -e "[${CYAN}13${NC}] $bd Create TRial L2TP Accounts ${NC}"                               
echo -e""
echo -e "[${RED}•x${NC}] ${RED} Menu${NC}"
echo -e""
read -p " silahkan masukkan nomor [1-13 or x] :  "  menu
case $menu in 
1)
trialxvmess
;;
2)
trialxvless
;;
3)
trialxtrojan
;;
4)
trialxtls
;;
5)
trialgrpc
;;
6)
trialvmess 
;;
7)
trialvless
;;
8)
trialtrojan
;;
9)
trialssr
;;
10)
trialss
;;
11)
trialsstp
;;
12)
trialpptp
;;
13)
triall2tp
;;
x)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac



