import 'package:flutter/material.dart';

class TaskTileApi extends StatelessWidget {
  final String taskTitle;
  final bool isDone;

  const TaskTileApi({Key? key, required this.taskTitle, required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          // style:
          //     TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isDone,
          onChanged: (value) {},
        ));
  }
}
