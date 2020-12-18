import 'package:aarogya/widget/doctor.dart';
import 'package:flutter/material.dart';

class StateFulDemo extends StatefulWidget {
  @override
  _StateFulDemoState createState() => _StateFulDemoState();
}

class _StateFulDemoState extends State<StateFulDemo> {
  List<String> doctorName = [];
  String name;
  TextEditingController _nameController = TextEditingController();

  Future<void> _showMyDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Doctor"),
            content: Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Dr. Rk"),
                controller: _nameController,
              ),
            ),
            actions: [
              MaterialButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                child: Text("Save"),
                onPressed: () {
                  setState(() {
                    doctorName.add(_nameController.text.toString());
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // Future<void> sum(){
  //    return show
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull demo"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int i) {
          return Doctor(doctorName[i]);
        },
        itemCount: doctorName.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showMyDialog();
        },
      ),
    );
  }
}
