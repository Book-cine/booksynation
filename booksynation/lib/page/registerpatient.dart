import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({Key? key}) : super(key: key);

  @override
  _RegisterPatientState createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF26A98A),
                                  fixedSize: Size(
                                    width * 0.65,
                                    height * 0.070,
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
                                    fontSize: height * 0.016,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Facebook',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.020,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Google',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.020,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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
