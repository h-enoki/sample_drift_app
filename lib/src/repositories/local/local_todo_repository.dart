import 'package:sample_drift_app/src/data_sources/local/daos/todo_dao.dart';
import 'package:sample_drift_app/src/data_sources/local/database.dart';

class LocalTodoRepository {
  final TodosDao todosDao;

  LocalTodoRepository(AppDatabase appDatabase)
      : todosDao = appDatabase.todosDao;

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
