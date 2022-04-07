# dbt-sample
dbt BigQuery の sample です

## setup
1. GCP のセットアップを行ってください
2. profiles.yml の project をあなたの GCP project に設定してください
3. 以下のコマンドを実行してください

```
# docker コンテナはローカルマシンの GCP クレデンシャルを使用します
$ gcloud auth login
$ gcloud auth application-default login

$ docker-compose up -d
$ docker exec -it local /bin/bash

# このリポジトリでは既に実行済みのためスキップしてください
$ dbt init
Enter a name for your project (letters, digits, underscore): sample_project
[1] bigquery
[1] oauth
project (GCP project id): your-project
dataset (the name of your dbt dataset): lake
threads (1 or more): 4
timeout_seconds [300]: 
[1] US

# seeds 配下の csv を BigQuery に登録する
$ dbt seed

# models 配下の sql を実行する
$ dbt run

# models 配下の test を実行する ※ tests パスは意図的に削除しています
$ dbt test

# models / tests / lineage などをドキュメント化します
$ dbt docs generate

# ドキュメントを公開するために webserver を起動します
$ dbt docs serve --port 8080
```

## GitHub Pages
dbt docs generate で作成したファイルを docs 配下に置くことで、
GitHub Pages で公開することができます

```
$ mkdir docs
$ cp dbt_projects/sample_project/target/catalog.json docs
$ cp dbt_projects/sample_project/target/index.html docs
$ cp dbt_projects/sample_project/target/manifest.json docs
$ cp dbt_projects/sample_project/target/run_results.json docs
```

# 参考
- [BigQueryとdbt Cloudで始めるデータパイプライン入門](https://zenn.dev/dbt_tokyo/books/537de43829f3a0)
- [dbt + BigQueryで出力するデータセットを変更する](https://qiita.com/munaita_/items/29a23815240e37c8ee31)
- [dbt-core docker](https://github.com/dbt-labs/dbt-core/tree/main/docker)
