import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_drift_app/main.dart';
import 'package:sample_drift_app/src/components/edit_task_dialog.dart';
import 'package:sample_drift_app/src/data_sources/local/app_database.dart';
import 'package:sample_drift_app/src/models/task.dart';
import 'package:sample_drift_app/src/views/todo_list_page/parts/todo_list_item.dart';

import 'parts/add_task_list_tile.dart';

final isEditingProvider = StateProvider<bool>((ref) {
  return false;
});

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier(
    [
      const Task("task1", false),
      const Task("task2", false),
      const Task("task3", false),
      const Task("task4", false),
      const Task("task5", true),
      const Task("task6", true),
    ],
  );
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier(List<Task> state) : super(state);

  void updateTask(int index, String title) {
    state = [
      ...state.sublist(0, index),
      state[index].copyWith(title: title),
      ...state.sublist(index + 1),
    ];
  }

  void removeTask(int index) {
    state = List.from(state)..removeAt(index);
  }

  void updateIsCompleted(int index) {
    state = [
      ...state.sublist(0, index),
      state[index].copyWith(isCompleted: !state[index].isCompleted),
      ...state.sublist(index + 1),
    ];
  }
}

final todoListProvider = StreamProvider<List<Todo>>((ref) {
  final localRepo = ref.watch(localRepoProvider);
  final todoRepo = localRepo.todoRepo;
  return todoRepo.watchAllTodos();
});

class ToDoListPage extends ConsumerWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDoリスト"),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.create_rounded),
            onPressed: () =>
                ref.read(isEditingProvider.notifier).state = !isEditing,
          ),
        ],
      ),
      body: todoList.when(
        // エラー時
        error: (err, _) => Text(err.toString()),
        // 読み込み時
        loading: () => const Center(child: CircularProgressIndicator()),
        // データ受け取り時
        data: (data) {
          int itemCount = data.length;
          return ListView.builder(
            itemCount: isEditing ? itemCount + 1 : itemCount,
            itemBuilder: (context, index) {
              // フッター
              if (isEditing && index == itemCount) {
                return const AddTaskListTile(addEditMode: AddEditMode.add);
              }
              return TodoListItem(
                key: Key(index.toString()),
                index: index,
                todo: data[index],
              );
            },
          );
        },
      ),
    );
  }
}
