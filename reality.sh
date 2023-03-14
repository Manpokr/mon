cat >/usr/local/etc/xray/reality.json <<-EOF
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
