#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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

#Folder
mkdir /var/lib/Manpokr;
echo "IP=" >> /var/lib/Manpokr/ipvps.conf
clear
apt install msmtp-mta ca-certificates bsd-mailx -y
cat > /etc/msmtprc << EOF
defaults
port 587
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
logfile        ~/.msmtp.log

# akun smpt
account        manternetProject
host           manternet.xyz
port           587
from           Manternet - VPS Services
user           man××××@gmail.com
password       123456
account default : manternet
EOF

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(cat /etc/ip | grep $MYIP | awk '{print $2}')
echo "
━━━━━━━━━━━━━━━━━━━━━
Client Installation Data
━━━━━━━━━━━━━━━━━━━━━
Username : $Name
IP       : $MYIP
━━━━━━━━━━━━━━━━━━━━━" | mail -s "Client Installation Data" manpokr7@gmail.com 

#Warna
apt install lolcat -y
apt install toilet - y

#Domain
wget https://raw.githubusercontent.com/Manpokr/mon/main/addon/cf.sh
chmod +x cf.sh
./cf.sh

#SSH & OPenVPN
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ssh-vpn.sh
chmod +x ssh-vpn.sh 
screen -S ssh-vpn ./ssh-vpn.sh

#ShadowsocksR
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ssr.sh
chmod +x ssr.sh
screen -S ssr ./ssr.sh

#Shadowsocks
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/sodosok.sh
chmod +x sodosok.sh
screen -S ss ./sodosok.sh

#Wireguards
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/wg.sh
chmod +x wg.sh 
screen -S wg ./wg.sh

#XRay
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ins-xray.sh
chmod +x ins-xray.sh
screen -S xray ./ins-xray.sh

#V2Ray
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ins-vt.sh
chmod +x ins-vt.sh
screen -S vt ./ins-vt.sh

#trojango
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/trojan-go.sh
chmod +x trojan-go.sh
./trojan-go.sh

#Backup
wget https://raw.githubusercontent.com/Manpokr/mon/main/backup/set-br.sh
chmod +x set-br.sh 
./set-br.sh

# Websocket
wget https://raw.githubusercontent.com/Manpokr/mon/main/websocket/ws.sh
chmod +x ws.sh
./ws.sh 

#OHP 
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ohp.sh
chmod +x ohp.sh
./ohp.sh

#Cert
apt install socat -y
wget https://raw.githubusercontent.com/Manpokr/mon/main/addon/cert.sh
chmod +x cert.sh
./cert.sh


#Addon
cd /usr/bin
wget -O portovpn "https://raw.githubusercontent.com/Manpokr/mon/main/port/portovpn.sh"
wget -O portsquid "https://raw.githubusercontent.com/Manpokr/mon/main/port/portsquid.sh"
wget -O portwg "https://raw.githubusercontent.com/Manpokr/mon/main/port/portwg.sh"
wget -O portvlm "https://raw.githubusercontent.com/Manpokr/mon/main/port/portvlm.sh"
wget -O porttrojan "https://raw.githubusercontent.com/Manpokr/mon/main/port/porttrojan.sh"
wget -O port-trojango "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trojango.sh"
wget -O port-xws "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xws.sh"
wget -O port-xvl "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xvl.sh"
wget -O port-xtr "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xtr.sh"
wget -O port-xtls "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xtls.sh"
wget -O port-vmess "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-vmess.sh"
wget -O port-vless "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-vless.sh"
wget -O port-trojan "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trojan.sh"
wget -O port-grpc "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-grpc.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-ssh.sh"
wget -O menu-wg "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-wg.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-ssr.sh"
wget -O menu-xray "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-xray.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-v2ray.sh"
wget -O system-menu "https://raw.githubusercontent.com/Manpokr/mon/main/menu/system-menu.sh"
wget -O trial-menu "https://raw.githubusercontent.com/Manpokr/mon/main/menu/trial-menu.sh"
wget -O menu-bbt "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-bbt.sh"
wget -O running "https://raw.githubusercontent.com/Manpokr/mon/main/menu/running.sh"
chmod +x portovpn
chmod +x portsquid
chmod +x portwg
chmod +x portvlm
chmod +x porttrojan
chmod +x port-trojango
chmod +x port-xws
chmod +x port-xvl
chmod +x port-xtr
chmod +x port-xtls
chmod +x port-vmess
chmod +x port-vless
chmod +x port-trojan
chmod +x port-grpc
chmod +x trial-menu
chmod +x menu-ssh
chmod +x menu-wg
chmod +x menu-ssr
chmod +x menu-xray
chmod +x menu-v2ray
chmod +x menu-bbt
chmod +x system-menu
chmod +x running
cd
rm -f /root/sodosok.sh
rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /etc/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
rm -f /root/ws.sh
rm -f /root/cf.sh
rm -rf /root/ipvps
rm -f /etc/ip
rm -f /root/tmp
echo "3" > /home/ver
clear
rm -f setup.sh
clear
echo "<<<<<<<<Script is finish install >>>>>>>>"
echo "<<<<<<<<Script is finish install >>>>>>>>"
echo "<<<<<<<<Script is finish install >>>>>>>>"
sleep 3
reboot
