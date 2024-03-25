FROM php:8.3.3-fpm-alpine
RUN apk update
RUN apk add --no-cache \
    --virtual .phpize-deps \
    --virtual .build-deps \
    build-base \
    autoconf \
    libtool \
    musl-dev \
    && apk add --no-cache libzip-dev freetype freetype-dev libpng libpng-dev libwebp libwebp-dev libjpeg-turbo libjpeg-turbo-dev imagemagick imagemagick-dev icu-dev libgomp \
    && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    --with-webp=/usr/include/ \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) pdo fileinfo pdo_mysql mysqli gd bcmath exif zip intl \
    && pecl install redis \
    && pecl install imagick \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable imagick \
    && apk del .build-deps autoconf build-base \
    && rm -rf /tmp/*


# 更多设置请查看官方文档: https://hub.docker.com/_/php/