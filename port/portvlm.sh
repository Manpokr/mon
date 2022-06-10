#!/bin/bash
# My Telegram : https://t.me/Manternet
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "    [1] Change Port Vmess TLS $tls"
echo -e "    [2] Change Port Vmess None TLS $none"
echo -e "    [x] Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "  silahkan masukkan nomor [1-2 or x] :  "  prot
echo -e ""
case $prot in
1)
read -p "New Port Vmess TLS : " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/config.json
sed -i "s/   - Xray Vmess TLS         : $tls/   - Xray Vmess TLS         : $tls1/g" /root/log-install.txt
sed -i "s/   - Xray Vless TLS         : $tls/   - Xray Vless TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
clear                                                                                                                                                                                                           
echo -e "${GREEN}Succesfully Changed Xray Vmess Tls Port $tls1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $tls1 Is Already Used"                                                                                                                                                          
fi
;;
2)
echo "Input Only 2 Character (eg : 69)"
read -p "New Port Vmess None TLS : " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/config.json
sed -i "s/   - Xray Vmess None TLS    : $none/   - Xray Vmess None TLS    : $none1/g" /root/log-install.txt
sed -i "s/   - Xray Vless None TLS    : $none/   - Xray Vless None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
clear                                                                                                                                                                                                           
echo -e "${GREEN}Succesfully Changed Xray Vmess ntls Port $none1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $none1 Is Already Used"                                                                                                                                                          
fi
;;
3)
exit
;;
*)
echo "Boh salah tekan"
portvlm
;;
esac

