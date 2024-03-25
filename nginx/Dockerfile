ARG version=1.25.4

FROM georgjung/nginx-brotli:${version}-alpine

# nginx配置
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./modules.conf /etc/nginx/modules.conf
