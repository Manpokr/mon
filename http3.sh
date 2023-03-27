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
