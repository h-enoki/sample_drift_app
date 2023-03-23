import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_drift_app/src/repositories/local/local_todo_repository.dart';
import 'package:sample_drift_app/src/services/local/app_database.dart';

void main() {
  group("LocalTodoRepository", () {
    late AppDatabase appDatabase;
    late LocalTodoRepository localTodoRepository;

    setUp(() {
      // 参考：https://qiita.com/teriyaki398_/items/642be2f0ed1e87d8ae38
      TestWidgetsFlutterBinding.ensureInitialized();
      const MethodChannel channel =
          MethodChannel("plugins.flutter.io/path_provider");
      channel.setMockMethodCallHandler((methodCall) async {
        return ".";
      });

      appDatabase = AppDatabase();
      localTodoRepository = LocalTodoRepository(appDatabase);
      appDatabase.delete(appDatabase.todos).go();
    });

    tearDown(() async {
      await appDatabase.close();
    });

    var testTodo1 = const Todo(
      id: 1,
      title: "Test Todo 1",
      isCompleted: false,
    );
    var testTodo2 = const Todo(
      id: 2,
      title: "Test Todo 2",
      isCompleted: true,
    );

    var testTodosCompanion1 = TodosCompanion(
      title: Value(testTodo1.title),
      isCompleted: Value(testTodo1.isCompleted),
    );
    var testTodosCompanion2 = TodosCompanion(
      title: Value(testTodo2.title),
      isCompleted: Value(testTodo2.isCompleted),
    );

    test("getAllTodos returns list of todos", () async {
      // arrange
      await localTodoRepository.insertTodo(testTodosCompanion1);
      await localTodoRepository.insertTodo(testTodosCompanion2);
      List<Todo> result = [];

      // assert
      expect(result.length, 0);
      expect(result, []);

      // act
      result = await localTodoRepository.getAllTodos();

      // assert
      expect(result.length, 2);
      expect(result, [testTodo1, testTodo2]);
    });
  });
}
