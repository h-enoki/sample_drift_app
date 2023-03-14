import 'package:drift/drift.dart';
import 'package:sample_drift_app/src/data_sources/local/database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todo])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(AppDatabase db) : super(db);

  Future<List<TodoData>> getAllTodos() {
    return select(todo).get();
  }

  Stream<List<TodoData>> watchAllTodos() {
    return select(todo).watch();
  }

  Future insertTodo(Insertable<TodoData> data) {
    return into(todo).insert(data);
  }

  Future updateTodo(Insertable<TodoData> data) {
    return update(todo).replace(data);
  }

  Future deleteTodoById(int id) {
    return (delete(todo)..where((t) => t.id.equals(id))).go();
  }
}
