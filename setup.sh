#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# My Telegram : https://t.me/kdevn9
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
mkdir /var/lib/kdevn9;
echo "IP=" >> /var/lib/kdevn9/ipvps.conf
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
account        KyzoProject
host           smtp.gmail.com
port           587
from           KDevN9 - VPS Services
user           kyzoproject@gmail.com
password       oayepaczarvqqyoo
account default : KyzoProject
EOF

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(cat /etc/ip | grep $MYIP | awk '{print $2}')
echo "
━━━━━━━━━━━━━━━━━━━━━
Client Installation Data
━━━━━━━━━━━━━━━━━━━━━
Username : $Name
IP       : $MYIP
━━━━━━━━━━━━━━━━━━━━━" | mail -s "Client Installation Data" kdevn9@gmail.com 

#Domain
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/addon/cf.sh
chmod +x cf.sh
./cf.sh

#SSH & OPenVPN
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ssh-vpn.sh
chmod +x ssh-vpn.sh 
screen -S ssh-vpn ./ssh-vpn.sh

#SSTP
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/sstp.sh
chmod +x sstp.sh
screen -S sstp ./sstp.sh

#ShadowsocksR
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ssr.sh
chmod +x ssr.sh
screen -S ssr ./ssr.sh

#Shadowsocks
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/sodosok.sh
chmod +x sodosok.sh
screen -S ss ./sodosok.sh

#Wireguards
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/wg.sh
chmod +x wg.sh 
screen -S wg ./wg.sh

#XRay
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ins-xray.sh
chmod +x ins-xray.sh
screen -S xray ./ins-xray.sh

#V2Ray
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ins-vt.sh
chmod +x ins-vt.sh
screen -S vt ./ins-vt.sh

#L2TP
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ipsec.sh
chmod +x ipsec.sh
screen -S ipsec ./ipsec.sh

#Backup
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/backup/set-br.sh
chmod +x set-br.sh 
./set-br.sh

# Websocket
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/websocket/ws.sh
chmod +x ws.sh
./ws.sh 

#OHP 
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/setup/ohp.sh
chmod +x ohp.sh
./ohp.sh

#Cert
apt install socat -y
wget https://raw.githubusercontent.com/castleUI/NewSCv2/main/addon/cert.sh
chmod +x cert.sh
./cert.sh


#Addon
cd /usr/bin
wget -O port-xws "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-xws.sh"
wget -O port-xvl "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-xvl.sh"
wget -O port-xtr "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-xtr.sh"
wget -O port-xtls "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-xtls.sh"
wget -O port-vmess "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-vmess.sh"
wget -O port-vless "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-vless.sh"
wget -O port-trojan "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-trojan.sh"
wget -O cekxtls "https://raw.githubusercontent.com/castleUI/NewSCv2/main/cek/cekxray.sh"
wget -O port-grpc "https://raw.githubusercontent.com/castleUI/NewSCv2/main/port/port-grpc.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-ssh.sh"
wget -O menu-accel "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-accel.sh"
wget -O menu-wg "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-wg.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-ssr.sh"
wget -O menu-xray "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-xray.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/menu-v2ray.sh"
wget -O system-menu "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/system-menu.sh"
wget -O trial-menu "https://raw.githubusercontent.com/castleUI/NewSCv2/main/menu/trial-menu.sh"
wget -O trialgrpc "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialgrpc.sh"
wget -O triall2tp "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialgrpc.sh"
wget -O trialpptp  "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialpptp.sh"
wget -O trialsstp "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialsstp.sh"
wget -O trialss "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialss.sh"
wget -O trialssr "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialssr.sh"
wget -O trialtrojan "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialtrojan.sh"
wget -O trialvless "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialvless.sh"
wget -O trialvmess "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialvmess.sh"
wget -O trialxtrojan "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialxtrojan.sh"
wget -O trialxvless "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialxvless.sh"
wget -O trialxvmess "https://raw.githubusercontent.com/castleUI/NewSCv2/main/trial/trialxvmess.sh"
chmod +x trialgrpc
chmod +x trial-menu
chmod +x triall2tp
chmod +x trialpptp
chmod +x trialsstp
chmod +x trialss 
chmod +x trialssr
chmod +x trialtrojan
chmod +x trialvless
chmod +x trialvmess
chmod +x trialxtrojan
chmod +x trialxvless
chmod +x trialxvmess
chmod +x menu-ssh
chmod +x menu-accel
chmod +x menu-wg
chmod +x menu-ssr
chmod +x menu-xray
chmod +x menu-v2ray
chmod +x menu-bbt
chmod +x system-menu
chmod +x port-xws
chmod +x port-xvl
chmod +x port-xtr
chmod +x port-xtls
chmod +x port-vmess
chmod +x port-vless
chmod +x port-trojan
chmod +x cekxtls
chmod +x port-grpc
cd
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ins-vt.sh
rm -f /root/ins-trgo.sh
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
