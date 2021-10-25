import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference userDataCollection =
    FirebaseFirestore.instance.collection('user');

Uint8List? fileBytes;

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

  userDataCollection
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

Future getPatientUserData(User? _patient) async {
  var coll = FirebaseFirestore.instance.collection('user');
  await coll.doc(_patient!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    userdata.uniqueId = value?['UID'];
    userdata.email = value?['Email'];
    userdata.firstName = value?['FirstName'];
    userdata.lastName = value?['LastName'];
    userdata.password = value?['password'];
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

  userDataCollection
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

Future getAdminUserData(User? _admin) async {
  var coll = FirebaseFirestore.instance.collection('user');
  await coll.doc(_admin!.uid).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    userdata.uniqueId = value?['UID'];
    userdata.email = value?['Email'];
    userdata.firstName = value?['FirstName'];
    userdata.lastName = value?['LastName'];
    userdata.password = value?['Password'];
    userdata.type = value?['Type'];
  });
}
