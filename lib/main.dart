import './screenss/wrapper.dart';
import './screenss/attendance/home.dart';
import './screenss/attendance/studentrecords.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './services/auth.dart';
import './models/user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Attendees Spectator',
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
        // define the routes
        MyHomePage.routeName: (BuildContext context) => MyHomePage(),
        StudentRecords.routeName: (BuildContext context) => StudentRecords(),
      },
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
      ),
    );
  }
}



