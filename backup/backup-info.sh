#!/bin/bash
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

# MenuBackup
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
isp=$(curl -s ipinfo.io/org)
hostname=$(hostname)
url=$(rclone link smtp:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"

clear
echo -e "=================================="
echo -e "            BACKUP INFO           "
echo -e "=================================="
echo -e " Hostname      =" $hostname
echo -e " IP VPS        =" $IP
echo -e " ISP           =" $isp
echo -e " Tanggal       =" $date
echo -e " Link Backup   =" $link
echo -e ""
echo -e "=================================="
