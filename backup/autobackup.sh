#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/manternet/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f set-br.sh
exit 0
fi
clear

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Please enter your email"
read -rp "Email: " -e email
cat <<EOF>>/home/email
$email
EOF
fi
cat << EOF >> /etc/crontab
# BEGIN_Backup
5 0 * * * root bckp
# END_Backup
EOF
service cron restart
sleep 1
echo " Please Wait"
clear
echo " Autobackup Has Been Started"
echo " Data Will Be Backed Up Automatically at 00:05 GMT +7"
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Backup/,/^# END_Backup/d" /etc/crontab
service cron restart
sleep 1
echo " Please Wait"
clear
echo " Autobackup Has Been Stopped"
exit 0
}
function gantipenerima() {
rm -rf /home/email
echo "Please enter your email"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
}
function gantipengirim() {
echo "Please enter your email"
read -rp "Email : " -e email
echo "Please enter your Password email"
read -rp "Password : " -e pwdd
rm -rf /etc/msmtprc
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user $email
from $email
password $pwdd
logfile ~/.msmtp.log
EOF
}
function testemail() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
start
fi
email=$(cat /home/email)
echo -e "
Ini adalah isi email percobaaan hantar email dari vps
IP VPS  : $IP
Tanggal : $date
" | mail -s "Percobaan Menghantar Email" $email
}
sleep 1
clear
echo -e " =============================="
echo -e "      Autobackup Data $sts     "
echo -e " =============================="
echo -e "  [•1] Start Autobackup"
echo -e "  [•2] Stop Autobackup"
echo -e "  [•3] Tukar Email Penerima"
echo -e "  [•4] Tukar Email Pengirim"
echo -e "  [•5] Test Hantar Email"
echo -e ""
echo -e " Press CTRL+C to exit"
echo -e ""
echo -e " =============================="
read -rp " Please Enter The Correct Number : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
elif [[ "$num" = "3" ]]; then
gantipenerima
elif [[ "$num" = "4" ]]; then
gantipengirim
elif [[ "$num" = "5" ]]; then
testemail
else
clear
echo " Boh Salah Number"
backup
fi
