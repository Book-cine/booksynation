import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String _pendingText =
        'Your booking is being processed. You shall be notified of your vaccination schedule shortly.';

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/stopwatch1.png',
          ),
          Container(
            margin: EdgeInsets.only(
                top: height * 0.05, left: width * 0.14, right: width * 0.14),
            alignment: Alignment.bottomCenter,
            child: Text(
              _pendingText, //TODO: add or change text
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Antic Didone',
                decoration: TextDecoration.none,
                fontSize: height * 0.02,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.05),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
                'PROCEED', //TODO: change button name
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.018,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
