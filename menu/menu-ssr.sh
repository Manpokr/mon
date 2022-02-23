#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                       ┃ SSR / SS  Menu ┃                        ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create ShadowsocksR Accounts                                  ║"
echo "║ 2.Create Shadowsocks Accounts                                   ║"
echo "║ 3.Delete ShadowsocksR Accounts                                  ║"
echo "║ 4.Delete Shadowsocks Accounts                                   ║"
echo "║ 5.Renew ShadowsocksR Accounts                                   ║"
echo "║ 6.Renew Shadowsocks Accounts                                    ║"                                     ║"
echo "║ 7.Trial ShadowsocksR Accounts                                   ║"
echo "║ 8.Trial Shadowsocks Accounts                                    ║"
echo "║ 9.Check User Login SS/SSR                                       ║"   
echo "║ 10.Exit Menu                                                    ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "Select From Options [1-7] :  " menu
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
trialssr
;;
8)
trialss
;;
9)
cekss
;;
10)
menu
;;
*)
echo "Input The Correct Number !"
;;
esac
