import 'package:aarogya/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  Future<DocumentReference> savePatient(Patient p) {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    return _db.collection('patient').add(p.toMap());
  }
}
