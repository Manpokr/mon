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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)
clear
MYIP=$(wget -qO- ipinfo.io/ip);
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo -e "======================================"
echo -e "         OpenVpn Port Changer"
echo -e ""
echo -e "   [1] Change Port TCP ${RED}$ovpn${NC}"
echo -e "   [2] Change Port UDP ${RED}$ovpn2${NC}"
echo -e "   [x] Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "  silahkan masukkan nomor [1-2 or x] :  "  prot
echo -e ""
case $prot in
1)
read -p "New Port OpenVPN : " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-tcp.conf
rm -f /etc/openvpn/tcp.ovpn
rm -f /home/vps/public_html/tcp.ovpn
cat > /etc/openvpn/server/server-tcp.conf<<END
port $vpn
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-tcp.log
verb 3
END
cat > /etc/openvpn/tcp.ovpn <<-END
client
dev tun
proto tcp
remote $MYIP $vpn
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/tcp.ovpn
echo '</ca>' >> /etc/openvpn/tcp.ovpn
cp /etc/openvpn/tcp.ovpn /home/vps/public_html/tcp.ovpn
systemctl disable --now openvpn-server@server-tcp > /dev/null
systemctl enable --now openvpn-server@server-tcp > /dev/null
sed -i "s/$ovpn/$vpn/g" /etc/stunnel/stunnel.conf
clear
echo -e "${GREEN}Succesfully Changed OpenVpn Port To $vpn${NC}"
else
echo -e "${RED}Error ! ${NC}Port $vpn Is Already Used"
fi
;;
2)
read -p "New Port OpenVPN: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-udp.conf
rm -f /etc/openvpn/udp.ovpn
rm -f /home/vps/public_html/udp.ovpn
cat > /etc/openvpn/server/server-udp.conf<<END
port $vpn
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-udp.log
verb 3
explicit-exit-notify
END
cat > /etc/openvpn/udp.ovpn <<-END
client
dev tun
proto udp
remote $MYIP $vpn
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/udp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/udp.ovpn
echo '</ca>' >> /etc/openvpn/udp.ovpn
cp /etc/openvpn/udp.ovpn /home/vps/public_html/udp.ovpn
systemctl disable --now openvpn-server@server-udp > /dev/null
systemctl enable --now openvpn-server@server-udp > /dev/null
echo -e "${GREEN}Succesfully Changed OpenVpn Port To $vpn${NC}"
else
echo -e "${RED}Error ! ${NC}Port $vpn Is Already Used"
fi
;;
x)
exit
;;
*)
echo "Boh salah tekan"
portovpn
;;
esac

