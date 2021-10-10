import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class PatientSettings extends StatelessWidget {
  const PatientSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black87),
          ),
        ),
        drawer: SideMenu(),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('Account Information',
                        style: TextStyle(
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: height * 0.020),
                  ],
                ),
                Column(
                  children: [
                    Stack(children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/user.png'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_a_photo, color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),

                    SizedBox(height: height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.015),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.010),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: height * 0.010),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    // SizedBox(height: height * 0.010),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width * 0.65,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1D74E9).withOpacity(0.16),
                        blurRadius: 8,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ]),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        fixedSize: Size(
                          width * 0.65,
                          height * 0.060,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text(
                        'Save Changes',
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
    );
  }
}
