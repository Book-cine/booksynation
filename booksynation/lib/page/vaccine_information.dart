import 'package:booksynation/page/health_declaration_screening.dart';
import 'package:booksynation/strings.dart';
import 'package:flutter/material.dart';

class VaccineInfo extends StatefulWidget {
  VaccineInfo({Key? key}) : super(key: key);

  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              //TODO: Add lang ari ug widgets para sa contents etol
              //TODO: Mao ni sa first part sa screening katong after sa booknow
              Padding(
                padding: EdgeInsets.only(top: height * 0.065),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HealthScreening(),
                      ),
                    ); //TODO:change button action
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
                  child: Text('GET STARTED', style: _btnTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
