FROM php:8.1.0-fpm

ARG AMBIENTE=${AMBIENTE} \
    USER=${USER} \
    CUSTOMUID=${CUSTOMUID} \
    CUSTOMGID=${CUSTOMGID} \
    APACHE=${APACHE}

#COMANDOS PARA SETEAR EL PROPIETARIO DEL DIRECTORIO
RUN echo "USUARIO: ${USER}"    
RUN echo "CUSTOMUID: ${CUSTOMUID}"    
RUN echo "CUSTOMGID: ${CUSTOMGID}"
RUN echo "APACHE: ${APACHE}"
RUN groupadd -g $CUSTOMGID -o $USER
RUN useradd -u $CUSTOMUID $USER -g ${APACHE} -o -m
COPY ./deploy/php/xdebug.ini "$PHP_INI_DIR/conf.d/xy-xdebug.ini"
# USAR CONFIGURACION PHP DE PRODUCCION
COPY ./deploy/php/php.ini "$PHP_INI_DIR/php.ini"
COPY ./.env ../.env
#INSTALAR LIBRERIAS UBUNTU
RUN apt-get update && apt-get install -y apt-utils cron procps iputils-ping telnet vim git libxml2-dev libpng-dev libzip-dev 
#INSTALAR LIBRERIAS PHP
RUN docker-php-ext-install soap gd ctype bcmath zip
#INSTALAR POSTGRES PDO PARA PHP
RUN apt-get install -y libpq-dev
#INSTALAR XDEBUG PARA PHP
RUN pecl install xdebug && docker-php-ext-enable xdebug
#INSTALAR COMPOSER GLOBALMENTE COPIAR EL CODIGO Y SETEA EL DIRECTORIO DE TRABAJO
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#COMANDOS PROPIOS PARA EL MADSIS
COPY --chown=$APACHE:$APACHE ./ /var/www
WORKDIR /var/www
RUN composer install
RUN php artisan key:generate
USER root
EXPOSE 9000 