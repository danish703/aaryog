import 'package:aarogya/models/patient.dart';
import 'package:aarogya/page/doctordetails.dart';
import 'package:aarogya/services/firebaseservice.dart';
import 'package:aarogya/services/randomid.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddPatientForm extends StatefulWidget {
  static const routeName = '/addPatient';
  @override
  _AddPatientFormState createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  TextEditingController _fistNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  FireStoreServices _fireStoreServices = new FireStoreServices();
  final _formKey = GlobalKey<FormState>();
  DateTime dob;
  ProgressDialog pr;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  String empltyValidatorCheck(value) {
    if (value.isEmpty) {
      return "Please enter this filed";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Patient"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fistNameController,
                keyboardType: TextInputType.text,
                validator: empltyValidatorCheck,
                decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _lastNameController,
                keyboardType: TextInputType.text,
                validator: empltyValidatorCheck,
                decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                validator: empltyValidatorCheck,
                decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              DateTimeField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Date of Birth"),
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: DateTime.now().add(Duration(days: -1)),
                      lastDate: DateTime.now().add(Duration(days: 1)));
                  setState(() {
                    dob = date;
                  });
                  return date;
                  // if (date != null) {
                  //   final time = await showTimePicker(
                  //       context: context,
                  //       initialTime: TimeOfDay.fromDateTime(
                  //         DateTime.now(),
                  //       ));
                  //   return DateTimeField.combine(date, time);
                }
                //return currentValue;
                //},,
                ,
                onSaved: (value) {},
              ),
              FlatButton(
                  color: Colors.red,
                  child: Text("Save"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print("this method was called");
                      Patient p = new Patient(
                          id: generateId(),
                          firstName: _fistNameController.text,
                          lastName: _lastNameController.text,
                          dateOfBirth: dob.toIso8601String(),
                          address: _addressController.text);
                      pr.show();
                      await Firebase.initializeApp().then((value) {
                        _fireStoreServices.savePatient(p);
                      });
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        pr.hide();
                        Navigator.of(context).pushNamed(DoctorDetails.routeName,
                            arguments: "Ram kumar");
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
