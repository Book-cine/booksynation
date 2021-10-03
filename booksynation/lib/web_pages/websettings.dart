import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class WebSettings extends StatefulWidget {
  WebSettings({Key? key}) : super(key: key);

  @override
  _WebSettingsState createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: width * 0.03,
            child: Image.asset(
              'images/imagecp.png',
            ),
            // child: SvgPicture.asset(
            //   'images/webimage.svg',
            // ),
          ),
          Positioned(
              bottom: -15,
              right: width * 0.05,
              child: Transform.rotate(
                angle: -math.pi / 5.5,
                child: SvgPicture.asset(
                  'images/Logo_BSN.svg',
                  color: Colors.black.withOpacity(0.1),
                  height: height * 0.30,
                  width: width * 0.30,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height * 0.65,
              width: width * 0.75,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 5,
                        offset: Offset(3, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.05, horizontal: width * 0.035),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
