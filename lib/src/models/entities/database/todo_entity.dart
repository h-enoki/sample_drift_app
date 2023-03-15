import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 0, max: 20)();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(true))();
}

/*
このコードは、Driftを使用して定義されたデータベーステーブルを表しています。
この場合、Todosというテーブルが定義されています。

Todosテーブルには、id、title、isCompletedの3つのカラムが定義されています。
それぞれのカラムは、IntColumn、TextColumn、BoolColumnという型で定義されています。

idカラムは、整数値を保持し、自動インクリメントされる設定がされています。
titleカラムは、最大長が20文字の文字列を保持する設定がされています。
isCompletedカラムは、真偽値を保持する設定がされています。
isCompletedカラムには、既定値としてtrueが設定されています。

 */
