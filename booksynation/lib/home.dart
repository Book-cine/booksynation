import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/registerpatient.dart';
import 'package:booksynation/page/resetpass.dart';
import 'package:booksynation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Color(0xFF3DDD6A).withOpacity(0.10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/Logo_BSN.svg',
                      height: height * 0.1,
                      width: width * 0.1,
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
                        fontSize: height * 0.041,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.48,
                  width: width * 0.85,
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 0.95,
                    child: Container(
                      padding: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            offset: Offset(3, 4), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            offset: Offset(3, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.015,
                              ),
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Username',
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await auth
                                        .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                        .then((result) {
                                      User? user = auth.currentUser;
                                      patient.uniqueId = user!.uid;
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) => LoadScreen(
                                            auth: auth,
                                            currentUser: user,
                                            device: 'mobile',
                                          ),
                                        ),
                                      );
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'No user found for that email.',
                                          ),
                                        ),
                                      );
                                    } else if (e.code == 'wrong-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Wrong password provided for that user.',
                                          ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Login Error',
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF26A98A),
                                  fixedSize: Size(
                                    width * 0.45,
                                    height * 0.060,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                                child: Text(
                                  'Log In',
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
                                height: height * 0.025,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPatient(
                                              auth: auth,
                                              currentUser: auth.currentUser,
                                            )),
                                  );
                                },
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: Color(0xFF146955),
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.017,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword(
                                              auth: auth,
                                              currentUser: auth.currentUser,
                                            )),
                                  );
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: Color(0xFF146955),
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.017,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
