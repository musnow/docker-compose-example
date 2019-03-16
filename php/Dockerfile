FROM php:7.3.3-fpm-alpine3.8
RUN apk update --no-cache \
    && apk add --no-cache $PHPIZE_DEPS \
    # 添加php扩展
    && docker-php-ext-install pdo pdo_mysql mbstring

# 更多设置请查看官方文档: https://hub.docker.com/_/php/