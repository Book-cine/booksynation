import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('user');

class UserData {
  late bool isGoogleUser;

  //Profile Information
  late String uniqueId;
  late String email;
  late String firstName;
  late String lastName;
  late String password;
  late String type;

  UserData({
    // required this.isGoogleUser,
    required this.uniqueId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.type,
  });
}

//Initial Patient Data (placeholder)
UserData userdata = UserData(
  uniqueId: '',
  email: '',
  firstName: '',
  lastName: '',
  password: '',
  type: '',
  // isGoogleUser: isGoogleUser,
);

createPatientUserData(
  String uid,
  String email,
  String firstName,
  String lastName,
  String password,
) async {
  userdata.uniqueId = uid;
  userdata.email = email;
  userdata.firstName = firstName;
  userdata.lastName = lastName;
  userdata.password = password;
  userdata.type = 'patient';

  userCollection
      .doc(userdata.uniqueId)
      .set({
        'UID': userdata.uniqueId,
        'Email': userdata.email,
        'FirstName': userdata.firstName,
        'LastName': userdata.lastName,
        'password': userdata.password,
        'Type': userdata.type,
      })
      .then((value) => print('Add Patient User'))
      .catchError((error) => print('Failed to add Patient user: $error'));
}

Future setPatientUserData(User? _patient) async {
  var coll = FirebaseFirestore.instance.collection('user');
  await coll.doc(_patient!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    userdata.uniqueId = value?['UID'];
    userdata.email = value?['Email'];
    userdata.firstName = value?['FirstName'];
    userdata.lastName = value?['LastName'];
    userdata.password = value?['Password'];
    userdata.type = value?['Type'];
  });
}

createAdminUserData(
  String uid,
  String email,
  String firstName,
  String lastName,
  String password,
) async {
  userdata.uniqueId = uid;
  userdata.email = email;
  userdata.firstName = firstName;
  userdata.lastName = lastName;
  userdata.password = password;
  userdata.type = 'admin';

  userCollection
      .doc(userdata.uniqueId)
      .set({
        'UID': userdata.uniqueId,
        'Email': userdata.email,
        'FirstName': userdata.firstName,
        'LastName': userdata.lastName,
        'Password': userdata.password,
        'Type': userdata.type,
      })
      .then((value) => print('Add Admin User'))
      .catchError((error) => print('Failed to add Admin user: $error'));
}

Future setAdminUserData(User? _admin) async {
  var coll = FirebaseFirestore.instance.collection('user');
  await coll.doc(_admin!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    userdata.uniqueId = value?['UID'];
    userdata.email = value?['Email'];
    userdata.firstName = value?['FirstName'];
    userdata.lastName = value?['LastName'];
    userdata.password = value?['Password'];
    userdata.type = value?['Type'];
  });
}

// getPatientDataGoogle(GoogleSignInAccount? user) async {
//   var coll = FirebaseFirestore.instance.collection('patient');
//   await coll.doc(user!.id).get().then((result) {
//     Map<String, dynamic>? value = result.data();
//     patient.uniqueId = value?['UID'];
//     patient.isGoogleUser = value?['Google_User'];
//     patient.fillStatus = value?['Fill_Status'];
//     patient.type = value?['Type'];
//     patient.firstName = value?['FirstName'];
//     patient.middleName = value?['MiddleName'];
//     patient.lastName = value?['LastName'];
//     patient.suffix = value?['Suffix'];
//     patient.sex = value?['Sex'];
//     patient.age = value?['Age'];
//     patient.civStatus = value?['Civil_Status'];
//     patient.philhealth = value?['Philhealth_Num'];
//     patient.bday = value?['Bday'];
//     patient.address = value?['Address'];
//     patient.region = value?['Region'];
//     patient.province = value?['Province'];
//     patient.city = value?['City'];
//     patient.brgy = value?['Barangay'];
//     patient.zip = value?['Zip'];
//     patient.contact = value?['Contact_Num'];
//     patient.email = value?['Email'];
//     patient.covclass = value?['Cov19_Classification'];
//     patient.employed = value?['Employment_Status'];
//     patient.pregnant = value?['Pregnant'];
//     patient.disability = value?['PWD'];
//     patient.interactedCovid = value?['Covid_Interaction'];
//     patient.isDiagnosed = value?['Diagnosed_w_Covid'];
//     patient.diagnosedDate = value?['Diagnosed_Date'];
//     patient.allergies = value?['Allergies'];
//     patient.comorbidities = value?['Comorbidities'];
//     patient.allergies = value?['Other_Allergies'];
//     patient.comorbidities = value?['Other_Comorbidities'];
//   });
// }
