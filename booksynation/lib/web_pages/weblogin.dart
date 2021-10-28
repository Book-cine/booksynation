import 'package:booksynation/home.dart';
import 'package:booksynation/splash.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/web_pages/web_data/adminData.dart';
import 'package:booksynation/web_pages/webregister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math' as math;

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  _WebLoginState createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _passwordVisible = false;
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
                width: width * 0.75,
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
                    padding: EdgeInsets.only(
                        top: height * 0.05,
                        bottom: height * 0.025,
                        left: width * 0.015,
                        right: width * 0.015),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'images/Logo_BSN.svg',
                                  height: height * 0.1,
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  appName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Antic Didone',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.02,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  logInWebText,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.024,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  enterEmailPassText,
                                  style: TextStyle(
                                    color: Color(0xFF9FA2B4),
                                    fontFamily: 'Mulish',
                                    fontSize: height * 0.014,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  emailText,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.015,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: emailAddRegLabel,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.025,
                                ),
                                Text(
                                  passwordText.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.012,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: passwordText,
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
                                  height: height * 0.03,
                                ),
                              ],
                            ),
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
                                    admin.uniqueId = user!.uid;
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => LoadScreen(
                                          auth: auth,
                                          currentUser: user,
                                          device: 'web',
                                        ),
                                      ),
                                    );
                                  });
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          noUserSnackbar,
                                        ),
                                      ),
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          wrongPassSnackbar,
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          loginErrorSnackbar,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF26A98A),
                                fixedSize: Size(
                                  width * 0.30,
                                  height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                loginText,
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
                              height: height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  noAccountText,
                                  style: TextStyle(
                                    color: Color(0xFF9FA2B4),
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.normal,
                                    fontSize: height * 0.014,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebRegister(
                                              auth: auth,
                                              currentUser: auth.currentUser)),
                                    );
                                  },
                                  child: Text(
                                    signUpText,
                                    style: TextStyle(
                                      color: Color(0xFF146955),
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.014,
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
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        },
        icon: Icon(Icons.web),
      ),
    );
  }
}
