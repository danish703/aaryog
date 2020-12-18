import 'package:aarogya/page/addDoctor.dart';
import 'package:aarogya/page/addPatientform.dart';
import 'package:aarogya/page/addReport.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listitems = ["Home", "School", "business"];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<UnicornButton> _btnList = <UnicornButton>[
      UnicornButton(
        hasLabel: true,
        labelText: "Add Doctor",
        labelBackgroundColor: Colors.black,
        labelColor: Colors.white,
        currentButton: FloatingActionButton(
          child: Icon(Icons.local_hospital),
          mini: true,
          onPressed: () {
            Navigator.of(context).pushNamed(AddDoctorForm.routeName);
          },
          backgroundColor: Colors.red,
          heroTag: "Doctor",
        ),
      ),
      UnicornButton(
        hasLabel: true,
        labelText: "Add Patient",
        labelBackgroundColor: Colors.black,
        labelColor: Colors.white,
        currentButton: FloatingActionButton(
          child: Icon(Icons.person),
          backgroundColor: Colors.green,
          heroTag: "Patient",
          mini: true,
          onPressed: () {
            Navigator.of(context).pushNamed(AddPatientForm.routeName);
          },
        ),
      ),
      UnicornButton(
        hasLabel: true,
        labelText: "Add Report",
        labelBackgroundColor: Colors.black,
        labelColor: Colors.white,
        currentButton: FloatingActionButton(
          child: Icon(Icons.receipt),
          backgroundColor: Colors.green,
          heroTag: "report",
          mini: true,
          onPressed: () {
            Navigator.of(context).pushNamed(AddReport.routeName);
          },
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Container(
        child: Center(
          child: Text(listitems.elementAt(_selectedIndex)),
        ),
      ),
      floatingActionButton: UnicornDialer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
        parentButtonBackground: Colors.redAccent,
        parentButton: Icon(Icons.add),
        childButtons: _btnList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("School")),
          BottomNavigationBarItem(
              title: Text("Business"), icon: Icon(Icons.business))
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
