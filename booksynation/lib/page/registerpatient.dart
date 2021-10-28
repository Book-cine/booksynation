import 'package:booksynation/google_button.dart';
import 'package:booksynation/home.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  _RegisterPatientState createState() => _RegisterPatientState(
        auth: auth,
        currentUser: currentUser,
      );
}

class _RegisterPatientState extends State<RegisterPatient> {
  _RegisterPatientState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3DDD6A).withOpacity(0.10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/Logo_BSN.svg',
                      height: height * 0.1,
                      width: width * 0.1,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      height: height * 0.70,
                      alignment: Alignment.center,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 5,
                                offset:
                                    Offset(3, 4), // changes position of shadow
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 5,
                                offset:
                                    Offset(3, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () => Navigator.pop(context),
                                          child: Icon(Icons.arrow_back),
                                        ),
                                        SizedBox(
                                          width: width * 0.025,
                                        ),
                                        Text(createAccText),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.030,
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black,
                                        ),
                                        labelText: emailAddRegLabel,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    TextFormField(
                                      controller: firstNameController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.person_outline_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'First Name',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    TextFormField(
                                      controller: lastNameController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Last Name',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    TextFormField(
                                      controller: cpasswordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'Confirm Password',
                                      ),
                                      validator: (value) {
                                        if (value != passwordController.text) {
                                          return 'Wrong password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                  ],
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
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            )
                                                .then((result) {
                                              if (isValid) {
                                                if (result.additionalUserInfo!
                                                    .isNewUser) {
                                                  patient.uniqueId =
                                                      result.user!.uid;
                                                  patient.firstName =
                                                      firstNameController.text;
                                                  patient.lastName =
                                                      lastNameController.text;
                                                  patient.email =
                                                      emailController.text;
                                                  createPatientUserData(
                                                    result.user!.uid,
                                                    emailController.text,
                                                    firstNameController.text,
                                                    lastNameController.text,
                                                    passwordController.text,
                                                  );
                                                  createPatientData();

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        regSuccessSnackbar,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    fullscreenDialog: true,
                                                    builder: (context) =>
                                                        Homepage(),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      regFailedSnackbar,
                                                    ),
                                                  ),
                                                );
                                              }
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            print(e);
                                            if (e.code ==
                                                'email-already-in-use') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    emailInUseSnackbar,
                                                  ),
                                                ),
                                              );
                                            } else if (e.code ==
                                                'invalid-email') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    invalidEmailSnackbar,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    regErrorSnackbar,
                                                  ),
                                                ),
                                              );
                                            }
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF26A98A),
                                        fixedSize: Size(
                                          width * 0.55,
                                          height * 0.065,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                      child: Text(
                                        btnTextRegister,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: height * 0.018,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.030,
                                    ),
                                    GoogleButtonMobile(
                                      auth: auth,
                                      currentUser: currentUser,
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
                SizedBox(
                  height: height * 0.10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
