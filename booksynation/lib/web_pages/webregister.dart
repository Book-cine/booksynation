import 'package:booksynation/google_button_web.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:booksynation/web_pages/weblogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class WebRegister extends StatefulWidget {
  const WebRegister({Key? key}) : super(key: key);

  @override
  _WebRegisterState createState() => _WebRegisterState();
}

class _WebRegisterState extends State<WebRegister> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF3DDD6A).withOpacity(0.10),
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
              child: Container(
                height: height * 0.65,
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
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                        .then((result) {
                                      if (result != null) {
                                        if (result
                                            .additionalUserInfo!.isNewUser) {
                                          patient.uniqueId = result.user!.uid;
                                          userCollection
                                              .doc(patient.uniqueId)
                                              .set({
                                            'UID': patient.uniqueId,
                                            'type': 'Admin',
                                          });
                                        }
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) => WebLogin(),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Registration unsuccessful.',
                                            ),
                                          ),
                                        );
                                      }
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(e);
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
                              GoogleButtonWeb(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
