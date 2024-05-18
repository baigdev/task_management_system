import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';
import 'package:task_management_system/features/home/data/models/task_response_model.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory LocalStorage() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  LocalStorage._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        task_id INTEGER PRIMARY KEY,
        title String,
        description String,
        dueDate String,
        status INTEGER,
        docRefID String
      )
    ''');
  }

  Future<int> insertTask(AddTaskRequestModel task) async {
    Database db = await database;
    return await db.insert('tasks', task.toJson());
  }

  Future<List<TaskResponseModel>> getTasks() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return TaskResponseModel.fromJson(maps[i]);
    });
  }

  Future<int> updateTask(AddTaskRequestModel task) async {
    Database db = await database;
    return await db.update(
      'tasks',
      task.toJson(),
      where: 'task_id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(String id) async {
    Database db = await database;
    return await db.delete(
      'tasks',
      where: 'task_id = ?',
      whereArgs: [id],
    );
  }
}
