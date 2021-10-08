import 'package:booksynation/strings.dart';
import 'package:flutter/material.dart';

class MissedScreen extends StatefulWidget {
  MissedScreen({Key? key}) : super(key: key);

  @override
  _MissedScreenState createState() => _MissedScreenState();
}

class _MissedScreenState extends State<MissedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: 1.5);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.14,
                    right: width * 0.14,
                    bottom: height * 0.025),
                child: Text(missedText1,
                    textAlign: TextAlign.center, style: _normalTextStyle),
              ),
              Image.asset(
                'images/missappt1.png',
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.025,
                    left: width * 0.14,
                    right: width * 0.14),
                child: Text(
                  (missedText2 +
                      "\n\n" +
                      contactDetail1 +
                      "\n" +
                      contactDetail2 +
                      "\n\n" +
                      missedText3), //TODO: implement dynamic contact details?
                  textAlign: TextAlign.center,
                  style: _normalTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.025),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); //TODO:change button action
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
                  child: Text(btnTextBook, style: _btnTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
