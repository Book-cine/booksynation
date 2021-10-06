import 'package:cloud_firestore/cloud_firestore.dart';

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

DateTime? date;

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');
final Stream<QuerySnapshot> users =
    FirebaseFirestore.instance.collection('users').snapshots();
