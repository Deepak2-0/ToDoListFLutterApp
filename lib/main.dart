import 'package:flutter/material.dart';
import 'package:to_do_list/screens/task_screen.dart';

void main() {
  runApp(MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {TaskScreen.url: (context) => TaskScreen()},
    );
  }
}
