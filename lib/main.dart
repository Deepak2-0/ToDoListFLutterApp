import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/screens/task_screen.dart';

import 'modal/tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'to_do_list_database.db'),

    //isTasksComplete will store 1(true) and 0(false) as sqflite doesn't has boolean.
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT, isTaskComplete INTEGER)',
      );
    },
    version: 1,
  );

  runApp(MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        title: 'ToDo List App',
        theme: ThemeData(
            //primarySwatch: Colors.blue,
            ),
        initialRoute: "/",
        routes: {TaskScreen.url: (context) => TaskScreen()},
      ),
    );
  }
}
