import 'dart:typed_data';

class Task {
  final int? id;
  final String? taskName;
  final int? completed;
  final String? image;

  Task({
    this.id,
    this.taskName,
    this.completed = 0,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_name': taskName,
      'completed': completed,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Task{id:$id,task_name:$taskName,completed:$completed,image:$image';
  }
}
