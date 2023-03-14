import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 0, max: 20)();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(true))();
}
