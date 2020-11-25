FROM postgres:12.4
ENV POSTGRES_HOST_AUTH_METHOD trust
ENV POSTGRES_USER=postgres
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.utf8
COPY ./sql/* /docker-entrypoint-initdb.d/
ENV FLAG flag{Y0u_ar3_m4ster_0f_p0stgr3}
RUN echo "echo $FLAG" > /usr/local/bin/run_it.sh
RUN chmod +x /usr/local/bin/run_it.sh