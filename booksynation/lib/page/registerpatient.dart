import 'package:booksynation/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({Key? key}) : super(key: key);

  @override
  _RegisterPatientState createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  height: height * 0.70,
                  width: width * 0.85,
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 25.0,
                      ),
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
                      child: SingleChildScrollView(
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
                                    Text('Create Account'),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Email Address',
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                TextField(
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
                                TextField(
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
                                TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Confirm Password',
                                  ),
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
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF26A98A),
                                    fixedSize: Size(
                                      width * 0.55,
                                      height * 0.065,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
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
                                GoogleButtonMobile(),
                              ],
                            ),
                          ],
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
