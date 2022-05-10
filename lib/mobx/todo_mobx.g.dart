// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoMobx on _TodoMobxStore, Store {
  late final _$loadingAtom =
      Atom(name: '_TodoMobxStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$tasksAtom = Atom(name: '_TodoMobxStore.tasks', context: context);

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$tasksapiAtom =
      Atom(name: '_TodoMobxStore.tasksapi', context: context);

  @override
  Future<List<TaskApi>>? get tasksapi {
    _$tasksapiAtom.reportRead();
    return super.tasksapi;
  }

  @override
  set tasksapi(Future<List<TaskApi>>? value) {
    _$tasksapiAtom.reportWrite(value, super.tasksapi, () {
      super.tasksapi = value;
    });
  }

  late final _$taskNameControllerAtom =
      Atom(name: '_TodoMobxStore.taskNameController', context: context);

  @override
  TextEditingController get taskNameController {
    _$taskNameControllerAtom.reportRead();
    return super.taskNameController;
  }

  @override
  set taskNameController(TextEditingController value) {
    _$taskNameControllerAtom.reportWrite(value, super.taskNameController, () {
      super.taskNameController = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TodoMobxStore.getData', context: context);

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getDatabaseAsyncAction =
      AsyncAction('_TodoMobxStore.getDatabase', context: context);

  @override
  Future<List<TaskApi>> getDatabase() {
    return _$getDatabaseAsyncAction.run(() => super.getDatabase());
  }

  late final _$toggleTaskAsyncAction =
      AsyncAction('_TodoMobxStore.toggleTask', context: context);

  @override
  Future<bool?> toggleTask(Task task, bool status) {
    return _$toggleTaskAsyncAction.run(() => super.toggleTask(task, status));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_TodoMobxStore.deleteTask', context: context);

  @override
  Future<dynamic> deleteTask(int? taskId, BuildContext context) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(taskId, context));
  }

  late final _$_TodoMobxStoreActionController =
      ActionController(name: '_TodoMobxStore', context: context);

  @override
  void showCreateTaskDialog(BuildContext context) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
        name: '_TodoMobxStore.showCreateTaskDialog');
    try {
      return super.showCreateTaskDialog(context);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveImage(BuildContext context) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
        name: '_TodoMobxStore.saveImage');
    try {
      return super.saveImage(context);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showRenameTaskDialog(Task task, BuildContext context) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
        name: '_TodoMobxStore.showRenameTaskDialog');
    try {
      return super.showRenameTaskDialog(task, context);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
tasks: ${tasks},
tasksapi: ${tasksapi},
taskNameController: ${taskNameController}
    ''';
  }
}
