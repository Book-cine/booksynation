import 'package:booksynation/page/patient_info/personal_info_page.dart';
import 'package:booksynation/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class CovidInfo extends StatefulWidget {
  const CovidInfo({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  State<CovidInfo> createState() =>
      _CovidInfoState(auth: auth, currentUser: currentUser);
}

class _CovidInfoState extends State<CovidInfo> {
  _CovidInfoState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;

  void goToPersonalInfo(context) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PersonalInfo(
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
            EdgeInsets.only(left: width * 0.05, right: width * 0.05),
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
            title: c19TitleText1,
            bodyWidget: Text(
              c19DescText1,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg1.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText2,
            bodyWidget: Text(
              c19DescText2,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg2.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText3,
            bodyWidget: Text(
              c19DescText3,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg3.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText4,
            bodyWidget: Text(
              c19DescText4,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg4.png', scale: 1.25),
            footer: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF26A98A),
                    fixedSize: Size(width * 0.40, height * 0.065),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
                onPressed: () => goToPersonalInfo(context),
                child: Text(
                  btnTextUnderstand,
                  style: _btnTextStyle,
                )),
            decoration: pageDecoration)
      ],
      showSkipButton: true,
      showDoneButton: false,
      skip: Text(skipText,
          style: _btnTextStyle.copyWith(color: Color(0xFF26A98A))),
      nextColor: Color(0xFF26A98A),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: dotsDecoration,
      globalBackgroundColor: Colors.white,
      skipFlex: 0,
      nextFlex: 0,
    );
  }
}
