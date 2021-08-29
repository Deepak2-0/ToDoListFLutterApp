import 'package:flutter/material.dart';
import 'package:to_do_list/modal/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> tasks = [];

  /// List of task .
  List<Task> get items => tasks.toList();

  addTask(String newTask) {
    tasks.add(Task(task: newTask));
    notifyListeners();
  }

  toggleATask(int taskIndex) {
    if (tasks.length > taskIndex) {
      tasks[taskIndex].toggleTask();
      notifyListeners();
    }
  }

  // int tasksLength() {
  //   return tasks.length;
  //   notifyListeners();
  // }
}
