import 'package:booksynation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextStyle _titleTextStyle = TextStyle(
      fontFamily: 'Antic Didone',
      fontWeight: FontWeight.bold,
      fontSize: height * 0.036,
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 95),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BookSyNation',
                    style: _titleTextStyle,
                  ),
                  SizedBox(
                    height: height * 0.10,
                  ),
                  SvgPicture.asset(
                    'images/Logo_BSN.svg',
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('National\nVaccination\nBooking System',
                      style: _titleTextStyle.copyWith(
                          color: Colors.black.withOpacity(0.6))),
                  /*
                  ),                  
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      'Vaccination',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: 'Antic Didone',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.036,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      'Booking System',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: 'Antic Didone',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.036,
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
