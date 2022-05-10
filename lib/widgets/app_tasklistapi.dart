import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobx/todo_mobx.dart';
import 'package:flutter_application_1/models/task_api_model.dart';
import 'package:flutter_application_1/widgets/app_tasktileapi.dart';

class TaskListApi extends StatelessWidget {
  final TodoMobx todoMobx;

  TaskListApi({Key? key, required this.todoMobx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TaskApi>>(
      future: todoMobx.tasksapi,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<TaskApi>? data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              var task = data[index];
              return TaskTileApi(
                  taskTitle: task.title!, isDone: task.completed!);
            },
          );
        } else
          return Text('${snapshot.error}');
      }),
    );
  }
}
