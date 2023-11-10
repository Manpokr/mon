#!/bin/bash
# (C) Copyright 2022-2023
# ==================================================================
# Name        : VPN Script Auto Installation Script
# Created     : ( 26 May 2023 )
# OS Support  : Ubuntu & Debian
# Auther      : Manternet
# ==================================================================

# // Export Color & Information
export RED='\033[0;31m';
export GREEN='\033[0;32m';
export YELLOW='\033[0;33m';
export BLUE='\033[0;34m';
export PURPLE='\033[0;35m';
export CYAN='\033[0;36m';
export LIGHT='\033[0;37m';
export GRAY='\033[0;38m';
export NC='\033[0m';
# // Export Banner Status Information
export ERROR="(${RED} ERROR ${NC})";
export INFO="(${CYAN} INFO ${NC})";
export OKEY="(${GREEN} OKEY ${NC})";
# // Github user
export URL_SETUP="https://"
export URL_PERMISION="https://"
# // Exporting maklumat rangkaian
source /root/ip-detail.txt;
export domain=$(cat /usr/local/domain);
export IP_NYA="$IP";

function install_xray() {
        if [[ ! -d "patch/xray" ]]; then
            clear; echo -e ""; echo -e "${ERROR} Directory is not detected !"; exit 0;
        fi
            echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
            echo -e "                  ${RED}•••${NC} [ ${BG}XRAY UPDATE VERSION${NC} ] ${RED}•••${NC}";
            echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
            echo -e "";
            curl -s "https://api.github.com/repos/XTLS/Xray-core/releases?per_page=5" | jq -r ".[]|select (.prerelease==false) |.tag_name" | awk '{print "(${CYAN}"NR"${NC})${RED}•${NC} ${LIGHT}Xray-core official"" = ${NC}"$0}'
            echo -e " (${CYAN}03${NC}) ${RED}•${NC} ${LIGHT}Xray-core Mods v1.0.0${NC}";
            echo -e "";
            echo -e " (${RED}00${NC}) ${RED}•${NC} ${LIGHT}Back to menu${NC}";
            echo -e "";
            echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
            echo -e -n " ${LIGHT}Select menu (${GREEN} 0 - 3 ${NC}${LIGHT})${NC} = "; read xraytype
            export version=$(curl -s "https://api.github.com/repos/XTLS/Xray-core/releases?per_page=5" | jq -r ".[]|select (.prerelease==false)|.tag_name" | awk '{print ""NR"""="$0}' | grep "${xraytype}=" | awk -F "[=]" '{print $2}')
            if [[ "${xraytype}" == "1" | "${xraytype}" == "2"  ]]; then
                wget -c -P patch/xray "https://github.com/XTLS/Xray-core/releases/download/${version}/Xray-linux-64.zip";
	        unzip -o patch/xray/Xray-linux-64.zip -d /usr/local/bin/;
                rm -rf patch/xray/Xray-linux-64.zip;
	        chmod 655 patch/xray/xray;

            elif [[ "${xraytype}" == "3" ]]; then
                  wget -q -O patch/xray/ "https://github.com/dharak36/Xray-core/releases/download/v1.0.0/xray.linux.64bit";
                  chmod 655 patch/xray/xray;
             else
                clear; echo -e " ${ERROR} Please Input The Correct Number !";
             fi
}
install_xray;
