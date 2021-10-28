import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/splash.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/userData.dart';
import 'package:booksynation/web_pages/web_data/adminData.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithGoogle(authInstance) async {
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  // Once signed in, return the UserCredential
  return await authInstance.signInWithPopup(googleProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}

class GoogleButtonWeb extends StatefulWidget {
  const GoogleButtonWeb({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;
  @override
  _GoogleButtonWebState createState() =>
      _GoogleButtonWebState(auth: auth, currentUser: currentUser);
}

class _GoogleButtonWebState extends State<GoogleButtonWeb> {
  _GoogleButtonWebState({
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
            //store to local data
            admin.uniqueId = user.uid;
            admin.firstName = user.displayName!;
            admin.lastName = '';
            admin.email = user.email!;
            admin.profilePic = user.photoURL!;

            if (result.additionalUserInfo!.isNewUser) {
              isGoogleUser = true;
              //create firebase data for user
              createAdminUserData(
                admin.uniqueId,
                admin.email,
                admin.firstName,
                admin.lastName,
                'google-user',
              );
              //create firebase data for patient
              createAdminData();
              isGoogleUser = false;
            }
            // imageProfile = user.photoURL!; not yet working (AssetImage & NetworkImage)
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => LoadScreen(
                  auth: auth,
                  currentUser: user,
                  device: 'web',
                ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  loginFailedText,
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
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        continueGoogleText,
                        style: TextStyle(
                          fontSize: 20,
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
