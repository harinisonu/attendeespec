import 'package:flutter/material.dart';

class MySwitchListTilesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ListView(
        children: List.generate(20, (i)=>MySwitchListTile(

        )),
      ),
    );
  }
}
class MySwitchListTile extends StatefulWidget {

  @override
  _MySwitchListTileState createState() => new _MySwitchListTileState();
}

class _MySwitchListTileState extends State<MySwitchListTile> {
  bool _v = false;
  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      value:_v,
      onChanged: (value)=>setState((){
        _v=value;
      }),

    );
  }
}
