import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: Colors.cyan[200],
      width: 2.0,
    ),
  ),
);
