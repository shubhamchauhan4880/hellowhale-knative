FROM php:7.3-apache

COPY html /usr/src/app/html

WORKDIR /usr/src/app/html

EXPOSE 8081

CMD php -S 0.0.0.0:8081
