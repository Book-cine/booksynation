import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class WebSettings extends StatefulWidget {
  WebSettings({Key? key}) : super(key: key);

  @override
  _WebSettingsState createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  @override
  Widget build(BuildContext context) {
    final name = 'Dr. Jose Aguinaldo';
    final email = 'book-cine@gmail.com';
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;

    return Container(
      height: height,
      width: width,
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
                                  backgroundImage:
                                      AssetImage('images/nashimg.png'),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
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
        ],
      ),
    );
  }
}
