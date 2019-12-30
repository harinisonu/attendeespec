import 'package:attendees_spec/screenss/attendance/home.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}