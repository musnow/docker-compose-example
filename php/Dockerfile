FROM php:7.4.11-fpm-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache \
    --virtual .phpize-deps \
    --virtual .build-deps \
    build-base \
    autoconf \
    imagemagick \
    imagemagick-dev \
    libtool \
    musl-dev \
    && apk add --no-cache freetype freetype-dev libpng libpng-dev libwebp libwebp-dev libjpeg-turbo libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    --with-webp=/usr/include/ \
    && docker-php-ext-install -j$(nproc) pdo_mysql mysqli gd bcmath exif \
    && pecl install imagick redis \
    && docker-php-ext-enable imagick redis \
    #   && apk del freetype-dev libpng-dev libjpeg-turbo-dev .build-deps .phpize-deps autoconf build-base \
    && rm -rf /tmp/*

# 更多设置请查看官方文档: https://hub.docker.com/_/php/