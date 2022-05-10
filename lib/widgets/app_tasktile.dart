import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utility.dart';

class TaskTile extends StatelessWidget {
  final bool? isDone;
  final String? taskTitle;
  final String? taskImage;
  final Function(bool?)? checkbox;
  final Function() deleteTask;
  final Function() renameTask;
  const TaskTile({
    Key? key,
    required this.isDone,
    required this.taskTitle,
    this.checkbox,
    required this.deleteTask,
    required this.renameTask,
    required this.taskImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle!,
          // style:
          //     TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isDone,
          onChanged: checkbox,
        ),
        leading: SizedBox(
          height: 100.0,
          width: 100.0, // fixed width and height
          child: Utility.imageFromBase64String(taskImage!),
        ),
        onTap: renameTask,
        onLongPress: deleteTask);
  }
}
