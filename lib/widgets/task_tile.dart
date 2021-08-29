import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isTaskComplete;
  final Function toggleCheckbox;
  final String task;

  TaskTile(
      {required this.isTaskComplete,
      required this.toggleCheckbox,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        task,
        style: TextStyle(
          fontSize: 20,
          decoration: isTaskComplete ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isTaskComplete,
        onChanged: (bool? value) {
          toggleCheckbox(value);
        },
      ),
    );
  }
}
