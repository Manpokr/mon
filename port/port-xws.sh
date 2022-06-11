#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"

clear
tls=$(cat /etc/xray/vmesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/xray/vmessnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
mkcp=$(cat /etc/xray/mkcp.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
echo -e "======================================"
echo -e "      Change Port XRAY Vmess"
echo -e ""
echo -e "     [1]  Change Port XRAY Vmess TCP ${RED}$tls${NC}"
echo -e "     [2]  Change Port XRAY Vmess None TCP ${RED}$none${NC}"
echo -e "     [3]  Change Port XRAY Vmess KCP ${RED}$mkcp${NC}"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "  silahkan masukkan nomor [1-3 or x] :  "  prot                                                                                                                                                                                                 
echo -e ""
case $prot in
1)
read -p "New Port XRAY Vmess TCP: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/vmesstls.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xr-vm-tls > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Xray Vmess $tls1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $tls1 Is Already Used"                                                                                                                                                          
fi
;;
2)
echo "Input Only 2 Character (eg : 69)"
read -p "New Port XRAY Vmess None TCP: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/vmessnone.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xr-vm-ntls > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Xray Vmess $none1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $none1 Is Already Used"                                                                                                                                                          
fi
;;
3)
read -p "New Port XRAY Vmess KCP: " mkcp1
if [ -z $mkcp1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $mkcp1)
if [[ -z $cek ]]; then
sed -i "s/$mkcp/$mkcp1/g" /etc/xray/mkcp.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $mkcp -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $mkcp -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $mkcp1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $mkcp1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xr-vm-mk.service > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Port Xray Vmess $mkcp1${NC}"                                                                                                                                             
else                                                                                                                                                                                                            
echo -e "${RED}Error ! ${NC}Port $mkcp1 Is Already Used"                                                                                                                                                          
fi
;;
x)
exit
;;
*)
echo "Boh salah tekan"
port-xws
;;
esac
