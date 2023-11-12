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
export BLUE='\033[0;34m';
export CYAN='\033[0;36m';
export YELLOW='\033[0;33m';
export LIGHT='\033[0;37m';
export BG='\e[33;5;40m';
export BG1='\e[30;5;44m';
export NC='\033[0m';
# // Export Banner Status Information
export ERROR="(${RED} ERROR ${NC})";
export INFO="(${CYAN} INFO ${NC})";
export PS1="${BG1} INFO ${NC}";
export OKEY="(${GREEN} OKEY ${NC})";
# // Patch user git
export URL_INSTALL="";
export URL_PRMISION="https://";
# // Exporting maklumat rangkaia
source /root/ip-detail.txt;
export IP_NYA="$IP";
# // Domain name
export domain=$(cat /usr/local/etc/xray/domain);
# // Funstion bar
source /usr/bin/bar-run;

function cekroot() {
        # // Checking Your Running On Root
        [[ $EUID != 0 ]] && clear && echo -e " ${ERROR} Please run this script as root user !" && exit 1;
}

function permision() {
	# // Exporting maklumat rangkaian
        export DAYS=$(date -d "0 days" +"%Y-%m-%d");
	# // Chekking Client Permision
	if [[ $IP_NYA == "$(curl -sS ${URL_PRMISION}/ip | awk '{print $4}' | grep $IP_NYA )" ]]; then > /dev/null 2>&1;
            export skip='true';
        else
	    clear;
            echo -e "";
            echo -e " ${ERROR} Permision Denied !"; exit 0;
        fi

        # // Chekking Client Expired
        if [[ "$(curl -sS ${URL_PRMISION}/ip | grep $IP_NYA | awk '{print $3}')" > $DAYS ]]; then > /dev/null 2>&1;
            export skip='true';
        else
	    clear;
            echo -e "";
            echo -e " ${ERROR} Your Script Expired !"; exit 0;
        fi
}

function line() {
	echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
}

function logo() {
        clear
	echo -e "";
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
        echo -e "                ${RED}•••${NC} [ ${BG}Manternet Tunnel${NC} ] ${RED}•••${NC}";
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
}

function credit() {
	sleep 1
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
	echo -e "${BG}                    Thank you for using"
	echo -e "                Script Credit by Manternet"
	echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
}

function progress() {
	logo;
	fun_bar 'xrayupdate'; tput dl1;
        echo -e "\r               ( ${GREEN}Success update Xray-core !${NC} )"; tput cnorm;
        credit; back;
}

function back() {
	echo -e "";
	echo -e -n "Press ( ${BLUE}Enter${NC} ) to return to the menu or CTRL+C to exit"; read menu; main-menu
}

function updatemenu() {
        if [[ ! -f "/usr/local/bin/xray" ]]; then
            clear; echo -e ""; echo -e "${ERROR} Directory is not detected !"; exit 0;
        fi
            export XVER_NYA="$(/usr/local/bin/xray -version | awk NR==1 | cut -d " " -f 1-2 )";
	    logo;
	    echo -e " Current Xray-core Version = ${GREEN}${XVER_NYA}${NC}";
	    echo -e "";
	    curl -s "https://api.github.com/repos/XTLS/Xray-core/releases?per_page=5" | jq -r ".[]|select (.prerelease==false) |.tag_name" | awk '{print " (\033[0;36m0"NR"\033[0m) \033[0;31m•\033[0m \033[0;37mXray-core official"" = \033[0m\033[0;32m"$0}'
            echo -e " ${NC}(${CYAN}03${NC}) ${RED}•${NC} ${LIGHT}Xray-core Mod      = ${NC}${GREEN}v1.6.5${NC}";
            echo -e "";
            echo -e " (${RED}00${NC}) ${RED}•${NC} ${LIGHT}Back to menu${NC}";
            echo -e "";
	    line;
            echo -e -n " ${LIGHT}Choose a number (${GREEN} 0 - 3 ${NC}${LIGHT})${NC} = "; read xraytype
}


function xrayupdate() {
        export xversion="$(echo ${xraytype} | sed 's/0//g')";
	export version=$(curl -s "https://api.github.com/repos/XTLS/Xray-core/releases?per_page=5" | jq -r ".[]|select (.prerelease==false)|.tag_name" | awk '{print ""NR"""="$0}' | grep "${xversion}=" | awk -F "[=]" '{print $2}');
	if [[ "${xraytype}" == "1" || "${xraytype}" == "2" || "${xraytype}" == "01" || "${xraytype}" == "02" ]]; then
	    wget -c -P /usr/local/bin/ "https://github.com/XTLS/Xray-core/releases/download/${version}/Xray-linux-64.zip";
            unzip -o /usr/local/bin/Xray-linux-64.zip -d /usr/local/bin/;
            rm -rf /usr/local/bin/Xray-linux-64.zip;
            chmod 655 /usr/local/bin/xray;

        elif [[ "${xraytype}" == "3" || "${xraytype}" == "03" ]]; then
	    wget -c -P /usr/local/bin/ "https://github.com/dharak36/Xray-core/releases/download/v1.0.0/xray.linux.64bit";
            mv -f /usr/local/bin/xray.linux.64bit /usr/local/bin/xray
            rm -rf /usr/local/bin/xray-linux-64bit;
            chmod 655 /usr/local/bin/xray;
       else
            clear; echo -e " ${ERROR} Please Input The Correct Number !";
     fi
}

function main() {
	cekroot;
	permision;
	updatemenu;
	progress;
}
main;
