import 'package:sample_drift_app/src/data_sources/local/daos/todo_dao.dart';
import 'package:sample_drift_app/src/data_sources/local/database.dart';

class LocalTodoRepository {
  final TodoDao todoDao;

  LocalTodoRepository(AppDatabase appDatabase) : todoDao = appDatabase.todoDao;

  Stream<List<TodoData>> watchAllTodos() {
    return todoDao.watchAllTodos();
  }

  Future<void> insertTodo(TodoData todo) {
    return todoDao.insertTodo(todo);
  }

  Future<void> updateTodo(TodoData todo) {
    return todoDao.updateTodo(todo);
  }

  Future<void> deleteTodoById(int id) {
    return todoDao.deleteTodoById(id);
  }
}
