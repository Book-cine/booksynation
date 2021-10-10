import 'package:booksynation/page/appointment.dart';
import 'package:booksynation/strings.dart';
import 'package:flutter/material.dart';

class HealthScreening extends StatefulWidget {
  HealthScreening({Key? key}) : super(key: key);

  @override
  _HealthScreeningState createState() => _HealthScreeningState();
}

class _HealthScreeningState extends State<HealthScreening> {
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
        //TODO: Add lang ari ug widgets para sa contents etol
        //TODO: Mao ni sa second part sa screening katong after sa booknow
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: height * 0.065),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyAppointment(),
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
                  child: Text('FINISH BOOKING', style: _btnTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
