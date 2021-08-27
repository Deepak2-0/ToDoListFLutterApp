import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}

// ToDoItems(item: "By Milk", isChecked: true, isNotRequired: false),
// ToDoItems(item: "By Eggs", isChecked: false, isNotRequired: false),
// ToDoItems(item: "By Bread", isChecked: false, isNotRequired: true),
