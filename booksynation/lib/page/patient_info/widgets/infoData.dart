import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

// getPatientData(User? user) async {
//   Stream documentStream =
//       FirebaseFirestore.instance.collection('user').doc(user!.uid).snapshots();
// }

// class UserInformation extends StatefulWidget {
//   @override
//   _UserInformationState createState() => _UserInformationState();
// }

// class _UserInformationState extends State<UserInformation> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('users').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['full_name']),
//               subtitle: Text(data['company']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }

class PatientProfileData {
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
}

PatientProfileData patient = PatientProfileData(
  uniqueId: '',
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

createPatientData() async {
  userCollection
      .doc(patient.uniqueId)
      .set({
        'UID': patient.uniqueId,
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
      })
      .then((value) => print('Add User'))
      .catchError((error) => print('Failed to add user: $error'));
}

updatePatientData() async {
  userCollection
      .doc(patient.uniqueId)
      .update({
        'UID': patient.uniqueId,
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
