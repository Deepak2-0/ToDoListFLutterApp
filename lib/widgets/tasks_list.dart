import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/modal/task.dart';
import 'package:to_do_list/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          isTaskComplete: widget.tasks[index].isTaskComplete,
          task: widget.tasks[index].task,
          toggleCheckbox: (value) {
            setState(() {
              widget.tasks[index].toggleTask();
            });
          },
        );
      },
    );
  }
}
