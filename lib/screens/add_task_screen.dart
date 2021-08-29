import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/constants.dart';
import 'package:to_do_list/modal/tasks.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask = "";
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Did Container inside container as want curved white background and also to shift the bottom sheet upwards when keyboard comes
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: kCurvedWhiteBackGround,
            child: Column(
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: messageController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration,
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (newTask.trim().isNotEmpty) {
                        Provider.of<Tasks>(context, listen: false)
                            .addTask(newTask);
                        messageController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    style: ButtonStyle(
                      enableFeedback: newTask.trim().isNotEmpty ? true : false,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
