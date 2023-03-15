import 'package:flutter/material.dart';
import 'package:sample_drift_app/src/components/edit_task_dialog.dart';

Future<String?> showAddTaskDialog(BuildContext context) async {
  return await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return EditTaskDialog.addTask();
    },
  );
}

Future<String?> showEditTaskDialog(
  BuildContext context,
  int index,
  String title,
) async {
  return await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return EditTaskDialog.editTask(index, title);
    },
  );
}
