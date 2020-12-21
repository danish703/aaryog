import 'package:aarogya/services/firebaseservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  static const routeName = '/patientdetails';
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  FireStoreServices _fireStoreServices = FireStoreServices();
  @override
  Widget build(BuildContext context) {
    final String patientId =
        ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Details"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: _fireStoreServices.getPatientDetails(patientId),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data['firstName']),
                      ),
                    ),
                  ),
                  Text("DOB:${snapshot.data['dob']}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                              onPressed: () {},
                              color: Colors.redAccent,
                              child: Text(
                                "View reports",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: FlatButton(
                              onPressed: () {},
                              color: Colors.redAccent,
                              child: Text(
                                "Consult with Doctor",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: FlatButton(
                              onPressed: () {},
                              color: Colors.redAccent,
                              child: Text(
                                "Take appointment",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                      children: [
                        Text("Medicine list. \n 1. abc \n 2.xyz \n 3.abc"),
                        Text("Medicine list. \n 1. abc \n 2.xyz \n 3.abc"),
                        Text("Medicine list. \n 1. abc \n 2.xyz \n 3.abc"),
                        Text("Medicine list. \n 1. abc \n 2.xyz \n 3.abc"),
                        Text("Medicine list. \n 1. abc \n 2.xyz \n 3.abc"),
                      ],
                    )),
                  )
                ],
              ),
            );
          }),
    );
  }
}
