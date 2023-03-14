import 'package:drift/drift.dart';
import 'package:sample_drift_app/src/data_sources/local/database.dart';

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

  Future insertTodo(Insertable<Todo> data) {
    return into(todos).insert(data);
  }

  Future updateTodo(Insertable<Todo> data) {
    return update(todos).replace(data);
  }

  Future deleteTodoById(int id) {
    return (delete(todos)..where((t) => t.id.equals(id))).go();
  }
}
