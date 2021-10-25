import 'dart:io';

import 'package:booksynation/main.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PatientSettings extends StatefulWidget {
  const PatientSettings({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  State<PatientSettings> createState() => _PatientSettingsState();
}

class _PatientSettingsState extends State<PatientSettings> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future uploadFile() async {
    try {
      await FirebaseStorage.instance
          .ref('profilePics/${patient.uniqueId}/patient_image.png')
          .putFile(image!)
          .then((imageRes) async {
        await FirebaseStorage.instance
            .ref('profilePics/${patient.uniqueId}/')
            .child('patient_image.png')
            .getDownloadURL()
            .then((value) {
          patient.profilePic = value;
          patientCollection
              .doc(patient.uniqueId)
              .update({
                'ProfilePic': patient.profilePic,
              })
              .then((value) => print('profile pic updated'))
              .catchError(
                  (error) => print('Failed to update profile pic: $error'));
        });
      });
    } on FirebaseException catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final newpasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Account Information',
                          style: TextStyle(
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: height * 0.020),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          backgroundImage: image == null
                              ? (patient.profilePic == 'images/user.png')
                                  ? AssetImage(patient.profilePic)
                                  : NetworkImage(patient.profilePic)
                                      as ImageProvider
                              : FileImage(image!),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImage();
                              },
                              icon: Icon(Icons.add_a_photo, color: Colors.grey),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: height * 0.020),
                      Center(
                        child: Container(
                          child: Text(fullname,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFF192A3E))),
                        ),
                      ),
                      SizedBox(height: height * 0.020),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Email',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: patient.email,
                        ),
                      ),
                      SizedBox(height: height * 0.020),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Current Password',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty || value != userdata.password) {
                            return 'Please input current password.';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: height * 0.020),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('New Password',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      TextFormField(
                        controller: newpasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input new password.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width * 0.65,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFF1D74E9).withOpacity(0.16),
                          blurRadius: 8,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () async {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            try {
                              await widget.auth.currentUser!
                                  .updatePassword(newpasswordController.text)
                                  .then((value) {
                                userDataCollection
                                    .doc(userdata.uniqueId)
                                    .update({
                                      'password': newpasswordController.text,
                                    })
                                    .then((value) => print('Add Admin User'))
                                    .catchError((error) => print(
                                        'Failed to add Admin user: $error'));
                                uploadFile();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Saving Changes, Please reauthenticate.',
                                    ),
                                  ),
                                );
                                Future.delayed(const Duration(seconds: 3), () {
                                  widget.auth.signOut();
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => App()),
                                  );
                                });
                              });
                            } on FirebaseAuthException catch (e) {
                              print(e);
                              if (e.code == 'weak-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Password is too weak.',
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Password update unsuccessful.',
                                    ),
                                  ),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please review the fields before submitting.',
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                          fixedSize: Size(
                            width * 0.65,
                            height * 0.060,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.018,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
