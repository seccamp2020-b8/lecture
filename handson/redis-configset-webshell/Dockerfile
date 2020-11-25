FROM redis:5.0

RUN apt-get -y update && apt-get install -y nginx php php-fpm supervisor \
    && rm -rf /var/lib/apt/lists/*

# Nginx
COPY ./site.conf /etc/nginx/conf.d/default.conf
RUN chmod 777 /usr/share/nginx/html/

# PHP
COPY ./index.php /usr/share/nginx/html/index.php
RUN mkdir /run/php/

# supervisord
COPY supervisord.conf /etc/supervisord.conf

CMD supervisord -c /etc/supervisord.conf
