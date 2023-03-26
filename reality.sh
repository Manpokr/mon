I'llcat >/usr/local/etc/xray/reality.json <<-EOF
{
  "log" : {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "warning"
	  },
  "inbounds": [
    {
    "dns": {
        "servers": [
          "8.8.8.8",
          "8.8.4.4",
          "1.1.1.1",
          "1.0.0.1",
          "localhost",
          "https+local://dns.google/dns-query",
          "https+local://1.1.1.1/dns-query"
         ]
     },
     "port": 10085,
      "listen": "127.0.0.1",
      "protocol": "dokodemo-door",
      "settings": {
        "address": "127.0.0.1"
      },
      "tag": "api"
     },
     {
       "port": 880,
         "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "e056394b-fe9f-418a-81ea-80e1c6c439b4",
                        "flow": "xtls-rprx-vision"
#xtls
### tupaiko 2023-06-21                                                                                                                               
},{"id": "2de56fc1-89b8-4bcc-b52e-61e78fc43599","flow": "xtls-rprx-vision","email": "tupaiko"
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 9090
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "reality",
                "realitySettings": {
                    "show": false,
                    "dest": 880,
                    "xver": 0,
                    "serverNames": [
                                "",
                                ""
                    ],
                    "privateKey": "6NGlUcmVXsqJ1SFAV_XHaXEA7tPoh70Gx3GOrfxpcXc",
                    "shortIds": ["ffa31487aa767f38", "12345678"]
                    }                                                     
            },                                                            
           "sniffing": {                                                  
           "enabled": true,                                               
           "destOverride": [                                              
             "http",                                                      
             "tls"                                                        
                  ]                                                       
            }                                                             
        }                                                                 
    ],
 "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true,
      "statsOutboundUplink" : true,
      "statsOutboundDownlink" : true
    }
  }
}
EOF

jq '.inbounds[] | select(.settings != null) | select(.protocol == "vless") | {id: .settings.clients[].id, dest: .streamSettings.realitySettings.dest, serverNames: .streamSettings.realitySettings.serverNames, shortIds :.streamSettings.realitySettings.shortIds}' /usr/local/etc/xray/config.json


Private key: WPYLfRMUtdpOl4NcbtcEmNlmxv9hKwqp6Al0NInuPU0t
Public key: LcdUsWdlXzj-6JXJnas-wqwkALEEZV-ZntxZ2UHN9hMv


{
    "log": {
        "loglevel": "warning"
    },
    "routing": {
        "domainStrategy": "IPIfNonMatch",
        "rules": [
            {
                "type": "field",
                "domain": [
                    "ip.sb",
                    "geosite:openai"
                ],
                "outboundTag": "wireguard"
            },
            {
                "type": "field",
                "ip": [
                    "geoip:cn"
                ],
                "outboundTag": "wireguard"
            }
        ]
    },
    "inbounds": [
        {
            "listen": "0.0.0.0",
            "port": 443,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "chika",
                        "flow": "xtls-rprx-vision"
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": "8001",
                        "xver": 1
                    },
                    {
                        "alpn": "h2",
                        "dest": "8002",
                        "xver": 1
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "tls",
                "tlsSettings": {
                    "rejectUnknownSni": true,
                    "minVersion": "1.2",
                    "certificates": [
                        {
                            "ocspStapling": 3600,
                            "certificateFile": "/etc/ssl/private/fullchain.cer",
                            "keyFile": "/etc/ssl/private/private.key"
                        }
                    ]
                }
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "tag": "block"
        },
        {
            "protocol": "wireguard",
            "settings": {
                "secretKey": "",
                "address": [
                    "172.16.0.2/32"
                ],
                "peers": [
                    {
                        "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                        "allowedIPs": [
                            "0.0.0.0/0"
                        ],
                        "endpoint": "engage.cloudflareclient.com:2408"
                    }
                ],
                "reserved":[0, 0, 0],
                "mtu": 1280
            },
            "tag": "wireguard"
        }
    ],
    "policy": {
        "levels": {
            "0": {
                "handshake": 2,
                "connIdle": 120,
                "uplinkOnly": 1,
                "downlinkOnly": 1
            }
        }
    }
}


lsof -n | grep -i ESTABLISHED | grep trojan-go | awk '{print $11}' | grep -w 1006 | cut -d: -f1,3
clear
# // Cek Ssh
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo
echo "==========-[ DROPBEAR USER LOGIN ]-===========";
echo "  ID  |  USERNAME  |  IP ADDRESS";
echo "==============================================";
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo " $PID - $USER - $IP";
                fi
done

echo
echo "==========-[ OPENSSH USER LOGIN ]-============";
echo "  ID  |  USERNAME  |  IP ADDRESS";
echo "==============================================";
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
done
