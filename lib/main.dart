import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/src/data_sources/database.dart';
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
