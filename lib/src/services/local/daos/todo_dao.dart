import 'package:drift/drift.dart';
import 'package:sample_drift_app/src/services/local/database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todos])
class TodosDao extends DatabaseAccessor<AppDatabase> with _$TodosDaoMixin {
  TodosDao(AppDatabase db) : super(db);

  Future<List<Todo>> getAllTodos() {
    return select(todos).get();
  }

  Stream<List<Todo>> watchAllTodos() {
    return select(todos).watch();
  }

  Future<int> insertTodo(TodosCompanion todo) {
    return into(todos).insert(todo);
  }

  Future updateTodo(Todo todo) {
    return update(todos).replace(todo);
  }

  Future deleteTodoById(int id) {
    return (delete(todos)..where((t) => t.id.equals(id))).go();
  }
}

/*
このコードは、Drift ORM（Object-Relational Mapping）を使用して、データベースにアクセスするための DAO（Data Access Object）を定義しています。
この DAO は Todos テーブルにアクセスし、CRUD（Create, Read, Update, Delete）の操作を提供します。

@DriftAccessor アノテーションを使うことで、Drift が DAO のコードを生成し、簡単にテーブルにアクセスできるようになります。
TodosDao は DatabaseAccessor を継承しており、AppDatabase を型パラメータとして受け取っています。
これにより、TodosDao は AppDatabase にアクセスし、テーブルにクエリを実行することができます。

TodosDao は Future や Stream を返すメソッドを提供しています。

getAllTodos メソッドは、select 関数を使用して Todos テーブルのすべてのレコードを取得し、Future<List<Todo>> を返します。

watchAllTodos メソッドは、select 関数を使用して Todos テーブルの変更をリアルタイムで監視する Stream<List<Todo>> を返します。

insertTodo メソッドは、into 関数を使用して新しいレコードを Todos テーブルに挿入し、追加されたレコードの ID を Future<int> で返します。

updateTodo メソッドは、update 関数を使用して既存のレコードを更新します。

deleteTodoById メソッドは、delete 関数を使用して指定された ID のレコードを削除します。
delete 関数には、where メソッドを使用して、削除するレコードをフィルタリングするための条件を指定します。

 */
