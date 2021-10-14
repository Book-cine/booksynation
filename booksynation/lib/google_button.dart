import 'package:booksynation/mobilemain.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/splash.dart';
import 'package:booksynation/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButtonMobile extends StatefulWidget {
  const GoogleButtonMobile({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;
  @override
  _GoogleButtonMobileState createState() =>
      _GoogleButtonMobileState(auth: auth, currentUser: currentUser);
}

class _GoogleButtonMobileState extends State<GoogleButtonMobile> {
  _GoogleButtonMobileState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;
  bool _isProcessing = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? userGoogle = _googleSignIn.currentUser;

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blueGrey, width: 3),
        ),
        color: Colors.white,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueGrey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          elevation: 0,
        ),
        onPressed: () async {
          setState(() {
            _isProcessing = true;
          });
          await _googleSignIn.signIn().then((result) {
            var gpatient = FirebaseFirestore.instance
                .collection('patient')
                .doc()
                .id
                .contains(result!.id);

            // .snapshots()
            // .where((event) => true);

            print('Gpatient exists: $gpatient');
            print('Gpatient UID: ' + result.id);
            if (result != null) {
              print('Google UID: ' + result.id);
              isGoogleUser = true;

              if (gpatient) {
                patient.uniqueId = result.id;
                patient.firstName = result.displayName!;
                patient.middleName = '';
                patient.lastName = '';
                patient.email = result.email;
                createPatientUserData(
                  result.id,
                  patient.email,
                  patient.firstName,
                  patient.lastName,
                  'google-user',
                );
                createPatientData();
              }
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => LoadScreen(
                    auth: auth,
                    currentUser: userGoogle,
                    device: 'mobile',
                  ),
                ),
              );
            }
          }).catchError((error) {
            print('Registration Error: $error');
          });
          // try {
          //   await _googleSignIn.signIn();
          //   setState(() {});
          //   print('User: $user');
          // } catch (error) {
          //   print(error);
          // }

          // if (user != null) {
          //   Navigator.of(context).pop();
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //       fullscreenDialog: true,
          //       builder: (context) => OnBoard(),
          //     ),
          //   );
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       content: Text(
          //         'Login unsuccessful.',
          //       ),
          //     ),
          //   );
          // }

          setState(() {
            _isProcessing = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: _isProcessing
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.blueGrey,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/google_logo.png"),
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
