import 'package:flutter/material.dart';

const kCurvedWhiteBackGround = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);

const kTextFieldDecoration = InputDecoration(
  //hintText: 'Type Text Here',
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4),
  ),
);
