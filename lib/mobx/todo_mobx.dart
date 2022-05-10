import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/localdb/todo.dart';
import 'package:flutter_application_1/models/task_api_model.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/models/utility.dart';
import 'package:flutter_application_1/widgets/app_dialogwithtextfield.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'todo_mobx.g.dart';

class TodoMobx = _TodoMobxStore with _$TodoMobx;

abstract class _TodoMobxStore with Store {
  @observable
  bool loading = false;

  @observable
  List<Task> tasks = [];

  @observable
  Future<List<TaskApi>>? tasksapi;

  @observable
  var taskNameController = TextEditingController();

  @action
  Future getData() async {
    loading = true;
    tasks = await Todo().index();

    loading = false;
  }

  @action
  Future<List<TaskApi>> getDatabase() async {
    loading = true;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      loading = false;
      List result = jsonDecode(response.body);
      print(response.body);
      return result.map((data) => TaskApi.fromJson(data)).toList();
    } else {
      loading = false;
      throw Exception(response.statusCode);
    }
  }

  @action
  void showCreateTaskDialog(BuildContext context) {
    DialogWithTextField(
            title: 'Create a task',
            confirmButtonAction: () async {
              await Todo().store(
                Task(taskName: taskNameController.text),
              );
              Navigator.pop(context);
              taskNameController.text = '';
              getData();
            },
            textController: taskNameController)
        .showaDialog(context);
  }

  @action
  void saveImage(BuildContext context) {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) async {
        String imgString = Utility.base64String(
          await value!.readAsBytes(),
        );
        await Todo().store(Task(taskName: 'Image', image: imgString));
        Navigator.pop(context);
        getData();
      },
    );
  }

  @action
  void showRenameTaskDialog(Task task, BuildContext context) {
    DialogWithTextField(
            title: 'Rename a task',
            confirmButtonAction: () async {
              await Todo().update(
                  Task(
                      id: task.id,
                      taskName: taskNameController.text,
                      completed: task.completed,
                      image: task.image),
                  task.id!);
              Navigator.pop(context);
              taskNameController.text = '';
              getData();
            },
            textController: taskNameController)
        .showaDialog(context);
  }

  @action
  Future<bool?> toggleTask(Task task, bool status) async {
    await Todo().update(
        Task(
            id: task.id,
            taskName: task.taskName,
            image: task.image,
            completed: status ? 1 : 0),
        task.id!);
    getData();
    return status;
  }

  @action
  Future deleteTask(int? taskId, BuildContext context) async {
    await Todo().delete(taskId!);
    Navigator.pop(context);
    getData();
  }
}
