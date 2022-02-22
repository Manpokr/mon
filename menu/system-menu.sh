#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                        ┃ System MENU ┃                          ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Add Or Change Subdomain Host For VPS                          ║"
echo "║ 2.Change Port Of Some Service                                   ║"
echo "║ 3.Renew Certificate V2RAY                                       ║"
echo "║ 4.Autobackup Data VPS                                           ║"
echo "║ 5.Backup Data VPS                                               ║"
echo "║ 6.Restore Data VPS                                              ║"
echo "║ 7.Webmin Menu                                                   ║"
echo "║ 8.Limit Bandwith Speed Server                                   ║"
echo "║ 9.Speedtest Server                                              ║"
echo "║ 10.Reboot VPS                                                   ║"
echo "║ 11.System Running.                                              ║"
echo "║ 12.Exit Menu                                                    ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 or x] :  " menu
case $menu in 
1)
addhost
;;
2)
changeport
;;
3)
certv2ray
;;
4)
autobackup
;;
5)
backup
;;
6)
restore
;;
7)
wbmn
;;
8)
limitspeed
;;
9)
speedtest
;;
10)
reboot
;;
11)
running
;;
12)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
