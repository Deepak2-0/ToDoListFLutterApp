import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/modal/task.dart';

class TasksDatabase {
  static final TasksDatabase instance = TasksDatabase._init();

  static Database? _database;
  TasksDatabase._init();

  //return instance of db if present or create and then return
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  //creating db
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    // final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final idType = 'INTEGER PRIMARY KEY';
    final taskType = 'TEXT NOT NULL';
    final isTaskCompleteType = 'BOOLEAN NOT NULL';
    await db.execute('''
      CREATE TABLE $tableTasks (
        ${TaskFields.id} $idType
        ${TaskFields.task} $taskType
        ${TaskFields.isTaskComplete} $idType
      )
    ''');
    return '';
  }

  Future<Task> create(Task task) async {
    final db = await instance.database;

    // final json = task.toJson();
    // final columns =
    //     '${TaskFields.id},${TaskFields.task},${TaskFields.isTaskComplete}';
    // final values =
    //     '${json[TaskFields.id]},${json[TaskFields.task]},${json[TaskFields.isTaskComplete]}';
    //
    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    //THE ABOVE 4 LINES DOES THE SAME THING AS THE BELOW 1 LINE
    //UPPER ONE IS WHEN YOU WANT TO WRITE YOUR OWN SQL STATEMENTS
    final id = await db.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<Task> readTask(int id) async {
    final db = await instance.database;
    //for multiple
    // where: '${TaskFields.id} = ? ?',
    // whereArgs: [id,value],
    final maps = await db.query(
      tableTasks,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found!');
    }
  }

  Future<List<Task>> readAllTask() async {
    final db = await instance.database;
    final result = await db.query(
      tableTasks,
    );
    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await instance.database;
    return db.update(
      tableTasks,
      task.toJson(),
      where: '${TaskFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(Task task) async {
    final db = await instance.database;
    return db.delete(
      tableTasks,
      where: '${TaskFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  //closing db
  Future close() async {
    //getting instance of database
    final db = await instance.database;
    db.close();
  }
}
