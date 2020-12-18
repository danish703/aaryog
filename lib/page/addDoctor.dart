import 'package:flutter/material.dart';

class AddDoctorForm extends StatefulWidget {
  static const routeName = '/createdoctor';

  @override
  _AddDoctorFormState createState() => _AddDoctorFormState();
}

class _AddDoctorFormState extends State<AddDoctorForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Doctor"),
      ),
    );
  }
}
