import 'package:flutter_application_1/localdb/database_config.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class Todo {
  DatabaseConfig databaseConfig = DatabaseConfig();

  Future<List<Task>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query('tasks', orderBy: 'id ASC');

    return List.generate(
      maps.length,
      (index) => Task(
        id: maps[index]['id'],
        taskName: maps[index]['task_name'],
        completed: maps[index]['completed'],
        image: maps[index]['image'],
      ),
    );
  }

  // Insert new task
  Future<bool> store(Task task) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('tasks', task.toMap());
      success = true;
    } catch (e) {
      success = false;
    }
    return success;
  }

  //Update task
  Future update(Task task, int taskId) async {
    Database db = await databaseConfig.getDatabase();

    await db.update('tasks', task.toMap(), where: 'id=?', whereArgs: [taskId]);
  }

  // Delete task
  Future delete(int taskId) async {
    Database db = await databaseConfig.getDatabase();

    await db.delete('tasks', where: 'id=?', whereArgs: [taskId]);
  }
}
