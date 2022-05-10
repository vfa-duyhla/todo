class TaskApi {
  final int? id;
  final String? title;
  final bool? completed;

  TaskApi({this.id, this.title, this.completed});

  factory TaskApi.fromJson(Map<String, dynamic> json) {
    return TaskApi(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
