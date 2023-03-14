# sample_drift_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## データベース

データベースは、sqliteをラップしている[Drift](https://drift.simonbinder.eu/docs/)を使っている。

テーブルの定義は、[lib/src/models/entities/database](lib/src/models/entities/database)内にある。

DAOは、[lib/src/data_sources/local/daos](lib/src/data_sources/local/daos)内にあって、
基本画面側ではそのまま触れない。

画面側でDBを操作したい場合は、リポジトリを通して使う。
リポジトリは[lib/src/repositories/local](lib/src/repositories/local)の下にある。

各リポジトリのほとんどのメソッドでは、`getHogehoge()`と`watchHogehoge()`のペアになっていて、
各画面で、Futureを使いたいか、Streamを使って監視したいかによって、使い分けすることができる。
