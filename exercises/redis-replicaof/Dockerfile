FROM redis:5.0

RUN echo 'flag{r3d1s_p05t_expl0it4tion!!1!!}' > /flag.txt
COPY redis.conf /usr/local/etc/redis/redis.conf

CMD redis-server /usr/local/etc/redis/redis.conf
