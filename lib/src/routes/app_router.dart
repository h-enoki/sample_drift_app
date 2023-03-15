import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:sample_drift_app/src/services/local/app_database.dart';
import 'package:sample_drift_app/src/views/todo_list_page/todo_list_page.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const ToDoListPage());

      case AppRoutes.driftDbViewer:
        return _buildRoute(DriftDbViewer(settings.arguments as AppDatabase));

      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }

  static Route<dynamic>? _buildRoute(
    Widget child, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => child,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
