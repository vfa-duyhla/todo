import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  Future<Database> getDatabase() async => openDatabase(
        join(await getDatabasesPath(), 'to_do.db'),
        onCreate: (db, version) async {
          await createTable(db);
        },
        onOpen: (db) {},
        onUpgrade: (db, oldVersion, newVersion) async {},
        onDowngrade: (db, oldVersion, newVersion) async {},
        version: 1,
      );
  Future createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'task_name TEXT,completed INTEGER NOT NULL,image TEXT);');
  }
}
