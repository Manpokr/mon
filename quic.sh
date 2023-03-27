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
     "port": 2097,
      "protocol": "vmess",
       "settings": {
       "clients": [
       {
        "id": "2de56fc1-89b8-4bcc-b52e-61e78fc43599"
#quic
### tupaiko 2023-06-21                                                                                                                               
},{"id": "2de56fc1-89b8-4bcc-b52e-61e78fc43599","email": "tupaiko"
        }
     ]
  },
  "streamSettings": {
   "network": "quic",
    "quicSettings": {},
    "security": "tls",
     "tlsSettings": {
      "certificates": [
                   {
                   "certificateFile": "/usr/local/etc/xray/xray.crt", // 使用真实证书
                   "keyFile": "/usr/local/etc/xray/xray.key"
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



{
 "port": 443,
 "protocol": "vmess",
 "settings": {
  "clients": [
   {
    "id": ""
   }
  ]
 },
 "streamSettings": {
  "network": "quic",
  "quicSettings": {},
  "security": "tls",
  "tlsSettings": {
   "certificates": [
    {
     "certificateFile": "fullchain.crt", // 使用真实证书
     "keyFile": "private.key"
    }
   ]
  }
 }
}

2de56fc1-89b8-4bcc-b52e-61e78fc43599
Build (patched) OpenSSL

git clone --depth 1 -b openssl-3.0.8+quic https://github.com/quictls/openssl
 % cd openssl
 % ./config enable-tls1_3 --prefix=<somewhere1>
 % make
 % make install
Build nghttp3

 % cd ..
 % git clone https://github.com/ngtcp2/nghttp3
 % cd nghttp3
 % autoreconf -fi
 % ./configure --prefix=<somewhere2> --enable-lib-only
 % make
 % make install
Build ngtcp2

 % cd ..
 % git clone https://github.com/ngtcp2/ngtcp2
 % cd ngtcp2
 % autoreconf -fi
 % ./configure PKG_CONFIG_PATH=<somewhere1>/lib/pkgconfig:<somewhere2>/lib/pkgconfig LDFLAGS="-Wl,-rpath,<somewhere1>/lib" --prefix=<somewhere3> --enable-lib-only
 % make
 % make install
Build curl

 % cd ..
 % git clone https://github.com/curl/curl
 % cd curl
 % autoreconf -fi
 % LDFLAGS="-Wl,-rpath,<somewhere1>/lib" ./configure --with-openssl=<somewhere1> --with-nghttp3=<somewhere2> --with-ngtcp2=<somewhere3>
 % make
 % make install
