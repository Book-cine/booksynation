import 'package:flutter/material.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Builder(
      builder: (context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(50, 35, 50, 35),
              child: Column(
                children: [
                  SizedBox(height: height * 0.20),
                  Image.asset('images/onb1.png'),
                  SizedBox(height: height * 0.10),
                  Text(
                    'Fill up the online form.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Average',
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.65,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'You won’t need to fill up a written form in the vaccination site once you filled the online form.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Image.asset('images/imagecp.png'),
                  SizedBox(height: height * 0.10),
                  Text(
                    'Book a schedule for\nvaccination.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Average',
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.040,
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.65,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Choose your schedule at your most appropriate time and date.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Image.asset('images/onb2.png'),
                  SizedBox(height: height * 0.10),
                  Container(
                    width: width * 0.60,
                    child: Text(
                      'Get notified when your schedule is near.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.040,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.70,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Be reminded of your vaccination schedule a day before to be ready for the appointment.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width * 0.38,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFF26A98A).withOpacity(0.16),
                          blurRadius: 8,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Scaffold.of(context);
                          //TODO: change navigation to COVID-19 Info
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
                          'PROCEED',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.018,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
