#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

###########
IP=$(wget -qO- ipinfo.io/ip);
hariini=`date +%d-%m-%Y`

apt install msmtp-mta ca-certificates bsd-mailx -y
cat > /etc/msmtprc << EOF
defaults
port 587
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
logfile        ~/.msmtp.log
# akun smpt
account        smtptest
host           smtp.gmail.com
port           587
from           smtptest - VPS Services
user           smtp5313@gmail.com
password       wgrbymeckwjjnpht
account default : smtptest
EOF

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Manpokr/mon/main/ip | grep $MYIP | awk '{print $2}')
echo "
━━━━━━━━━━━━━━━━━━━━━
Client Installation Data
━━━━━━━━━━━━━━━━━━━━━
Username : $Name
IP       : $MYIP
━━━━━━━━━━━━━━━━━━━━━" | mail -s "Client Installation Data" smtp5313@gmail.com 


#Backup
wget https://raw.githubusercontent.com/Manpokr/mon/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
