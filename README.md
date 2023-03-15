
## データベース

データベースは、sqliteをラップしている[Drift](https://drift.simonbinder.eu/docs/)を使っている。

テーブルの定義は、[lib/src/models/entities/database](lib/src/models/entities/database)内にある。

DAOは、[lib/src/data_sources/local/daos](lib/src/services/local/daos)内にあって、
基本画面側ではそのまま触れない。

画面側でDBを操作したい場合は、リポジトリを通して使う。
リポジトリは[lib/src/repositories/local](lib/src/repositories/local)の下にある。

