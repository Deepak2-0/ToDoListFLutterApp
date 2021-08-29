import 'package:flutter/material.dart';

//NOT USING CONSUMER AGAIN HERE AS WE NEEDED CONSUMER IN task_list, so its better to use it a single place
// then  pass down its data
class TaskTile extends StatelessWidget {
  final bool isTaskComplete;
  final Function toggleCheckbox;
  final String task;
  final Function deleteTask;

  TaskTile({
    required this.isTaskComplete,
    required this.toggleCheckbox,
    required this.task,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Are you sure you want to delete the below task?"),
                content: Text('$task'),
                actions: <Widget>[
                  TextButton(
                    child: Text("Delete"),
                    onPressed: () {
                      deleteTask();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          task,
          style: TextStyle(
            fontSize: 20,
            decoration: isTaskComplete ? TextDecoration.lineThrough : null,
          ),
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
