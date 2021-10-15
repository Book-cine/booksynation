import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/splash.dart';
import 'package:booksynation/userData.dart';
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

  @override
  Widget build(BuildContext context) {
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
          try {
            UserCredential result = await signInWithGoogle(auth);
            User user = result.user!;

            if (result.additionalUserInfo!.isNewUser) {
              //store to local data
              patient.uniqueId = user.uid;
              patient.firstName = user.displayName!;
              patient.middleName = '';
              patient.lastName = '';
              patient.email = user.email!;
              //create firebase data for user
              createPatientUserData(
                patient.uniqueId,
                patient.email,
                patient.firstName,
                patient.lastName,
                'google-user',
              );
              //create firebase data for patient
              createPatientData();
            }
            // imageProfile = user.photoURL!; not yet working (AssetImage & NetworkImage)
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => LoadScreen(
                  auth: auth,
                  currentUser: user,
                  device: 'mobile',
                ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Login unsuccessful.',
                ),
              ),
            );
          }
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

Future<UserCredential> signInWithGoogle(authInstance) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await authInstance.signInWithCredential(credential);
}
