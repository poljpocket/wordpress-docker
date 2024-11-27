ARG PHP_VERSION

FROM php:${PHP_VERSION}-apache

# system updates
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl git zip zlib1g-dev libpng-dev libjpeg62-turbo-dev libwebp-dev libfreetype6-dev libcurl4-openssl-dev libonig-dev libzip-dev libicu-dev

# install necessary PHP extensions
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install curl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install opcache
RUN docker-php-ext-install intl

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install gd

# enable some Apache modules
RUN a2enmod rewrite headers

COPY ./config/php.ini $PHP_INI_DIR/conf.d/

COPY ./backup/* /var/www/html/

# copy over config and backup files
COPY ./config/php.ini $PHP_INI_DIR/conf.d/
COPY ./backup/* /var/www/html/

# make files editable from outside
ENV WEB_USER_ID=33
ENV WEB_GROUP_ID=33

RUN usermod -u $WEB_USER_ID www-data
RUN groupmod -g $WEB_GROUP_ID www-data

RUN chown -R www-data:www-data .
