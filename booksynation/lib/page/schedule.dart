import 'package:booksynation/sidemenu.dart';
import 'package:booksynation/strings.dart';
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

    final TextStyle _normalTextStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Average',
      fontWeight: FontWeight.bold,
      fontSize: height * 0.035,
    );

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
              padding: EdgeInsets.fromLTRB(
                  width * 0.08, height * 0.02, width * 0.08, height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.20),
                    Text(
                      scheduleText1 + date,
                      textAlign: TextAlign.center,
                      style: _normalTextStyle.copyWith(
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.bold),
                    ),
                    /*
                    Text(
                      'on ' + date,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.035,
                      ),
                    ), */
                    SizedBox(height: height * 0.10),
                    Image.asset('images/calendar.png'),
                    SizedBox(height: height * 0.10),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(scheduleText2,
                          textAlign: TextAlign.justify,
                          style: _normalTextStyle),
                    ),
                    SizedBox(height: height * 0.020),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        scheduleText3,
                        textAlign: TextAlign.justify,
                        style: _normalTextStyle,
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
                            btnTextBack,
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
