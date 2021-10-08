import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String _pendingText =
        'Your booking is being processed. You shall be notified of your vaccination schedule when it is available.';

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
            ],
          ),
        ),
      ),
    );
  }
}
