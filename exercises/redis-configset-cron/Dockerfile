FROM centos:7

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install crontabs redis nc wget curl

RUN echo "flag{why_1s_my_cr0nt4b_n0t_w0rking}" > /flag.txt
COPY redis.conf /usr/local/etc/redis/redis.conf

CMD crond && redis-server /usr/local/etc/redis/redis.conf
