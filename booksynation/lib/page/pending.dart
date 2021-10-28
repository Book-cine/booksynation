import 'package:booksynation/strings.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

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

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/stopwatch1.png',
              ),
              Container(
                margin: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.14,
                    right: width * 0.14),
                alignment: Alignment.bottomCenter,
                child: Text(
                  pendingText,
                  textAlign: TextAlign.center,
                  style: _normalTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
