import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String uid = 'MvqEtaUdGVxIEsgwNVf4';
    String date = '2021-10-08';
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        drawer: SideMenu(),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(35.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.20),
                    Text(
                      'Your schedule for vaccination is set',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.035,
                      ),
                    ),
                    Text(
                      'on ' + date,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.035,
                      ),
                    ),
                    SizedBox(height: height * 0.10),
                    Image.asset('images/calendar.png'),
                    SizedBox(height: height * 0.10),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Please proceed to your vaccination site as scheduled and bring a valid ID.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Average',
                          fontSize: height * 0.024,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.020),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Don\'t forget to wear at all times your SURGICAL FACEMASK & faceshield.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Average',
                          fontSize: height * 0.024,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.10),
                    QrImage(
                      data: uid,
                      size: 300,
                      embeddedImage: AssetImage('images/Logo_BSN.png'),
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(80, 80)),
                    ),
                    SizedBox(height: height * 0.10),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width * 0.38,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFF26A98A).withOpacity(0.16),
                            blurRadius: 8,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ]),
                        child: ElevatedButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF26A98A),
                            fixedSize: Size(
                              width * 0.35,
                              height * 0.065,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                          ),
                          child: Text(
                            'BACK',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.018,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
