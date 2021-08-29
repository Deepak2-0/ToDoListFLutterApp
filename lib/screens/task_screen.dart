import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/modal/tasks.dart';
import 'package:to_do_list/widgets/tasks_list.dart';

import '../constants.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  static String url = "/";

  getText(int length) {
    if (length <= 1) return '$length Task';
    return '$length Tasks';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'To Do List',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<Tasks>(
                  builder: (context, tasksData, child) {
                    return Text(
                      getText(tasksData.getLength()),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
              decoration: kCurvedWhiteBackGround,
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
