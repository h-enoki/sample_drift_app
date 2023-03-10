import 'package:drift/drift.dart';

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 0, max: 20)();
  TextColumn get content => text().named('body')();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(true))();
}
