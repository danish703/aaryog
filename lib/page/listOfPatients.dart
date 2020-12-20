import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ListOfPatients extends StatefulWidget {
  @override
  _ListOfPatientsState createState() => _ListOfPatientsState();
}

class _ListOfPatientsState extends State<ListOfPatients> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Patients"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('patient').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (!snapshots.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return ListView(
              children: snapshots.data.docs.map((DocumentSnapshot doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['firstName'] + " " + doc['lastName']),
                    subtitle: Text(doc['dob']),
                    trailing: Text(doc.id),
                    onTap: () {},
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
