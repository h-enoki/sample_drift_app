import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sample_drift_app/src/services/local/daos/todo_dao.dart';
import 'package:sample_drift_app/src/services/local/database.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Todos,
  ],
  daos: [
    TodosDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/*
このコードは、ローカルデータベースにアクセスするための AppDatabase クラスを定義しています。以下に各要素について説明します。

1. @DriftDatabase:
このアノテーションは、Driftパッケージの機能を使用して、データベーススキーマを定義します。
tables 引数は、データベースに含まれるテーブルを指定し、daos 引数は、データベースへのアクセスに使用されるDAOを指定します。

2. AppDatabase extends _$AppDatabase:
このクラスは、Driftパッケージによって生成されたコードと合わせて、アプリケーションで使用するための AppDatabase クラスを定義します。

3. AppDatabase() : super(_openConnection()):
このコンストラクタは、親クラスである _$AppDatabase のコンストラクタを呼び出し、データベース接続を確立します。
_openConnection() メソッドは、データベースへの接続を開くために使用されます。

4. LazyDatabase _openConnection():
このメソッドは、データベースに接続するための LazyDatabase クラスのインスタンスを返します。
LazyDatabase クラスは、データベースへの接続を遅延させるために使用されます。
具体的には、createInBackground() メソッドを使用して、データベースファイルを作成し、NativeDatabase クラスのインスタンスを作成して返します。

5. int get schemaVersion => 1;:
このメソッドは、データベースのスキーマバージョンを指定します。

このコードは、Flutterアプリケーションで使用するローカルデータベースにアクセスするための AppDatabase クラスを定義しています。
Driftパッケージを使用することで、簡単にデータベーススキーマを定義し、DAOを作成できます。
また、LazyDatabase クラスを使用することで、データベース接続を遅延させることができます。

 */
