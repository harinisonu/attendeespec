//import 'package:attendees_spec/attendance/studentrecords.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import './studentrecords.dart';
import './home.dart';
//import 'package:attendees_spec/services/database.dart';
//import './student_list.dart';
//import 'package:attendees_spec/models/student.dart';
//import 'package:attendees_spec/share/loading.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  //bool loading = false;

  // Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  //   return ListTile(
  //     title: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: Text(
  //             document['rollno'].toString(),
  //             //style: ,
  //           ),
  //         ),
  //         Container(
  //           decoration: const BoxDecoration(color: Colors.white),
  //           padding: EdgeInsets.all(10.0),
  //           child: Text(document['name']),
  //         ),
  //       ],
  //     ),
  //     onTap: () {},
  //   );
  // }

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(
      child: Text(
        'Menu',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.cyan,
      ),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.person, "Home", MyHomePage.routeName),
      getNavItem(
          Icons.account_box, "Student Records", StudentRecords.routeName),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Attendance',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: getNavDrawer(context),
        //body: StudentList(),
      );
    
  }
}
