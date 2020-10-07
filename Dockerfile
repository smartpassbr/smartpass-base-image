FROM php:7.2-apache

RUN apt update
RUN apt upgrade -y

RUN apt update && apt install -y bash git zip unzip curl firebird-dev

RUN apt install -y libcurl4
RUN apt install -y libmcrypt-dev
RUN apt install -y libicu-dev
RUN apt install -y libldb-dev
RUN apt install -y libldap2-dev
RUN apt install -y libxml2-dev
RUN apt install -y libssl-dev

RUN docker-php-ext-install interbase
RUN docker-php-ext-install pdo_firebird
RUN docker-php-ext-install mbstring
RUN a2enmod rewrite

RUN mkdir -p /app/src

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD composer install

CMD ls

EXPOSE 80
