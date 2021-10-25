import 'package:booksynation/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminProfileData {
  //Profile Information
  late String uniqueId;
  late String affiliation;
  late String profilePic;
  late String firstName;
  late String lastName;
  late String email;

  AdminProfileData({
    // required this.isGoogleUser,
    required this.uniqueId,
    required this.affiliation,
    required this.profilePic,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

//Initial Patient Data (placeholder)
AdminProfileData admin = AdminProfileData(
  uniqueId: '',
  affiliation: '',
  profilePic: 'images/user.png',
  firstName: '',
  lastName: '',
  email: '',
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
        'Email': admin.email,
      })
      .then((value) => print('Add Admin'))
      .catchError((error) => print('Failed to add admin: $error'));
}

Future getAdminData(User? _admin) async {
  var coll = FirebaseFirestore.instance.collection('admin');
  await coll.doc(_admin!.uid).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    admin.uniqueId = value?['UID'];
    admin.affiliation = value?['Affiliation'];
    admin.profilePic = value?['ProfilePic'];
    admin.firstName = value?['FirstName'];
    admin.lastName = value?['LastName'];
    admin.email = value?['Email'];

    await FirebaseStorage.instance
        .ref('profilePics/${userdata.uniqueId}/${admin.profilePic}')
        .getDownloadURL()
        .then((value) {
      admin.profilePic = value;
      print("Link Image: " + admin.profilePic);
    }).catchError((error) => null);
  });
}
