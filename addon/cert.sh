#!/bin/bash
#cert
domain=$(cat /root/domain)
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
cd .acme.sh
sudo bash acme.sh --register-account -m manpokr7@gmail.com
sudo bash acme.sh --issue --standalone -d $domain  --force
sudo bash acme.sh --installcert -d $domain --fullchainpath
sudo bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
rm -f /root/cert.sh
