import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/main.dart';
import 'package:sample_drift_app/src/data_sources/local/app_database.dart';
import 'package:sample_drift_app/src/utils/showDialog.dart';
import 'package:sample_drift_app/src/views/todo_list_page/todo_list_page.dart';

class TodoListItem extends ConsumerWidget {
  const TodoListItem({super.key, required this.index, required this.todo});

  final int index;
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return InkWell(
      onTap: isEditing
          ? () => showEditTaskDialog(
                context,
                index,
                todo.title,
              )
          : () {
              final localRepo = ref.read(localRepoProvider);
              final todoRepo = localRepo.todoRepo;
              todoRepo
                  .updateTodo(todo.copyWith(isCompleted: !todo.isCompleted));
            },
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
          title: Text(todo.title),
          trailing: isEditing
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    final localRepo = ref.read(localRepoProvider);
                    final todoRepo = localRepo.todoRepo;
                    todoRepo.deleteTodoById(todo.id);
                  },
                )
              : todo.isCompleted
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
        ),
      ),
    );
  }
}
