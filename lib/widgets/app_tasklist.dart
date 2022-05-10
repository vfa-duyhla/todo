import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobx/todo_mobx.dart';
import 'package:flutter_application_1/widgets/app_alertdialog.dart';
import 'app_tasktile.dart';

class TaskList extends StatelessWidget {
  final TodoMobx todoMobx;
  const TaskList({
    Key? key,
    required this.todoMobx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoMobx.tasks.length,
      itemBuilder: (context, index) {
        final task = todoMobx.tasks[index];
        return TaskTile(
          taskImage: task.image,
          taskTitle: task.taskName,
          isDone: task.completed == 1 ? true : false,
          checkbox: (value) => todoMobx.toggleTask(task, value!),
          renameTask: () => todoMobx.showRenameTaskDialog(task, context),
          deleteTask: () => NewAlertDialog(
            title: 'Are you sure you want to delete this task?',
            confirmButtonAction: () => todoMobx.deleteTask(task.id, context),
          ).showaDialog(context),
        );
      },
    );
  }
}
