import 'package:booksynation/page/appointment.dart';
import 'package:booksynation/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HealthDeclaration extends StatefulWidget {
  const HealthDeclaration({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  State<HealthDeclaration> createState() =>
      _HealthDeclarationState(auth: auth, currentUser: currentUser);
}

class _HealthDeclarationState extends State<HealthDeclaration> {
  _HealthDeclarationState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;
  bool _consent = false;
  bool _confirm = false;
  void goToAppointment(context) => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyAppointment(
          auth: auth,
          currentUser: currentUser,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: height * 0.0023);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );

    PageDecoration pageDecoration = PageDecoration(
        titleTextStyle: _normalTextStyle.copyWith(
            fontSize: height * 0.028, fontWeight: FontWeight.bold),
        bodyTextStyle: _normalTextStyle,
        titlePadding: EdgeInsets.fromLTRB(
            width * 0.08, height * 0.02, width * 0.08, height * 0.02),
        descriptionPadding:
            EdgeInsets.only(left: width * 0.005, right: width * 0.025),
        imagePadding: EdgeInsets.zero,
        pageColor: Colors.white);

    DotsDecorator dotsDecoration = DotsDecorator(
      color: Color(0xFFBDBDBD),
      activeColor: Color(0xFF26A98A),
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: [
        PageViewModel(
          title: healthDecTitle1,
          bodyWidget: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _consent,
                activeColor: Color(0xFF26A98A),
                onChanged: (value) {
                  setState(() => _consent = value!);
                },
              ),
              Container(
                padding: EdgeInsets.zero,
                width: width * 0.7,
                child: Text(
                  healthDecDescription1,
                  textAlign: TextAlign.justify,
                  style: _normalTextStyle,
                ),
              ),
            ],
          ),
          image: Image.asset(
            'images/vaxinfoimg1.png',
            scale: 1.5,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: healthDecTitle2,
          useScrollView: false,
          bodyWidget: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _confirm,
                activeColor: Color(0xFF26A98A),
                onChanged: (value) {
                  setState(() => _confirm = value!);
                },
              ),
              Expanded(
                child: Text(
                  healthDecDescription2,
                  textAlign: TextAlign.justify,
                  style: _normalTextStyle,
                ),
              ),
            ],
          ),
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              elevation: 15,
              child: Image.asset(
                'images/healthdecimg1.png',
              ),
            ),
          ),
          footer: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF26A98A),
                  fixedSize: Size(width * 0.40, height * 0.065),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
              onPressed: _confirm ? () => goToAppointment(context) : null,
              child: Text(
                btnTextFinishBook,
                style: _btnTextStyle,
              )),
          decoration: pageDecoration,
        ),
      ],
      showDoneButton: false,
      nextColor: Color(0xFF26A98A),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: dotsDecoration,
      globalBackgroundColor: Colors.white,
      skipFlex: 0,
      nextFlex: 0,
      isProgressTap: _consent,
      isProgress: _consent,
      showNextButton: _consent,
      freeze: !_consent,
      // animationDuration: 1000,
    );
  }
}
