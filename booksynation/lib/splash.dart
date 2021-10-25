import 'package:booksynation/home.dart';
import 'package:booksynation/mobilemain.dart';
import 'package:booksynation/page/onboarding.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/userData.dart';
import 'package:booksynation/web_pages/web_data/adminData.dart';
import 'package:booksynation/web_pages/web_data/assign_vaccine.dart';
import 'package:booksynation/web_pages/webmain.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class LoadScreen extends StatefulWidget {
  const LoadScreen({
    Key? key,
    required this.auth,
    @required this.device,
    @required this.currentUser,
  }) : super(key: key);
  final device;
  final FirebaseAuth auth;
  final currentUser;
  @override
  _LoadScreenState createState() =>
      _LoadScreenState(auth: auth, currentUser: currentUser);
}

class _LoadScreenState extends State<LoadScreen> {
  _LoadScreenState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;

  @override
  void initState() {
    super.initState();
    _navigatetonext();
  }

  _navigatetonext() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => (widget.device == 'web')
                ? WebMain(auth: auth, currentUser: currentUser)
                : MobileMain(auth: auth, currentUser: currentUser)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 0), () async {
      //sign in and set data.then
      if (widget.device == 'web') {
        getAdminUserData(widget.currentUser).then((value) {
          getAdminData(widget.currentUser).then((value) {
            _navigatetonext();
          });
        });
      } else {
        getPatientUserData(widget.currentUser).then((value) =>
            getScheduleFirebase(widget.currentUser)
                .then(getPatientData(widget.currentUser).then((value) {
              _navigatetonext();
            })));
      }
    });

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 95),
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'images/Logo_BSN.svg',
                    width: width * 0.15,
                    height: height * 0.15,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: width * 0.25,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.greenAccent.withOpacity(0.5),
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
    );
  }
}
