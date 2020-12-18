import 'package:flutter/material.dart';

class DoctorDetails extends StatelessWidget {
  static const routeName = '/doctordetails';
  @override
  Widget build(BuildContext context) {
    final String doctorName =
        ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Container(
        child: Text(
          doctorName,
          textScaleFactor: 2.0,
        ),
      ),
    );
  }
}
