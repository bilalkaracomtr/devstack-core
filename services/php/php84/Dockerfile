# PHP 8.4 FPM tabanlı image
FROM php:8.4-fpm

# Gerekli sistem paketleri ve PHP uzantıları
RUN apt-get update && apt-get install -y \
    zip unzip git curl wget \
    libzip-dev libpng-dev libonig-dev libxml2-dev libjpeg-dev libexif-dev libicu-dev \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    zip \
    gd \
    mbstring \
    exif \
    intl \
    calendar \
    soap \
    simplexml

# php.ini ayarlarını kopyala
COPY php.ini /usr/local/etc/php/

# Composer ekle
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Çalışma dizini
WORKDIR /var/www/html