#!/bin/bash                                                                                                                                              
wget https://raw.githubusercontent.com/Manpokr/mon/main/setup/ins-vt.sh                                                                              
chmod +x ins-vt.sh                                                                                                                                   
screen -S vt ./ins-vt.sh                                                                                                                             
                                                                                                                                                     
echo -e "reboot "                                                                                                                                    
echo "" | tee -a log-install.txt                                                                                                                     
echo "----------------------------------------------------------------------------" | tee -a log-install.txt                                         
echo ""  | tee -a log-install.txt                                                                                                                    
echo "   >>> Service & Port"  | tee -a log-install.txt                                                                                               
echo "   - OpenSSH                 : 22"    | tee -a log-install.txt                                                                                 
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt                                                          
echo "   - Stunnel4                : 789, 777, 789"   | tee -a log-install.txt                                                                       
echo "   - Dropbear                : 441, 109"   | tee -a log-install.txt                                                                            
echo "   - Privoxy                 : 3000"       | tee -a log-install.txt                                                                            
echo "   - Squid Proxy             : 3128, 8080" | tee -a log-install.txt                                                                            
echo "   - Badvpn                  : 7100, 7200, 7300-7900"  | tee -a log-install.txt                                                                
sleep 7                                                                                                                                              
reboott
