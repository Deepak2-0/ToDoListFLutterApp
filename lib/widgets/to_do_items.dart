import 'package:flutter/material.dart';

class ToDoItems extends StatefulWidget {
  const ToDoItems(
      {Key? key,
      required this.item,
      required this.isChecked,
      required this.isNotRequired})
      : super(key: key);

  final String item;
  final bool isChecked;
  final bool isNotRequired;

  @override
  _ToDoItemsState createState() => _ToDoItemsState();
}

class _ToDoItemsState extends State<ToDoItems> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.lightBlueAccent;
      }
      return Colors.black;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.item,
          style: widget.isNotRequired
              ? TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2,
                )
              : TextStyle(fontSize: 20),
        ),
        Checkbox(
          checkColor: Colors.lightBlueAccent,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: widget.isChecked,
          onChanged: (bool? value) {},
        ),
      ],
    );
  }
}
