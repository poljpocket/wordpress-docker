FROM wordpress:latest

COPY ./config/php.ini $PHP_INI_DIR/conf.d/

COPY ./backup/* /var/www/html/
