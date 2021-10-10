import 'package:booksynation/page/patient_info/personal_info_page.dart';
import 'package:flutter/material.dart';

class CovidInfo extends StatefulWidget {
  const CovidInfo({Key? key}) : super(key: key);

  @override
  State<CovidInfo> createState() => _CovidInfoState();
}

class _CovidInfoState extends State<CovidInfo> {
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
              //TODO: Mao ni sa Covid Vaccine 19 Information
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonalInfo(),
                  ));
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
                child: Text('I UNDERSTAND', style: _btnTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
