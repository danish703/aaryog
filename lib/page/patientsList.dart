import 'package:aarogya/page/patientDetails.dart';
import 'package:aarogya/services/firebaseservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientList extends StatefulWidget {
  static const routeName = '/patientList';
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  FireStoreServices _fireStoreServices = new FireStoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient List"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStoreServices.getAllPatient(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (!snapshots.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
          return ListView(
            children: snapshots.data.docs.map((DocumentSnapshot d) {
              return ListTile(
                title: Text(d['firstName'] + " " + d['lastName']),
                subtitle: Text(d['dob']),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(PatientDetails.routeName, arguments: d.id);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
