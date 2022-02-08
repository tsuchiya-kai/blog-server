# blog-server

ブログサイトを運営するためのアプリケーション側リポジトリ。
別にもう一つ [database リポジトリ](https://github.com/tsuchiya-kai/blog-database)を用意する。

## 概要

`next-create-app`コマンドを用いて作成したプロジェクトを vercel にデプロイする。

Next の API ルート機能の中で PrismaORM を使っている都合で、ビルド時に prisma schema を元に型生成（`yarn prisma generate`）する必要がある。

しかし database リポは submodule として取り込んであり且つ private リポであるため vercel 内でうまく読み取れない。

そのため production build 時のみ submodule をプロセスの中で clone する処理を入れている。

該当ファイルは`blog-server/shell-scripts/create-submodule-copy.sh`
