FROM mysql:5
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
COPY mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
COPY ./sql/* /docker-entrypoint-initdb.d/
RUN chmod 777 /usr/lib/mysql/plugin/
RUN echo "echo 'flag{UDF_ls_01d_t3chn1qu3}'" > /usr/local/bin/run_it.sh
RUN chmod +x /usr/local/bin/run_it.sh
CMD ["mysqld", "--secure-file-priv=/usr/lib/"]