import 'package:aarogya/page/doctordetails.dart';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  String doctorName;
  Doctor(this.doctorName);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DoctorDetails.routeName, arguments: doctorName);
        },
        leading: Container(
          child: Center(
            child: Text(
              doctorName.substring(0, 2),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(50)),
        ),
        title: Text(
          doctorName,
          textScaleFactor: 1.3,
        ),
        subtitle: Text("Senior Doctor"),
        trailing: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
