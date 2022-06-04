#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f menu.sh
exit 0
fi
clear
#########################

#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
        else
        Exp2=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $2}')
# Color Validation
RED='\033[0;31m'                                                                                          
GREEN='\033[0;32m'                                                                                        
ORANGE='\033[0;33m'
BLUE='\033[0;34m'                                                                                         
PURPLE='\033[0;35m'
CYAN='\033[0;36m'                                                                                         
NC='\033[0;37m'
LIGHT='\033[0;37m'
yell='\e[33m'
red='\e[31m'
cyan='\e[36m'
bl='\e[36;1m'


# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
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
jam=$(date +"%T")                                                                                                                                                                                                                           
DAY=$(date +%A)                                                                                                                                                                                                                                                      
DATE=$(date +%m/%d/%Y)                                                                                                                                                                                                                                               
IPVPS=$(curl -s ipinfo.io/ip )                                                                                                                                                                                                                                       
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )                                                                                                                                                                                           
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )                                                                                                                                                                                            
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )                                                                                                                                                                                              
tram=$( free -m | awk 'NR==2 {print $2}' )                                                                                                                                                                                                                           
uram=$( free -m | awk 'NR==2 {print $3}' )                                                                                                                                                                                                                           
fram=$( free -m | awk 'NR==2 {print $4}' )                                                                                                                                                                                                                           
verxray="$(/usr/bin/xray/xray -version | awk 'NR==1 {print $2}')"                                                                                                                                                                                                    
verv2ray="$(/usr/bin/v2ray/v2ray -version | awk 'NR==1 {print $2}')"   
#Bash
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion
name=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | grep $MYIP | awk '{print $3}')
                                                                                                                                                                       
clear                                                                                                                                                                                                                                                                
echo -e "                                                                                         "                                                                                                                                                                  
echo -e "\e[36;1m CPU Model            :\e[0m $cname"                                                                                                                                                                                                                  
echo -e "\e[36;1m CPU Frequency        :\e[0m $freq MHz"                                                                                                                                                                                                               
echo -e "\e[36;1m Number Of Cores      :\e[0m  $cores"                                                                                                                                                                                                                 
echo -e "\e[36;1m CPU Usage            :\e[0m  $cpu_usage"                                                                                                                                                                                                             
echo -e "\e[36;1m Operating System     :\e[0m  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`                                                                                                                                                              
echo -e "\e[36;1m Kernel               :\e[0m  `uname -r`"                                                                                                                                                                                                             
echo -e "\e[36;1m Total Amount Of RAM  :\e[0m  $tram MB"                                                                                                                                                                                                               
echo -e "\e[36;1m Used RAM             :\e[0m  ${RED}$uram${NC} MB"                                                                                                                                                                                                      
echo -e "\e[36;1m Free RAM             :\e[0m  $fram MB"                                                                                                                                                                                                               
echo -e "\e[36;1m System Uptime        :\e[0m  $uptime "                                                                                                                                                                                                               
echo -e "\e[36;1m Isp Name             :\e[0m  $ISP"                                                                                                                                                                                                                   
echo -e "\e[36;1m Domain               :\e[0m  $domain"                                                                                                                                                                                                                
echo -e "\e[36;1m Ip Vps               :\e[0m  $IPVPS"                                                                                                                                                                                                                 
echo -e "\e[36;1m City                 :\e[0m  $WKT"                                                                                                                                                                                                                  
echo -e "\e[36;1m Time                 :\e[0m  $jam"                                                                                                                                                                                                                   
echo -e "\e[36;1m Day                  :\e[0m  $DAY"                                                                                                                                                                                                                   
echo -e "\e[36;1m Date                 :\e[0m  $DATE"                                                                                                                                                                                                                  
echo -e "\e[36;1m Telegram             :\e[0m  https://t.me/Mantera99"                                                                                                                                                                                                 
echo -e "\e[36;1m Script Version       :\e[0m  Latest Versions"                                                                                                                                                                                                        
echo -e "\e[36;1m Bash Version         :\e[0m ${PURPLE}$versibash${NC}"                                                                                                                                                                                                 
echo -e "\e[36;1m Xray Version         :\e[0m  ${PURPLE}$verxray${NC}"                                                                                                                                                                                                 
echo -e "\e[36;1m V2ray Version        :\e[0m  ${PURPLE}$verv2ray${NC}"                                                                                                                                                                                                
echo -e "\e[36;1m Certificate status   :\e[0m  \e[33mExpired in ${tlsStatus} days\e[0m"                                                                                                                                                                                
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m Traffic\e[0m       \e[33mToday      Yesterday     Month   "                                                                                                                                                                                          
echo -e "\e[33m Download\e[0m      $dtoday    $dyest       $dmon   \e[0m"                                                                                                                                                                                            
echo -e "\e[33m Upload\e[0m        $utoday    $uyest       $umon   \e[0m"                                                                                                                                                                                            
echo -e "\e[33m Total\e[0m       \033[0;36m  $ttoday    $tyest       $tmon  \e[0m "                                                                                                                                                                                  
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m               ⇱ SCRIPT MENU ⇲                    \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [${CYAN}•1${NC}] SSH & OpenVPN Menu  [${CYAN}•7${NC}] SYSTEM Menu"                                                                                                                                                                                         
echo -e " [${CYAN}•2${NC}] Wireguard Menu      [${CYAN}•8${NC}] Status Service"                                                                                                                                                                                      
echo -e " [${CYAN}•3${NC}] SSR & SS Menu       [${CYAN}•9${NC}] VPS Information"                                                                                                                                                                                     
echo -e " [${CYAN}•4${NC}] XRAY Menu           [${CYAN}10${NC}] Script Info"                                                                                                                                                                                         
echo -e " [${CYAN}•5${NC}] V2RAY Menu          [${CYAN}11${NC}] Clear RAM Cache"                                                                                                                                                                                     
echo -e " [${CYAN}•6${NC}] Trial Menu          [${RED}12${NC}] ${RED}REBOOT${NC}"                                                                                                                                                                                  
echo -e   ""                                                                                  
echo -e " [${CYAN}99${NC}] BOTT MENU"
echo -e   ""                                                                                                                                                                                                                                                         
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"                                                                                                                                                                                                                  
echo -e   ""  
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"                                                                                                                                                                                                                                                     
echo -e " Client Name    : $name"                                                                                                                                                                                                                        
echo -e " Script Expired : $exp"                                                                                                                                                                                                                        
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""                                                                                                                                                                                                                                                         
read -p " Select menu :  "  menu                                                                                                                                                                                                                                     
echo -e   ""                                                                                                                                                                                                                                                         
case $menu in                                                                                                                                                                                                                                                        
1) clear ; menu-ssh ;;                                                                                                                                                                                                                                               
2) clear ; menu-wg ;;                                                                                                                                                                                                                                                
3) clear ; menu-ssr ;;                                                                                                                                                                                                                                               
4) clear ; menu-xray ;;                                                                                                                                                                                                                                              
5) clear ; menu-v2ray ;;                                                                                                                                                                                                                                             
6) clear ; trial-menu ;;                                                                                                                                                                                                                                              
7) clear ; system-menu ;;                                                                                                                                                                                                                                            
8) clear ; running ;;                                                                                                                                                                                                                                                
9) clear ; info ;;                                                                                                                                                                                                                                                
10) clear ; about ;;                                                                                                                                                                                                                                             
11) clear ; clearcache ;;                                                                                                                                                                                                                                            
12) clear ; reboot ;; 
99) clear ; menu-bbt ;;                                                                                                                                                                                                                                       
x) exit ;;                                                                                                                                                                                                                                                           
esac
