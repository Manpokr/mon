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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
domain=$(cat /etc/xray/domain)
IP=$( curl -s ipinfo.io/ip)

# Getting
BURIQ () {
    curl -sS https://raw.githubusercontent.com/Manpokr/mon/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Manpokr/mon/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Manpokr/mon/main/ip | awk '{print $4}' | grep $MYIP )
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted !"
else
red "Permission Denied !"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
clear
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "
echo -e "${res}"
sleep 2

clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi


echo ""
echo -e "[ ${green}INFO${NC} ] Current domain"
mkdir /var/lib/Manpokr;
echo "IP=" >> /var/lib/Manpokr/ipvps.conf
echo "IP=$( curl -s ipinfo.io/ip)" >> /var/lib/Manpokr/ipvps.conf
wget https://raw.githubusercontent.com/Manpokr/mon/main/addon/cf.sh && chmod +x cf.sh && ./cf.sh

#SSH & OPenVPN
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh

#ShadowsocksR
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh

#Shadowsocks
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh

#Wireguards
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/wg.sh && chmod +x wg.sh  && screen -S wg ./wg.sh

#XRay
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh

#V2Ray
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ins-vt.sh && chmod +x ins-vt.sh && screen -S vt ./ins-vt.sh

#Backup
wget https://raw.githubusercontent.com/Manpokr/mon/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# Websocket
wget https://raw.githubusercontent.com/Manpokr/mon/main/websocket/ws.sh && chmod +x ws.sh && ./ws.sh 

#OHP 
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ohp.sh && chmod +x ohp.sh && ./ohp.sh

#Cert
apt install socat -y
wget https://raw.githubusercontent.com/Manpokr/mon/main/addon/cert.sh && chmod +x cert.sh && ./cert.sh

#Warna
sleep 1
echo -e "[ ${green}INFO${NC} ] Downloading extension !!"
sleep 1
apt install lolcat -y
apt install toilet - y

cd /usr/bin
wget -O portovpn "https://raw.githubusercontent.com/Manpokr/mon/main/port/portovpn.sh"
wget -O portsquid "https://raw.githubusercontent.com/Manpokr/mon/main/port/portsquid.sh"
wget -O portwg "https://raw.githubusercontent.com/Manpokr/mon/main/port/portwg.sh"
wget -O portvlm "https://raw.githubusercontent.com/Manpokr/mon/main/port/portvlm.sh"
wget -O porttrojan "https://raw.githubusercontent.com/Manpokr/mon/main/port/porttrojan.sh"
#wget -O port-trojango "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trojango.sh"
wget -O port-xws "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xws.sh"
wget -O port-xvl "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xvl.sh"
wget -O port-xtr "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xtr.sh"
wget -O port-xtls "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-xtls.sh"
wget -O port-vmess "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-vmess.sh"
wget -O port-vless "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-vless.sh"
wget -O port-trojan "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trojan.sh"
wget -O port-grpc "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-grpc.sh"
wget -O port-trxtls "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trxtls.sh"
wget -O port-trgrpc "https://raw.githubusercontent.com/Manpokr/mon/main/port/port-trgrpc.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-ssh.sh"
wget -O menu-wg "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-wg.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-ssr.sh"
wget -O menu-xray "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-xray.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-v2ray.sh"
wget -O system-menu "https://raw.githubusercontent.com/Manpokr/mon/main/setup/system-menu.sh"
wget -O trial-menu "https://raw.githubusercontent.com/Manpokr/mon/main/menu/trial-menu.sh"
#wget -O menu-bbt "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-bbt.sh"
wget -O running "https://raw.githubusercontent.com/Manpokr/mon/main/menu/running.sh"
wget -O menu-bw "https://raw.githubusercontent.com/Manpokr/mon/main/menu/menu-bw"
wget -O backup-info "https://raw.githubusercontent.com/Manpokr/mon/main/backup/backup-info"
chmod +x portovpn
chmod +x portsquid
chmod +x portwg
chmod +x portvlm
chmod +x porttrojan
chmod +x port-xws
chmod +x port-xvl
chmod +x port-xtr
chmod +x port-xtls
chmod +x port-vmess
chmod +x port-vless
chmod +x port-trojan
chmod +x port-grpc
chmod +x port-trxtls
chmod +x port-trgrpc
chmod +x trial-menu
chmod +x menu-ssh
chmod +x menu-wg
chmod +x menu-ssr
chmod +x menu-xray
chmod +x menu-v2ray
#chmod +x menu-bbt
chmod +x system-menu
chmod +x running
chmod +x menu-bw
chmod +x backup-info

cd
rm -f /root/sodosok.sh
rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /etc/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
rm -f /root/ws.sh
rm -f /root/ins-vt.sh
rm -f /root/cf.sh
rm -rf /root/ipvps
rm -f /etc/ip
rm -f /root/tmp
clear
echo "Beta 2.0" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"    | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel4                : 441, 777, 789"   | tee -a log-install.txt
echo "   - Dropbear                : 441, 109"   | tee -a log-install.txt
echo "   - Privoxy                 : 3000"       | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080" | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300-7900"  | tee -a log-install.txt
echo "   - TROJAN-GO               : 2096"  | tee -a log-install.txt
echo "   - WIREGUARD               : 7070" | tee -a log-install.txt
echo "   - SHADOWSOCKS-R           : 1443"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 8488"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 8388"  | tee -a log-install.txt
echo " -------------------V2RAY--------------------------"
echo "   - Vmess TLS               : 342"  | tee -a log-install.txt
echo "   - Vmess None TLS          : 982"  | tee -a log-install.txt
echo "   - Vless TLS               : 2083"   | tee -a log-install.txt
echo "   - Vless None TLS          : 8889"    | tee -a log-install.txt
echo "   - trojan                  : 2087"   | tee -a log-install.txt
echo " --------------------XRAY--------------------------"
echo "   - Vmess TLS               : 6363"  | tee -a log-install.txt
echo "   - Vmess None TLS          : 6464"  | tee -a log-install.txt
echo "   - Vless TLS               : 6565"   | tee -a log-install.txt
echo "   - Vless None TLS          : 6666"    | tee -a log-install.txt
echo "   - Vless xtls              : 756"   | tee -a log-install.txt
echo "   - Vless mKCP              : 6161"   | tee -a log-install.txt
echo "   - trojan                  : 2089"   | tee -a log-install.txt
echo "   - Vmess gRPC              : 80"   | tee -a log-.txt
echo "   - Vless gRPC              : 880"   | tee -a log-install.txt
echo "   - Trojan gRPC             : 2099"   | tee -a log-install.txt
echo "   - Trojan XTLS             : 2088"   | tee -a log-install.txt
echo " ---------------------------------------------------"
echo "   - Websocket TLS           : 777"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Nginx                   : 89"    | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_lumpur (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 12.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : "  | tee -a log-install.txt
echo "   - Recode                  : Manternet" | tee -a log-install.txt
echo "   - Telegram                : T.me/Manternet"  | tee -a log-install.txt
echo " Reboot 7 Sec"
sleep 7
clear
echo -e "[ ${green}INFO${NC} ] Installing Successfully!!"
sleep 1
rm -f setup.sh
rm -f ins-xray.sh
screen -S
reboot
