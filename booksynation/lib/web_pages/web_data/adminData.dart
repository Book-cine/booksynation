import 'package:booksynation/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminProfileData {
  late bool isGoogleUser;

  //Profile Information
  late String uniqueId;
  late String affiliation;
  late String profilePic;
  late String firstName;
  late String lastName;

  AdminProfileData({
    // required this.isGoogleUser,
    required this.uniqueId,
    required this.affiliation,
    required this.profilePic,
    required this.firstName,
    required this.lastName,
  });
}

//Initial Patient Data (placeholder)
AdminProfileData admin = AdminProfileData(
  uniqueId: '',
  affiliation: '',
  profilePic: '',
  firstName: '',
  lastName: '',
  // isGoogleUser: isGoogleUser,
);

CollectionReference adminCollection =
    FirebaseFirestore.instance.collection('admin');

createAdminData() async {
  admin.firstName = userdata.firstName;
  admin.lastName = userdata.lastName;
  adminCollection
      .doc(admin.uniqueId)
      .set({
        'UID': admin.uniqueId,
        'Affiliation': admin.affiliation,
        'ProfilePic': admin.profilePic,
        'FirstName': admin.firstName,
        'LastName': admin.lastName,
      })
      .then((value) => print('Add Admin'))
      .catchError((error) => print('Failed to add admin: $error'));
}

Future setAdminData(User? _admin) async {
  var coll = FirebaseFirestore.instance.collection('admin');
  await coll.doc(_admin!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    admin.uniqueId = value?['UID'];
    admin.affiliation = value?['Affiliation'];
    admin.profilePic = value?['ProfilePic'];
    admin.firstName = value?['FirstName'];
    admin.lastName = value?['LastName'];
  });
}

// setPatientDataGoogle(GoogleSignInAccount? user) async {
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
