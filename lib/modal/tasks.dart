import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:to_do_list/modal/task.dart';

class Tasks extends ChangeNotifier {
  //underscore makes it private and thus tasks will not be accessible directly outside this class and thus
  // will not lead to bugs
  List<Task> _tasks = [
    Task(task: 'Buy Eggs', id: nanoid()),
    Task(task: 'Buy Apple', id: nanoid()),
    Task(task: 'Buy Banana', id: nanoid()),
  ];

  // Public tasks
  //used UnmodifiableListView instead of List as later we can use tasks.add(Task('Buy Sugar');
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTask) {
    _tasks.add(Task(task: newTask, id: nanoid()));
    notifyListeners();
  }

  int getLength() {
    return _tasks.length;
  }

  void toggleATask(int taskIndex) {
    if (_tasks.length > taskIndex) {
      _tasks[taskIndex].toggleTask();
      notifyListeners();
    }
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
