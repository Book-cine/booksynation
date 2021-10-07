import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BookSyNation',
                  style: TextStyle(
                    fontFamily: 'Antic Didone',
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.036,
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                SvgPicture.asset(
                  'images/Logo_BSN.svg',
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                Text(
                  'Loading.....',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Antic Didone',
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.036,
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
