#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);

IP=$(wget -qO- icanhazip.com);

clear
echo " Enter Your Email To Receive Message"
read -rp " Email: " -e email
sleep 1
echo Creating Directory...
mkdir /root/backup
sleep 1
echo Starting Backup Procces...
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/manpokr/ backup/manpokr
cp -r /etc/v2ray backup/v2ray
cp -r /etc/xray backup/xray
cp -r /etc/trojan backup/trojan
cp /etc/crontab backup/crontab
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip smtp:backup/
url=$(rclone link smtp:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
isp=$(curl -s ipinfo.io/org)
hostname=$(hostname)
clear
echo -e "
Detail Backup
==================================
Hostname      = $hostname
IP VPS        = $IP
ISP           = $isp
Tanggal       = $date
Link Backup   = $link
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
Detail Backup 
==================================
Hostname      = $hostname
IP VPS        = $IP
ISP           = $isp
Tanggal       = $date
Link Backup   = $link
==================================
"
echo "Please Check Your Email Inbox / Spam To Check Your Email"
