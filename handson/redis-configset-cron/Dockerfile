FROM centos:7

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install crontabs redis

CMD crond && redis-server --protected-mode no
