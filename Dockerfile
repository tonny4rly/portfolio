FROM php:8.2-apache

ENV PORT 8080

RUN apt-get update \
    && apt-get install -y --no-install-recommends libzip-dev zip \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# Configure Apache to listen on the PORT used by Cloud Run and enable rewrite
RUN sed -ri "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf \
    && sed -ri "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-available/000-default.conf \
    && a2enmod rewrite

# Copy app files to the web root
COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

CMD ["apache2-foreground"]
