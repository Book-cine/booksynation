import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

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
bool fillStatus = false; //dapat false
bool initialState = true;
String fullname = patient.firstName +
    ' ' +
    patient.middleName +
    ' ' +
    patient.lastName +
    ' ' +
    ((patient.suffix == 'N/A') ? '' : patient.suffix);

final formKey = GlobalKey<FormState>();
CollectionReference userCollection =
    FirebaseFirestore.instance.collection('user');

final Stream<QuerySnapshot> users = patientCollection.snapshots();

CollectionReference patientCollection =
    FirebaseFirestore.instance.collection('patient');

class PatientProfileData {
  late bool fillStatus;

  //Profile Information
  late String uniqueId;
  late String type;
  late String firstName;
  late String middleName;
  late String lastName;
  late String suffix;
  late String sex;
  late String bday;
  late String age;
  late String civStatus;
  late String philhealth;

  //Contact Details
  late String address;
  late String region;
  late String province;
  late String city;
  late String brgy;
  late String zip;
  late String contact;
  late String email;

  //Essential Information
  late String covclass;
  late String employed;
  late String pregnant;
  late String disability;
  late String interactedCovid;
  late String isDiagnosed;
  late String diagnosedDate;
  late List<String> allergies;
  late List<String> comorbidities;
  late String otherAllergies;
  late String others;

  PatientProfileData({
    required this.fillStatus,
    required this.uniqueId,
    required this.type,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.sex,
    required this.bday,
    required this.age,
    required this.civStatus,
    required this.philhealth,
    required this.address,
    required this.region,
    required this.province,
    required this.city,
    required this.brgy,
    required this.zip,
    required this.contact,
    required this.email,
    required this.covclass,
    required this.employed,
    required this.pregnant,
    required this.disability,
    required this.interactedCovid,
    required this.isDiagnosed,
    required this.diagnosedDate,
    required this.allergies,
    required this.comorbidities,
    required this.otherAllergies,
    required this.others,
  });

  // factory PatientProfileData.fromJson(Map<String, dynamic> json) {
  //   return PatientProfileData(
  //     uniqueId: json['UID'],
  //     type: json['Type'],
  //     firstName: json['FirstName'],
  //     middleName: json['MiddleName'],
  //     lastName: json['LastName'],
  //     suffix: json['Suffix'],
  //     sex: json['Sex'],
  //     bday: json['Bday'],
  //     age: json['Age'],
  //     civStatus: json['Civil_Status'],
  //     philhealth: json['Philhealth_Num'],
  //     address: json['Address'],
  //     region: json['Region'],
  //     province: json['Province'],
  //     city: json['City'],
  //     brgy: json['Barangay'],
  //     zip: json['Zip'],
  //     contact: json['Contact_Num'],
  //     email: json['Email'],
  //     covclass: json['Cov19_Classification'],
  //     employed: json['Employment_Status'],
  //     pregnant: json['Pregnant'],
  //     disability: json['PWD'],
  //     interactedCovid: json['Covid_Interaction'],
  //     isDiagnosed: json['Diagnosed_w_Covid'],
  //     diagnosedDate: json['Diagnosed_Date'],
  //     allergies: json['Allergies'],
  //     comorbidities: json['Comorbidities'],
  //     otherAllergies: json['Other_Allergies'],
  //     others: json['Other_Comorbidities'],
  //   );

}

PatientProfileData patient = PatientProfileData(
  uniqueId: '',
  fillStatus: fillStatus,
  type: '',
  firstName: 'Juan',
  middleName: 'Alfonso',
  lastName: 'Dela Cruz',
  suffix: 'N/A',
  age: '00',
  bday: '01/01/2000',
  sex: 'Male',
  civStatus: 'Single',
  philhealth: 'N/A',
  address: 'Click to Edit',
  region: 'Select Option',
  province: 'Select Option',
  city: 'Select Option',
  brgy: 'Select Option',
  zip: '0000',
  contact: '09XXXXXXXXX',
  email: 'example@domain.com',
  covclass: 'Select Option',
  employed: 'No',
  pregnant: 'No',
  disability: 'No',
  interactedCovid: 'No',
  isDiagnosed: 'No',
  diagnosedDate: 'N/A',
  allergies: allergies,
  comorbidities: comorbidities,
  otherAllergies: 'Click to Edit',
  others: 'Click to Edit',
);

getPatientData(User? user) async {
  var coll = FirebaseFirestore.instance.collection('patient');
  await coll.doc(user!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    patient.uniqueId = value?['UID'];
    patient.fillStatus = value?['Fill_Status'];
    patient.type = value?['Type'];
    patient.firstName = value?['FirstName'];
    patient.middleName = value?['MiddleName'];
    patient.lastName = value?['LastName'];
    patient.suffix = value?['Suffix'];
    patient.sex = value?['Sex'];
    patient.age = value?['Age'];
    patient.civStatus = value?['Civil_Status'];
    patient.philhealth = value?['Philhealth_Num'];
    patient.bday = value?['Bday'];
    patient.address = value?['Address'];
    patient.region = value?['Region'];
    patient.province = value?['Province'];
    patient.city = value?['City'];
    patient.brgy = value?['Barangay'];
    patient.zip = value?['Zip'];
    patient.contact = value?['Contact_Num'];
    patient.email = value?['Email'];
    patient.covclass = value?['Cov19_Classification'];
    patient.employed = value?['Employment_Status'];
    patient.pregnant = value?['Pregnant'];
    patient.disability = value?['PWD'];
    patient.interactedCovid = value?['Covid_Interaction'];
    patient.isDiagnosed = value?['Diagnosed_w_Covid'];
    patient.diagnosedDate = value?['Diagnosed_Date'];
    patient.allergies = value?['Allergies'];
    patient.comorbidities = value?['Comorbidities'];
    patient.allergies = value?['Other_Allergies'];
    patient.comorbidities = value?['Other_Comorbidities'];
  });
}

createPatientData() async {
  patientCollection
      .doc(patient.uniqueId)
      .set({
        'UID': patient.uniqueId,
        'Fill_Status': patient.fillStatus,
        'Type': patient.type,
        'FirstName': patient.firstName,
        'MiddleName': patient.middleName,
        'LastName': patient.lastName,
        'Suffix': patient.suffix,
        'Sex': patient.sex,
        'Age': patient.age,
        'Civil_Status': patient.civStatus,
        'Philhealth_Num': patient.philhealth,
        'Bday': patient.bday,
        'Address': patient.address,
        'Region': patient.region,
        'Province': patient.province,
        'City': patient.city,
        'Barangay': patient.brgy,
        'Zip': patient.zip,
        'Contact_Num': patient.contact,
        'Email': patient.email,
        'Cov19_Classification': patient.covclass,
        'Employment_Status': patient.employed,
        'Pregnant': patient.pregnant,
        'PWD': patient.disability,
        'Covid_Interaction': patient.interactedCovid,
        'Diagnosed_w_Covid': patient.isDiagnosed,
        'Diagnosed_Date': patient.diagnosedDate,
        'Allergies': patient.allergies,
        'Comorbidities': patient.comorbidities,
        'Other_Allergies': patient.otherAllergies,
        'Other_Comorbidities': patient.others,
      })
      .then((value) => print('Add User'))
      .catchError((error) => print('Failed to add user: $error'));
}

updatePatientData() async {
  patientCollection
      .doc(patient.uniqueId)
      .update({
        'UID': patient.uniqueId,
        'Fill_Status': patient.fillStatus,
        'Type': patient.type,
        'FirstName': patient.firstName,
        'MiddleName': patient.middleName,
        'LastName': patient.lastName,
        'Suffix': patient.suffix,
        'Sex': patient.sex,
        'Age': patient.age,
        'Civil_Status': patient.civStatus,
        'Philhealth_Num': patient.philhealth,
        'Bday': patient.bday,
        'Address': patient.address,
        'Region': patient.region,
        'Province': patient.province,
        'City': patient.city,
        'Barangay': patient.brgy,
        'Zip': patient.zip,
        'Contact_Num': patient.contact,
        'Email': patient.email,
        'Cov19_Classification': patient.covclass,
        'Employment_Status': patient.employed,
        'Pregnant': patient.pregnant,
        'PWD': patient.disability,
        'Covid_Interaction': patient.interactedCovid,
        'Diagnosed_w_Covid': patient.isDiagnosed,
        'Diagnosed_Date': patient.diagnosedDate,
        'Allergies': patient.allergies,
        'Comorbidities': patient.comorbidities,
        'Other_Allergies': patient.otherAllergies,
        'Other_Comorbidities': patient.others,
      })
      .then((value) => print('Update User'))
      .catchError((error) => print('Failed to update user: $error'));
}

// Map<String, dynamic> docFields = {
//   'uid': '',
//   'type': '',
//   'firstname': '',
//   'middlename': '',
//   'lastname': '',
//   'suffix': '',
//   'age': '',
//   'bday': '',
//   'gender': '',
//   'civstatus': '',
//   'philhealth': '',
//   'currentaddress': '',
//   'region': '',
//   'province': '',
//   'city': '',
//   'brgy': '',
//   'zip': '',
//   'contact': '',
//   'email': '',
//   'covclass': '',
//   'employed': '',
//   'pregnant': '',
//   'disability': '',
//   'interactedCovid': '',
//   'diagnosed': '$diagnosed',
//   'diagnoseDate': '',
//   'otherallergies': '',
//   'others': '',
// };

//      'UID': docFields['uid'].toString(),
// 'FirstName': docFields['firstname'].toString(),
// 'MiddleName': docFields['middlename'].toString(),
// 'LastName': docFields['lastname'].toString(),
// 'Suffix': docFields['suffix'].toString(),
// 'Sex': docFields['gender'].toString(),
// 'Age': docFields['age'].toString(),
// 'Civil_Status': docFields['civstatus'].toString(),
// 'Philhealth_Num': docFields['philhealth'].toString(),
// 'Bday': docFields['bday'].toString(),
// 'Address': docFields['currentaddress'].toString(),
// 'Region': docFields['region'].toString(),
// 'Province': docFields['province'].toString(),
// 'City': docFields['city'].toString(),
// 'Barangay': docFields['brgy'].toString(),
// 'Zip': docFields['zip'].toString(),
// 'Contact_Num': docFields['contact'].toString(),
// 'Email': docFields['email'].toString(),
// 'Cov19_Classification': docFields['covclass'].toString(),
// 'Employment_Status': docFields['employed'].toString(),
// 'Pregnant': docFields['pregnant'].toString(),
// 'PWD': docFields['disability'].toString(),
// 'Covid_Interaction': docFields['interactedCovid'].toString(),
// 'Diagnosed_w_Covid': docFields['diagnosed'].toString(),
// 'Diagnosed_Date': docFields['diagnoseDate'].toString(),
// 'Allergies': allergies,
// 'Comorbidities': comorbidities,
