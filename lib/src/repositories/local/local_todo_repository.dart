import 'package:sample_drift_app/src/services/local/daos/todo_dao.dart';
import 'package:sample_drift_app/src/services/local/database.dart';

class LocalTodoRepository {
  final TodosDao todosDao;

  LocalTodoRepository(AppDatabase appDatabase)
      : todosDao = appDatabase.todosDao;

  Future<List<Todo>> getAllTodos() {
    return todosDao.getAllTodos();
  }

  Stream<List<Todo>> watchAllTodos() {
    return todosDao.watchAllTodos();
  }

  Future<void> insertTodo(TodosCompanion todo) {
    return todosDao.insertTodo(todo);
  }

  Future<void> updateTodo(Todo todo) {
    return todosDao.updateTodo(todo);
  }

  Future<void> deleteTodoById(int id) {
    return todosDao.deleteTodoById(id);
  }
}

/*
このコードは、ローカルデータベースにアクセスするための LocalTodoRepository クラスを定義しています。以下に各要素について説明します。

1. final TodosDao todosDao:
このフィールドは、TodosDao クラスのインスタンスを保持し、データベースアクセスに使用されます。

2. LocalTodoRepository(AppDatabase appDatabase) : todosDao = appDatabase.todosDao;:
このコンストラクタは、AppDatabase クラスのインスタンスを受け取り、todosDao フィールドに appDatabase.todosDao を代入します。
これにより、LocalTodoRepository クラスは TodosDao クラスのインスタンスを使用して、データベースにアクセスすることができます。

3. Future<List<Todo>> getAllTodos():
このメソッドは、データベースからすべてのTodoを取得するために、todosDao.getAllTodos() を呼び出します。

4. Stream<List<Todo>> watchAllTodos():
このメソッドは、データベース内のすべてのTodoを監視するために、todosDao.watchAllTodos() を呼び出します。

5. Future<void> insertTodo(TodosCompanion todo):
このメソッドは、新しいTodoをデータベースに挿入するために、todosDao.insertTodo(todo) を呼び出します。

6. Future<void> updateTodo(Todo todo):
このメソッドは、Todoを更新するために、todosDao.updateTodo(todo) を呼び出します。

7. Future<void> deleteTodoById(int id):
このメソッドは、指定されたIDを持つTodoをデータベースから削除するために、todosDao.deleteTodoById(id) を呼び出します。

このコードは、ローカルデータベースにアクセスするための LocalTodoRepository クラスを定義しています。
このクラスでは、データベースアクセスに TodosDao クラスを使用しています。
各メソッドは、TodosDao クラスのメソッドを呼び出すことで、データベースにアクセスし、Todoの取得、追加、更新、削除を実行します。

 */
