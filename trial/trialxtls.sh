#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
# EDIT IZIN
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)
clear
source /var/lib/Manpokr/ipvps.conf
domain=$(cat /etc/xray/domain)

port=$(cat /etc/xray/xrayxtls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')
uuid=$(cat /proc/sys/kernel/random/uuid)
user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
exp=1
read -p "SNI (bug) : " sni
read -p "Subdomain (EXP : manternet.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'xtls-rprx-direct'","email": "'""$user""'"' /etc/xray/xrayxtls.json

IP=$( curl -s ipinfo.io/ip )
vd="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#$user"
vu="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct-udp443&sni=$sni#$user"
vs="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#$user"
vsu="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice-udp443&sni=$sni#$user"
systemctl restart xtls.service

clear
echo -e "================================="
echo -e "         XRAY VLESS XTLS        "
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Domain         : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "Sni/Bug        : ${sni}"
echo -e "port TCP       : $port"
echo -e "id             : ${uuid}"
echo -e "================================="
echo -e "Direct         : ${vd}"
echo -e "================================="
echo -e "Direct UDP     : ${vu}"
echo -e "================================="
echo -e "Splice         : ${vs}"
echo -e "================================="
echo -e "Splice         : ${vsu}"
echo -e "================================="
echo -e "Created        : $hariini"
echo -e "Expired On     : $exp"
echo -e "================================="
echo -e "ScriptMod By Manternet"
