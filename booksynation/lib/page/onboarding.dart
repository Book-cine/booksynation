import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: SideMenu(),
        body: Container(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(35.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('images/onb1.png'),
                    SizedBox(height: height * 0.10),
                    Text(
                      'Fill up the online form.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.042,
                      ),
                    ),
                    SizedBox(height: height * 0.020),
                    Text(
                      'You won’t need to fill up a written form in the vaccination site once you filled the online form.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                    SizedBox(height: height * 0.20),
                    Image.asset('images/imagecp.png'),
                    SizedBox(height: height * 0.10),
                    Text(
                      'Book a schedule for vaccination.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.042,
                      ),
                    ),
                    SizedBox(height: height * 0.020),
                    Text(
                      'Choose your schedule at your most appropriate time and date.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                    SizedBox(height: height * 0.20),
                    Image.asset('images/onb2.png'),
                    SizedBox(height: height * 0.10),
                    Text(
                      'Get notified when schedule is near.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.042,
                      ),
                    ),
                    SizedBox(height: height * 0.020),
                    Text(
                      'Be reminded of your vaccination schedule a day before to be ready for the appointment.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                    SizedBox(height: height * 0.30),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width * 0.65,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFF26A98A).withOpacity(0.16),
                            blurRadius: 8,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ]),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF26A98A),
                            fixedSize: Size(
                              width * 0.35,
                              height * 0.055,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Text(
                            'Proceed',
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
      ),
    );
  }
}
