FROM mysql:5
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
COPY mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
RUN echo "echo 'flag{w3bsh3ll_1s_us3ful}'" > /usr/local/bin/run_it.sh
RUN chmod +x /usr/local/bin/run_it.sh
RUN apt update
RUN apt install -y nginx php php-fpm supervisor
RUN rm /etc/nginx/sites-enabled/default
COPY ./site.conf /etc/nginx/conf.d/site.conf
RUN chmod 777 /usr/share/nginx/html/
COPY ./index.php /usr/share/nginx/html/index.php
RUN mkdir /run/php/
COPY supervisord.conf /etc/supervisord.conf
CMD supervisord -c /etc/supervisord.conf
EXPOSE 80 3306