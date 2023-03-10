import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/src/components/edit_task_dialog.dart';
import 'package:sample_drift_app/src/views/todo_list_page/todo_list_page.dart';

class AddTaskListTile extends ConsumerWidget {
  const AddTaskListTile({super.key, required this.addEditMode});

  final AddEditMode addEditMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => showEditTaskDialog(context, addEditMode),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: const ListTile(
          title: Text("タスクを追加"),
          leading: Icon(Icons.add),
        ),
      ),
    );
  }
}