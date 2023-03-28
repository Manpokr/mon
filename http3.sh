
#!/bin/bash
add-apt-repository ppa:ubuntu-toolchain-r/test
apt update
apt install -y libpcre3 libpcre3-dev zlib1g-dev cmake make automake golang g++-8 gcc-8 clang libunwind-dev golang
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

update-alternatives --config gcc
cd ~/
mkdir development

cd ~/development
git clone --depth 1 -b openssl-quic-draft-23 https://github.com/tatsuhiro-t/openssl
cd openssl
./config enable-tls1_3 --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
make -j4
make -j4 install_sw
rm -rf /usr/sbin/openssl
ln -s /usr/local/ssl/sbin/openssl /usr/sbin/

cd ~/development
git clone --recursive https://github.com/cloudflare/quiche

cd ~/development/quiche/deps/boringssl
mkdir build
cd build
cmake ..
make -j4

cd ~/development
git clone https://github.com/google/ngx_brotli.git
cd ngx_brotli && git submodule update --init

cd ~/development

curl -O https://nginx.org/download/nginx-1.16.1.tar.gz
tar -xzvf nginx-1.16.1.tar.gz
cd nginx-1.16.1

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
ln -s ~/.cargo/bin/* /usr/sbin/

patch -p01 < ../quiche/nginx/nginx-1.16.patch

./configure \
    --with-compat --add-dynamic-module=../ngx_brotli \
    --with-stream \
    --with-threads \
    --prefix=/usr/local/nginx \
    --build="Nginx-Enabled-Http/3" \

*    --with-http_ssl_module \
*    --with-http_v2_module \
*    --with-http_v3_module \
*    --with-openssl=../quiche/deps/boringssl \
*    --with-quiche=../quiche 

./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --with-pcre  \
    --lock-path=/var/lock/nginx.lock \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module \
    --with-http_image_filter_module=dynamic \
    --modules-path=/etc/nginx/modules \
    --with-http_v2_module \
    --with-stream=dynamic \
    --with-http_addition_module \
    --with-http_mp4_module

make
make modules
make install 
adduser --system --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx

rm -rf /etc/nginx
mkdir /etc/nginx
rm -rf /usr/sbin/nginx
mkdir /etc/nginx/certs
mkdir /etc/nginx/conf.d
mkdir /etc/nginx/sites-enabled
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/modules
mkdir /var/log/nginx
ln -s /usr/local/nginx/sbin/nginx /usr/sbin/
cp -r /usr/local/nginx/conf/* /etc/nginx
rm -rf /etc/nginx/nginx.conf
cp objs/*.so /etc/nginx/modules
chmod 644 /etc/nginx/modules/*.so

cat >/lib/systemd/system/nginx.service <<EOL
[Unit]
Description=Nginx - With Boringssl and http3
Documentation=https://nginx.org/en/docs/
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target
[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
[Install]
WantedBy=multi-user.target
EOL

cat >/etc/nginx/sites-available/default <<EOL
server {
       listen 880 default_server;
       listen [::]:880 default_server;
       server_name _;
       root /var/www/html;
       index index.php index.html index.htm index.nginx-debian.html;
       location / {
               try_files $uri $uri/ =404;
       }
}
EOL

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/private.key -out /etc/nginx/certs/cert.crt

cat >/etc/nginx/sites-available/default-http3 <<EOL
server {
        listen 8443 quic reuseport;
        listen 8443 ssl http2;
	
        ssl_certificate      /etc/nginx/certs/cert.crt;
        ssl_certificate_key  /etc/nginx/certs/private.key;
        ssl_protocols TLSv1.2 TLSv1.3;
        # Add Alt-Svc header to negotiate HTTP/3.
        add_header alt-svc 'h3-23=":8443"; ma=86400';
}
EOL

ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/default-http3 /etc/nginx/sites-enabled/


cat >/etc/nginx/conf.d/proxy.conf <<EOL
proxy_redirect          off;
client_max_body_size    10m;
client_body_buffer_size 128k;
proxy_connect_timeout   90;
proxy_send_timeout      90;
proxy_read_timeout      90;
proxy_buffers           32 4k;
EOL

cat >/etc/nginx/nginx.conf <<EOL
user       www-data;  
worker_processes  auto;  
error_log  /var/log/nginx/error.log crit;
pid        /var/run/nginx.pid;
worker_rlimit_nofile 8192;
load_module /etc/nginx/modules/ngx_http_brotli_filter_module.so;
load_module /etc/nginx/modules/ngx_http_brotli_static_module.so;
events {
  worker_connections  4096;
}
http {
  include    /etc/nginx/mime.types;
  include    /etc/nginx/conf.d/proxy.conf;
  include    /etc/nginx/fastcgi.conf;
  include    /etc/nginx/sites-enabled/*;
  default_type application/octet-stream;
  access_log   /var/log/access.log  off;
  sendfile     on;
  tcp_nopush   on;
  #brotli
  brotli on;
  brotli_static on;
  brotli_comp_level 9;
  brotli_types text/xml image/svg+xml application/x-font-ttf image/vnd.microsoft.icon application/x-font-opentype application/json font/eot application/vnd.ms-fontobject application/javascript font/otf application/xml application/xhtml+xml text/javascript  application/x-javascript text/plain application/x-font-truetype application/xml+rss image/x-icon font/opentype text/css image/x-win-bitmap;
  server_names_hash_bucket_size 128;
}
EOL


systemctl daemon-reload
systemctl enable nginx
systemctl restart nginx

curl -O https://nginx.org/download/nginx-1.19.1.tar.gz

# Install GCC
yum -y install gcc-c++
# Install CMAKE3
wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz
tar zxvf cmake-3.*
cd cmake-3.*
./bootstrap --prefix=/usr/local
make -j$(nproc)
make install
git clone --recursive https://github.com/cloudflare/quiche
tar xvzf nginx-1.19.1.tar.gz
cd nginx-1.19.1
patch -p01 < ../quiche/extras/nginx/nginx-1.16.patch
./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --with-openssl=../quiche/deps/boringssl \
    --with-quiche=../quiche \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_v3_module \
    --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --with-pcre  \
    --lock-path=/var/lock/nginx.lock \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module \
    --with-http_image_filter_module=dynamic \
    --modules-path=/etc/nginx/modules \
    --with-http_v2_module \
    --with-stream=dynamic \
    --with-http_addition_module \
    --with-http_mp4_module
make

touch /etc/nginx/nginx.conf
cat <<EOF >>/etc/nginx/nginx.conf
events {
    worker_connections  1024;
}
http {
    server {
        # Enable QUIC and HTTP/3.
        listen 8443 quic reuseport;
        # Enable HTTP/2 (optional).
        listen 8443 ssl http2;
        ssl_certificate      cert.crt;
        ssl_certificate_key  cert.key;
        # Enable all TLS versions (TLSv1.3 is required for QUIC).
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
        # Add Alt-Svc header to negotiate HTTP/3.
        add_header alt-svc 'h3-23=":443"; ma=86400';
    }
}
EOF



./auto/configure \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--modules-path=/usr/lib/nginx/modules \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-compat \
--with-file-aio \
--with-threads \
--with-http_addition_module \
--with-http_auth_request_module \
--with-http_dav_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_slice_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-http_v2_module \
--with-stream \
--with-stream_realip_module \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--with-cc-opt=-I../boringssl/include \
--with-ld-opt='-L../boringssl/build/ssl -L../boringssl/build/crypto' \
--with-http_v3_module \
--with-http_quic_module \
--with-stream_quic_module
make
