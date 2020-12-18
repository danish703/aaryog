import 'package:aarogya/page/addDoctor.dart';
import 'package:aarogya/page/addPatientform.dart';
import 'package:aarogya/page/addReport.dart';
import 'package:aarogya/page/doctordetails.dart';
import 'package:aarogya/page/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    routes: {
      AddPatientForm.routeName: (ctx) => AddPatientForm(),
      DoctorDetails.routeName: (ctx) => DoctorDetails(),
      AddDoctorForm.routeName: (ctx) => AddDoctorForm(),
      AddReport.routeName: (ctx) => AddReport(),
    },
  ));
}
