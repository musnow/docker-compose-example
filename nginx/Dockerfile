ARG version=1.19.3

FROM nginx:${version}-alpine
ARG version

# 编译支持brotli
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add --no-cache build-base git wget pcre-dev openssl-dev zlib-dev \
  && wget http://nginx.org/download/nginx-${version}.tar.gz \
  && tar zxf nginx-${version}.tar.gz \
  && git clone https://github.com/google/ngx_brotli.git \
  && cd ngx_brotli \
  && git submodule update --init --recursive \
  && cd ../nginx-${version} \
  && ./configure \
  --add-dynamic-module=../ngx_brotli \
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
  --with-perl_modules_path=/usr/lib/perl5/vendor_perl \
  --user=nginx \
  --group=nginx \
  --with-compat \
  --with-threads \
  --with-http_addition_module \
  --with-http_auth_request_module \
  --with-http_dav_module \
  --with-http_flv_module \
  --with-http_gunzip_module \
  --with-http_gzip_static_module \
  --with-http_mp4_module \
  --with-http_random_index_module \
  --with-http_realip_module \
  --with-http_secure_link_module \
  --with-http_slice_module \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-http_sub_module \
  --with-http_v2_module \
  --with-mail \
  --with-mail_ssl_module \
  --with-stream \
  --with-stream_realip_module \
  --with-stream_ssl_module \
  --with-stream_ssl_preread_module \
  && make modules

RUN install -m755 /nginx-${version}/objs/ngx_http_brotli_filter_module.so /usr/lib/nginx/modules/
RUN install -m755 /nginx-${version}/objs/ngx_http_brotli_static_module.so /usr/lib/nginx/modules/
# nginx配置
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./modules.conf /etc/nginx/modules.conf
# vhost配置
COPY ./conf/ /etc/nginx/conf.d/conf/
COPY ./vhost/ /etc/nginx/conf.d/
