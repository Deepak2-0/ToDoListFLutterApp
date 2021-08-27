import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DId Container inside container as want curved white background
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: kCurvedWhiteBackGround,
      ),
    );
  }
}
