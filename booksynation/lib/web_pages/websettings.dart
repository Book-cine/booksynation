import 'dart:math' as math;

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:booksynation/userData.dart';
import 'package:booksynation/web_pages/web_data/adminData.dart';
import 'package:booksynation/web_pages/weblogin.dart';

class WebSettings extends StatefulWidget {
  WebSettings({Key? key}) : super(key: key);

  @override
  _WebSettingsState createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['svg', 'jpg', 'png'],
    );
    if (result == null) return;

    print('upload to firebase start!');
    var _fileBytes = result.files.first.bytes;
    setState(() {
      fileBytes = _fileBytes;
    });
  }

  Future uploadFile() async {
    Reference ref = FirebaseStorage.instance
        .ref('profilePics/${admin.uniqueId}/')
        .child('admin_image.png');
    try {
      await ref.putData(fileBytes!).then((p0) async {
        ref.getDownloadURL().then((value) {
          admin.profilePic = value;
          adminCollection
              .doc(admin.uniqueId)
              .update({
                'ProfilePic': admin.profilePic,
              })
              .then((value) => print('profile pic updated'))
              .catchError(
                  (error) => print('Failed to update profile pic: $error'));
        });
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = 'Dr. ' + admin.firstName + ' ' + admin.lastName;
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    final _formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final newpasswordController = TextEditingController();

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xFF3DDD6A).withOpacity(0.1),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: width * 0.03,
            child: Image.asset(
              'images/imagecp.png',
            ),
            // child: SvgPicture.asset(
            //   'images/webimage.svg',
            // ),
          ),
          Positioned(
              bottom: -15,
              right: width * 0.05,
              child: Transform.rotate(
                angle: -math.pi / 5.5,
                child: SvgPicture.asset(
                  'images/Logo_BSN.svg',
                  color: Colors.black.withOpacity(0.1),
                  height: height * 0.30,
                  width: width * 0.30,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Container(
                height: height * 0.75,
                width: width * 0.65,
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: Offset(3, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.035, horizontal: width * 0.025),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/Logo_BSN.svg',
                                    height: 45,
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    'BookSyNation',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Antic Didone',
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.035,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Center(
                                child: Stack(children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage: (fileBytes == null)
                                        ? (admin.profilePic ==
                                                'images/user.png')
                                            ? AssetImage(admin.profilePic)
                                            : NetworkImage(admin.profilePic)
                                                as ImageProvider
                                        : MemoryImage(fileBytes!),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          selectFile();
                                        },
                                        icon: Icon(Icons.add_a_photo,
                                            size: 15, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                              Center(
                                child: Container(
                                  child: Text(name,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xFF192A3E))),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                              TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: userdata.email,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Current Password',
                                ),
                                validator: (value) {
                                  print("Current Pass: " + userdata.password);
                                  if (value!.isEmpty ||
                                      value != userdata.password) {
                                    return 'Please input current password.';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              TextFormField(
                                controller: newpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'New Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please input new password.';
                                  } else {
                                    return null;
                                  }
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.045,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  final isValid =
                                      _formKey.currentState!.validate();
                                  if (isValid) {
                                    try {
                                      await FirebaseAuth.instance.currentUser!
                                          .updatePassword(
                                              newpasswordController.text)
                                          .then((value) {
                                        userDataCollection
                                            .doc(userdata.uniqueId)
                                            .update({
                                              'Password':
                                                  newpasswordController.text,
                                            })
                                            .then((value) =>
                                                print('Add Admin User'))
                                            .catchError((error) => print(
                                                'Failed to add Admin user: $error'));
                                        uploadFile();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Saving Changes, Please reauthenticate.',
                                            ),
                                          ),
                                        );
                                        Future.delayed(
                                            const Duration(seconds: 3), () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WebLogin(key: null),
                                            ),
                                          );
                                        });
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      print(e);
                                      if (e.code == 'weak-password') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Password is too weak.',
                                            ),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
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
                                  primary: Color(0xFF26A98A),
                                  fixedSize: Size(
                                    width * 0.28,
                                    height * 0.045,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
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
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
