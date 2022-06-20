#!/bin/bash
wget http://www.datsi.fi.upm.es/~frosal/sources/shc-3.8.7.tgz
tar xvfz shc-3.8.7.tgz
cd shc-3.8.7
make


#Masuk Direktori
cd 
cd /usr/bin/

#Encrypt 

#Xray
shc -r -f addxtrojan
shc -r -f addxvless
shc -r -f addxvmess
shc -r -f addxtls
shc -r -f addgrpc
shc -r -f addtrxtls
shc -r -f addtrgrpc
shc -r -f delxtrojan
shc -r -f delxvless
shc -r -f delxvmess
shc -r -f delxtls
shc -r -f delgrpc
shc -r -f deltrxtls
shc -r -f deltrgrpc
shc -r -f cekxtrojan
shc -r -f cekxvless
shc -r -f cekxvmess
shc -r -f cekxtls
shc -r -f cekgrpc
shc -r -f cektrxtls
shc -r -f cektrgrpc
shc -r -f renewxtrojan
shc -r -f renewxvless
shc -r -f renewxvmess
shc -r -f renewxtls
shc -r -f renewgrpc
shc -r -f renewtrxtls
shc -r -f renewtrgrpc
shc -r -f trialxtrojan
shc -r -f trialxvless
shc -r -f trialxvmess
shc -r -f trialxtls
shc -r -f trialgrpc
shc -r -f trialtrxtls
shc -r -f trialtrgrpc

#v2ray
shc -r -f addvmess
shc -r -f addvless
shc -r -f addtrojan
shc -r -f delvmess
shc -r -f delvless
shc -r -f deltrojan
shc -r -f cekvmess
shc -r -f cekvless
shc -r -f cektrojan
shc -r -f renewvmess
shc -r -f renewvless
shc -r -f renewtrojan
shc -r -f trialvmess
shc -r -f trialvless
shc -r -f trialtrojan

#backup
shc -r -f autobackup
shc -r -f backup
shc -r -f autokill
shc -r -f restore
shc -r -f strt
shc -r -f limitspeed

#ssh-vpn
shc -r -f addhost
shc -r -f menu
shc -r -f addssh
shc -r -f trialssh
shc -r -f delssh
shc -r -f member
shc -r -f delexp
shc -r -f cekssh
shc -r -f restart
shc -r -f renewssh
shc -r -f autokill
shc -r -f ceklim
shc -r -f clearlog
shc -r -f changeport
shc -r -f wbmn
shc -r -f xp
shc -r -f certv2ray
shc -r -f bbr
shc -r -f auto-reboot
shc -r -f clearcache
shc -r -f kernel-updt

shc -r -f izin
shc -r -f ceklim
shc -r -f sstpp
shc -r -f ssh
shc -r -f trojaan
shc -r -f v2raay
shc -r -f wgr
shc -r -f l2tp
shc -r -f member
shc -r -f reboot
shc -r -f renewl2tp
shc -r -f renewpptp
shc -r -f renewss
shc -r -f renewssh
shc -r -f renewssr
shc -r -f ssssr
shc -r -f renewsstp
shc -r -f renewtrojan
shc -r -f renewvless
shc -r -f renewwg
shc -r -f renewvmess
shc -r -f restart

shc -r -f strt
shc -r -f menu
shc -r -f swapkvm
shc -r -f addtrgo
shc -r -f tendang
shc -r -f trialssh
shc -r -f xp

#rm
mv member.x member
mv reboot.x reboot
mv renewl2tp.x renewl2tp
mv renewpptp.x renewpptp
mv renewss.x renewss
mv renewssh.x renewssh
mv renewssr.x renewssr
mv renewsstp.x renewsstp
mv renewtrojan.x renewtrojan
mv renewtrgo.x renewtrgo
mv renewvless.x renewvless
mv renewwgr.x renewwgr
mv menu.x menu
mv renewvmess.x renewvmess
mv restart.x restart
mv restore.x restore
#Remove Extension
rm -r -f *.x.c
clear
echo -e "Installation Script Susuccessful..." | lolcat 
rm -r -f encrypt
cd

rm -rf shc-4.0.2
rm -rf 4.0.2.tar.gz
rm -rf master.zip
rm -rf encrypt.sh
