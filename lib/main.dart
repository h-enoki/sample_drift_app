import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/src/services/local/app_database.dart';
import 'package:sample_drift_app/src/repositories/local/local_repository_provider.dart';
import 'package:sample_drift_app/src/routes/app_router.dart';

final databaseProvider = Provider<AppDatabase>(
  (ref) {
    final appDatabase = AppDatabase();
    return appDatabase;
  },
);

final localRepoProvider = Provider<LocalRepositoryProvider>(
  (ref) => LocalRepositoryProvider(ref.watch(databaseProvider)),
);

/*
このコードは、Flutterアプリケーションで使用するローカルデータベースに関するプロバイダーを定義しています。
以下に各プロバイダーについての説明を示します。

1. databaseProvider:
AppDatabase クラスのインスタンスを提供するプロバイダーです。
このプロバイダーを使用することで、アプリケーションの他の部分から AppDatabase インスタンスを簡単に取得できます。

2. localRepoProvider:
LocalRepositoryProvider クラスのインスタンスを提供するプロバイダーです。
このプロバイダーは、databaseProvider を監視し、AppDatabase インスタンスを引数として LocalRepositoryProvider のコンストラクタを呼び出します。
これにより、LocalRepositoryProvider は、AppDatabase インスタンスを使用して、ローカルデータベースにアクセスするためのリポジトリを提供します。

これらのプロバイダーを使用することで、アプリケーション内でデータベースにアクセスするコードを簡素化できます。
また、Provider パッケージを使用することで、依存関係の注入を簡単に行うことができます。

 */

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      // フォント対応
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", "JP"),
      ],
    );
  }
}
