CREATE DATABASE seccamp;

\c seccamp;

CREATE TABLE lectures (
  name   text,
  track  text
);

INSERT INTO lectures (name, track) VALUES ('マクロな視点から捉える Web セキュリティ: Web インフラストラクチャを利用した攻撃とサイドチャネル攻撃の実践と評価', 'B');
INSERT INTO lectures (name, track) VALUES ('Learn the essential way of thinking about vulnerabilities through post-exploitation on middlewares', 'B');
INSERT INTO lectures (name, track) VALUES ('最先端のオフェンシブセキュリティ研究入門', 'C');
INSERT INTO lectures (name, track) VALUES ('機械学習モデルの構築と攻撃 (Part 3)', 'D');
INSERT INTO lectures (name, track) VALUES ('セキュリティ啓発マンガの制作', 'D');
INSERT INTO lectures (name, track) VALUES ('ワークショップで学ぶ偽装通信対策', 'A');
INSERT INTO lectures (name, track) VALUES ('ロバストプロコル・オープンチャレンジ大会', 'A');
