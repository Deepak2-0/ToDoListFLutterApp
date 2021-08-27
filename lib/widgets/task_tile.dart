import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Buy Milk',
        style: TextStyle(fontSize: 20),
      ),
      trailing: Checkbox(
        //checkColor: Colors.lightBlueAccent,
        activeColor: Colors.black,
        value: false,
        onChanged: (bool? value) {},
      ),
    );
  }
}
