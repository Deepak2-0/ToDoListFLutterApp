import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/modal/tasks.dart';
import 'package:to_do_list/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  // final List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    // This gets the current state of Tasks and also tells Flutter
    // to rebuild this widget when Tasks notifies listeners (in other words,
    // when it changes).
    var tasks = context.watch<Tasks>();

    return ListView.builder(
      itemCount: tasks.items.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          isTaskComplete: tasks.items[index].isTaskComplete,
          task: tasks.items[index].task,
          toggleCheckbox: (value) {
            setState(() {
              tasks.items[index].toggleTask();
            });
          },
        );
      },
    );
  }
}
