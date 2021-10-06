import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Map<String, String> docFields = {
  'firstname': '',
  'middlename': '',
  'lastname': '',
  'suffix': '',
  'age': '',
  'bday': '',
  'gender': '',
  'civstatus': '',
  'philhealth': '',
  'covclass': '',
  'diagnoseDate': '',
};

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

DateTime? date;

bool diagnosed = false;

final formKey = GlobalKey<FormState>();
CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');
final Stream<QuerySnapshot> users =
    FirebaseFirestore.instance.collection('users').snapshots();
