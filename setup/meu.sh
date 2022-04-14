#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
sleep 1
        echo -e ""
        echo -e "   \e[032;1mUPTIME:\e[0m $(neofetch | grep Uptime | cut -d " " -f 2-100)" | lolcat
        echo -e "   \e[032;1mIsp Name:\e[0m $ISP" | lolcat
        echo -e "   \e[032;1mCity:\e[0m $CITY" | lolcat
        echo -e "   \e[032;1mDOMAIN:\e[0m $(cat /etc/xray/domain)" | lolcat
        echo -e "   \e[033;1mIPVPS :\e[0m $MYIP" | lolcat
echo -e  ""
echo -e  "   -------------------------MENU OPTIONS------------------------" | lolcat
echo -e   "   1\e[1;33m)\e[m SSH & OpenVPN Menu" 
echo -e   "   2\e[1;33m)\e[m Panel Wireguard " 
echo -e   "   3\e[1;33m)\e[m Panel SSR & SS Account" 
echo -e   "   4\e[1;33m)\e[m Panel TrojanGo" 
echo -e   "   5\e[1;33m)\e[m V2ray Core Menu"  
echo -e   "   6\e[1;33m)\e[m Xray  Core Menu"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "                             SYSTEM MENU\e[m"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "    7\e[1;33m)\e[m  Add Subdomain Host For VPS" 
echo -e   "    8\e[1;33m)\e[m  Renew Certificate V2RAY" 
echo -e   "    9\e[1;33m)\e[m  Change Port All Account"
echo -e   "   10\e[1;33m)\e[m  Backup Data VPS" 
echo -e   "   11\e[1;33m)\e[m  Restore Data VPS" 
echo -e   "   12\e[1;33m)\e[m  Webmin Menu" 
echo -e   "   13\e[1;33m)\e[m  Limit Bandwith Speed Server" 
echo -e   "   14\e[1;33m)\e[m  Check Usage of VPS Ram"  
echo -e   "   15\e[1;33m)\e[m  Reboot VPS" 
echo -e   "   16\e[1;33m)\e[m  Speedtest VPS" 
echo -e   "   17\e[1;33m)\e[m  Information Display System" 
echo -e   "   18\e[1;33m)\e[m  Info Script Auto Install" 
echo -e   "   19\e[1;33m)\e[m  Install BBR" 
echo -e   "   20\e[1;33m)\e[m  Add ID Cloudflare"
echo -e   "   21\e[1;33m)\e[m  Cloudflare Add-Ons" 
echo -e   "   22\e[1;33m)\e[m  Pointing BUG" 
echo -e   "   23\e[1;33m)\e[m  Clear log" 
echo -e   "   24\e[1;33m)\e[m  Auto Reboot" 
echo -e   "   25\e[1;33m)\e[m  Check Service Running"
echo -e   "   26\e[1;33m)\e[m  Update Lates Script"
echo -e   "   27\e[1;33m)\e[m  Pointing VPS"
echo -e   "   28\e[1;33m)\e[m  Cek Bandwidth VPS"
echo -e   "   29\e[1;33m)\e[m  Wildcard"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   ""
read -p "     Select From Options [1-29 or x] :  " menu
echo -e   ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-trgo
;;
5)
menu-v2ray
;;
6)
menu-xray
;;
7)
addhost
;;
8)
cert
;;
9)
changeport
;;
10)
backup
;;
11)
restore
;;
12)
wbmn
;;
13)
limitspeed
;;
14)
T
;;
15)
reboot
;;
16)
speedtest
;;
17)
ram
;;
18)
reboot
;;
19)
bbr
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
23)
cff
;;
24)
cfd
;;
25)
cfh
;;
26)
clear-log
;;
27)
autoreboot
;;
28)
sudo running
;;
29)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac

# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/rare/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear 
echo -e "\e[33m                                                            \e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "         • Since 13 August 2019 , I LOVE YOU •       "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m     ___ ___ ___ _____    ___   _   _  _ "
echo -e "\e[92m    | _ \_ _|   \_  / |  |_ _| /_\ | \| |"
echo -e "\e[92m    |   /| || |) / /| |__ | | / _ \|    |"
echo -e "\e[92m    |_|_\___|___/___|____|___/_/ \_\_|\_|"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                                                                                         "
echo -e "\e[33m CPU Model            \e[0m: $cname"
echo -e "\e[33m CPU Frequency        \e[0m: $freq MHz"
echo -e "\e[33m Number Of Cores      \e[0m:  $cores"
echo -e "\e[33m CPU Usage            \e[0m:  $cpu_usage"
echo -e "\e[33m Operating System     \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[33m Kernel               \e[0m:  `uname -r`"
echo -e "\e[33m Total Amount Of RAM  \e[0m:  $tram MB"
echo -e "\e[33m Used RAM             \e[0m: $red $uram\e[0m MB"
echo -e "\e[33m Free RAM             \e[0m:  $fram MB"
echo -e "\e[33m System Uptime        \e[0m:  $uptime "
echo -e "\e[33m Isp Name             \e[0m:  $ISP"
echo -e "\e[33m Domain               \e[0m:  $domain"	
echo -e "\e[33m Ip Vps               \e[0m:  $IPVPS"	
echo -e "\e[33m City                 \e[0m:  $CITY"
echo -e "\e[33m Time                 \e[0m:  $WKT"
echo -e "\e[33m Day                  \e[0m:  $DAY"
echo -e "\e[33m Date                 \e[0m:  $DATE"
echo -e "\e[33m Telegram             \e[0m:  $tele"
echo -e "\e[33m Script Version       \e[0m:  $Sver"
echo -e "\e[33m Certificate status   \e[0m:  \e[33mExpired in ${tlsStatus} days\e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m Traffic\e[0m       \e[33mToday      Yesterday     Month   "
echo -e "\e[33m Download\e[0m      $dtoday    $dyest       $dmon   \e[0m"
echo -e "\e[33m Upload\e[0m        $utoday    $uyest       $umon   \e[0m"
echo -e "\e[33m Total\e[0m       \033[0;36m  $ttoday    $tyest       $tmon  \e[0m "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                 • SCRIPT MENU, SAYANG BAU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•1\e[0m] SSH & OpenVPN Menu  [\e[36m•7\e[0m] SYSTEM Menu"
echo -e " [\e[36m•2\e[0m] Wireguard Menu      [\e[36m•8\e[0m] Status Service"
echo -e " [\e[36m•3\e[0m] SSR & SS Menu       [\e[36m•9\e[0m] VPS Information"
echo -e " [\e[36m•4\e[0m] V2RAY Menu           [\e[36m10\e[0m] Script Info"
echo -e " [\e[36m•5\e[0m] XRAY Menu          [\e[36m11\e[0m] Clear RAM Cache"
echo -e " [\e[36m•6\e[0m] Trojan GO Menu     [\e[31m12\e[0m] \e[31mREBOOT\033[0m"
echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[33mClient Name    \E[0m: $Name"
echo -e " \e[33mScript Expired \E[0m: $Exp2"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""
read -p " Select menu :  "  menu
echo -e   ""
case $menu in
1) clear ; menu-ssh ;;
2) clear ; menu-wg ;;
3) clear ; menu-ssr ;;
4) clear ; menu-trgo ;;
5) clear ; menu-v2ray ;;
6) clear ; menu-xray ;;
7) clear ; m-trojan ;;
8) clear ; system-menu ;;
9) clear ; running ;;
10) clear ; vpsinfo ;;
11) clear ; info-menu ;;
12) clear ; clearcache ;;
13) clear ; reboot ;;
x) exit ;;
esac

