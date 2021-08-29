import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/modal/tasks.dart';
import 'package:to_do_list/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(builder: (context, tasksData, child) {
      return ListView.builder(
        itemCount: tasksData.getLength(),
        itemBuilder: (BuildContext context, int index) {
          final taskItem = tasksData.tasks[index];
          return TaskTile(
            isTaskComplete: taskItem.isTaskComplete,
            task: taskItem.task,
            toggleCheckbox: (value) {
              tasksData.toggleATask(index);
            },
            deleteTask: () {
              tasksData.deleteTask(taskItem);
            },
          );
        },
      );
    });
  }
}
