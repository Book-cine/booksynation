import 'package:booksynation/strings.dart';
import 'package:flutter/material.dart';

class BookSchedule extends StatelessWidget {
  const BookSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: 2.5);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );
    String _name = 'Juan Alfonso Dela Cruz'; //TODO: name dynamic implementation

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.1,
                  left: width * 0.14,
                  right: width * 0.14,
                ),
                child: RichText(
                    text: TextSpan(
                        text: bookSchedText1,
                        style: _normalTextStyle,
                        children: <TextSpan>[
                      TextSpan(
                          text: _name +
                              '!', //TODO: apply name dynamic implementation
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ])),
              ),
              Text(bookSchedText2,
                  textAlign: TextAlign.center, style: _normalTextStyle),
              Text(bookSchedText3,
                  textAlign: TextAlign.center, style: _normalTextStyle),
              Padding(
                padding: EdgeInsets.only(top: height * 0.075),
                child: Image.asset('images/bookimg1.png', scale: 2),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.065),
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
