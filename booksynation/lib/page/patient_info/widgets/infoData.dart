import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Map<String, String> docFields = {
  'uid': '',
  'firstname': '',
  'middlename': '',
  'lastname': '',
  'suffix': '',
  'age': '',
  'bday': '',
  'gender': '',
  'civstatus': '',
  'philhealth': '',
  'currentaddress': '',
  'region': '',
  'province': '',
  'city': '',
  'brgy': '',
  'zip': '',
  'contact': '',
  'email': '',
  'covclass': '',
  'employed': '',
  'pregnant': '',
  'disability': '',
  'interactedCovid': '',
  'diagnosed': '$diagnosed',
  'diagnoseDate': '',
  'otherallergies': '',
  'others': '',
};

List<String> allergies = [];

List<String> comorbidities = [];

List<String> gender = [
  "Male",
  "Female",
];
List<String> civstatus = [
  "Single",
  "Married",
];

List<String> yesOrNo = [
  "Yes",
  "No",
];

List<String> covclass = [
  "A1",
  "A2",
  "A3",
  "A4",
  "A5",
];

List<String> region = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
];

List<String> province = [
  "Abra",
  "Agusan del Norte",
  "Agusan del Sur",
  "Aklan",
  "Cebu",
];

List<String> city = [
  "Cebu City",
  "Mandaue City",
  "Carcar City",
];

List<String> brgy = [
  "Pardo",
  "Ramos",
  "Tayud",
  "Cabangcalan",
];

DateTime? birthDate;
DateTime? diagnosedDate;

bool diagnosed = false;
bool initialState = true;

final formKey = GlobalKey<FormState>();
CollectionReference userCollection =
    FirebaseFirestore.instance.collection('user');

final Stream<QuerySnapshot> users = userCollection.snapshots();
