import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/src/data_sources/local/app_database.dart';
import 'package:sample_drift_app/src/utils/showDialog.dart';
import 'package:sample_drift_app/src/views/todo_list_page/todo_list_page.dart';
import 'package:sample_drift_app/src/models/task.dart';

class TodoListItem extends ConsumerWidget {
  const TodoListItem({super.key, required this.index, required this.todoData});

  final int index;
  final TodoData todoData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return InkWell(
      onTap: () => isEditing
          ? showEditTaskDialog(
              context,
              index,
              todoData.title,
            )
          : ref.read(taskNotifierProvider.notifier).updateIsCompleted(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: ListTile(
          title: Text(todoData.title),
          trailing: isEditing
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () =>
                      ref.read(taskNotifierProvider.notifier).removeTask(index),
                )
              : todoData.isCompleted
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
        ),
      ),
    );
  }
}
