#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                      ┃ V2Ray Core MENU ┃                        ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create Account VMess                                          ║"
echo "║ 2.Create Account VLess                                          ║"
echo "║ 3.Create Account Trojan                                         ║"
echo "║ 4.Create Account Trojan-go                                      ║"
echo "║ 5.Delete Account VMess                                          ║"
echo "║ 6.Delete Account VLess                                          ║"
echo "║ 7.Delete Account Trojan                                         ║"
echo "║ 8.Delete Account Trojan-go                                      ║"
echo "║ 9.Renews Account VMess                                          ║"
echo "║ 10.Renews Account VLess                                         ║"
echo "║ 11.Renews Account Trojan                                        ║"
echo "║ 12.Renews Account Trojan-go                                     ║"
echo "║ 13.Check User Login Vmess                                       ║"
echo "║ 14 Check User Login Vless                                       ║"
echo "║ 15.Check User Login Trojan                                      ║"
echo "║ 16.Check User Login Trojan-Go                                   ║"
echo "║ 17.Exit Menu                                                    ║"                                   ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 ] :  " menu
case $menu in 
1)
addvmess
;;
2)
addvless
;;
3)
addtrojan
;;
4)
addtrgo
;;
5)
delvmess
;;
7)
delvless
;;
7)
deltrojan
;;
8)
deltrgo
;;
9)
renewvmess
;;
10)
renewvless
;;
11)
renewtrojan
;;
12)
renewtrgo
;;
13)
cekvmess
;;
14)
cekvless
;;
15)
cektrojan
;;
16)
cektrgo
;;
17)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
