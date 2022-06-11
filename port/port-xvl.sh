#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"

clear
tls="$(cat /etc/xray/vlesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
none="$(cat /etc/xray/vlessnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
echo -e "======================================"
echo -e "     Change Port XRAY Vless"
echo -e ""
echo -e "     [1]  Change Port XRAY VLESS TCP ${RED}$tls${NC}"
echo -e "     [2]  Change Port XRAY VLESS None TCP ${RED}$none${NC}"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "  silahkan masukkan nomor [1-2 or x] :  "  prot                                                                                                                                                                                                 
echo -e ""
case $prot in
1)
read -p "New Port XRAY Vless TCP: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/vlesstls.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@vlesstls > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Xray Vless $tls1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $tls1 Is Already Used"                                                                                                                                                          
fi
;;
2)
read -p "New Port XRAY VLESS None TCP: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/vlessnone.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@vlessnone > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Xray Vless $none1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $none1 Is Already Used"                                                                                                                                                          
fi
;;
x)
exit
;;
*)
echo "Boh salah tekan"
port-xvl
;;
esac
