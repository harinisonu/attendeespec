import 'package:flutter/material.dart';
//import './attendancetake.dart';
//import './logout.dart';

class StudentRecords extends StatefulWidget {

  static const String routeName = "/studentrecords";

  @override
  _StudentRecordsState createState() => _StudentRecordsState();
}

class _StudentRecordsState extends State<StudentRecords> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Records',style: TextStyle(color: Colors.white),),
      ),    
      body: Center(
        child: RaisedButton(
          child: new Text('Done'),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: Colors.cyan,
          onPressed: null,
        ),
      ),
    );
  }
}
