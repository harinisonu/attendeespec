//import 'package:attendees_spec/models/user.dart';


import 'package:attendees_spec/services/auth.dart';
import 'package:flutter/material.dart';
import './studentrecords.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:attendees_spec/services/database.dart';
//import 'package:provider/provider.dart';
//import 'package:attendees_spec/services/database.dart';
//import 'package:attendees_spec/share/loading.dart';



class MyHomePage extends StatefulWidget {
  static const String routeName = "/home";
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool isSwitched = true;
  // List<bool> isSelected;
  //bool _showIcons = false;
  //PersistentBottomSheetController<void> _bottomSheet;
 
  // int selectedCheckboxTile;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedCheckboxTile = 0;
  // }

  // setselectedCheckboxTile(int val) {
  //   setState(() {
  //     selectedCheckboxTile = val;
  //   });
  // }
  
  bool _isChecked = false;


   
onChanged(bool val){
    setState(() {
      _isChecked = val;
    });
  }

  
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

  final AuthService _auth = AuthService();

  bool studentFlag = false;
  bool loading = false;
  bool selected = false;
  String dropDownDept;
  String dropDownYear;
  String dropDownSec;
  var _dept = ['ece', 'cse', 'mech', 'eee'];
  var _year = ['II', 'III', 'IV'];
  var _sec = ['A', 'B', 'C', 'D'];

  var students;  

  // final CollectionReference studentCollection =
  //     Firestore.instance.collection('student');
  // final CollectionReference attendanceCollection = Firestore.instance.collection('attendance');

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    
    return Card(
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: CheckboxListTile(
        value: _isChecked,
        controlAffinity: ListTileControlAffinity.leading,
        //groupValue: selectedRadioTile,
       
        title: Row(
          children: <Widget>[
            Text(document['rollno'].toString()),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(document['name']),
            ),
          ],
        ),
        
        onChanged: (val) {
          onChanged(val);
          print(val);                  
          //setselectedCheckboxTile(val);
          // print(document['rollno']);
        },
        activeColor: Colors.green,
        secondary: OutlineButton(child: Text('On Duty',), onPressed: () { print('say hello'); },),
        selected: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendeespec',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('LogOut'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      drawer: getNavDrawer(context),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
          width: selected ? 500.0 : 500.0,
          //height: selected ? 400.0 : 600.0,
          color: selected ? Colors.black : Colors.white,
          // alignment:
          //     selected ? Alignment.center : AlignmentDirectional.topCenter,
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    DropdownButton<String>(
                      value: dropDownDept,
                      hint: Text(
                        'Department ',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      ),
                      //icon: Icon(Icons.arrow_drop_down_circle, color: Colors.cyan[200],),
                      iconSize: 24,
                      onChanged: (String newValue1) {
                        setState(() {
                          dropDownDept = newValue1;
                        });
                      },
                      items:
                          _dept.map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(
                            value1,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    //SizedBox(height: 30.0),
                    DropdownButton<String>(
                      value: dropDownYear,
                      //icon: Icon(Icons.arrow_drop_down_circle, color: Colors.cyan[200],),
                      iconSize: 24,
                      //isExpanded: false,
                      onChanged: (String newValue2) {
                        setState(() {
                          dropDownYear = newValue2;
                        });
                      },
                      hint: Text(
                        'Year ',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      ),
                      items:
                          _year.map<DropdownMenuItem<String>>((String value2) {
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Text(
                            value2,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    //SizedBox(height: 30.0),
                    DropdownButton<String>(
                      value: dropDownSec,
                      hint: Text(
                        'Section ',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      ),
                      //icon: Icon(Icons.arrow_drop_down_circle, color: Colors.cyan[200],),
                      iconSize: 24,
                      onChanged: (String newValue3) {
                        setState(() {
                          dropDownSec = newValue3;
                        });
                      },
                      items:
                          _sec.map<DropdownMenuItem<String>>((String value3) {
                        return DropdownMenuItem<String>(
                          value: value3,
                          child: Text(
                            value3,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    //SizedBox(height: 40.0),
                  ],
                ),
                SizedBox(height: 40.0),
                Container(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('student')
                          .where('dept', isEqualTo: dropDownDept)
                          .where('year', isEqualTo: dropDownYear)
                          .where('section', isEqualTo: dropDownSec)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('loading...');
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //itemExtent: 80.0,
                            
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return _buildListItem(
                                  context, snapshot.data.documents[index]);
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
