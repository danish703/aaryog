import 'dart:io';

import 'package:aarogya/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreServices {
  FireStoreServices() {
    Firebase.initializeApp();
  }

  Future<DocumentReference> savePatient(Patient p) {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    return _db.collection('patient').add(p.toMap());
  }

  String uploadReport(File _image) {
    String imageName = DateTime.now().toString() + ".jpg";
    Reference ref =
        FirebaseStorage.instance.ref().child('report/').child('abc.jpg');
    UploadTask u = ref.putFile(File(_image.path));
    return imageName;
  }

  Future<String> downloadLink(String imageName) async {
    String downloadURL = await FirebaseStorage.instance
        .ref('report/')
        .child('abc.jpg')
        .getDownloadURL();
    return downloadURL;
  }

  Stream<DocumentSnapshot> getPatientDetails(String id) {
    return FirebaseFirestore.instance.collection('patient').doc(id).snapshots();
  }

  Stream<QuerySnapshot> getAllPatient() {
    Firebase.initializeApp();
    return FirebaseFirestore.instance.collection('patient').snapshots();
  }
}
