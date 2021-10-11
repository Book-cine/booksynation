import 'package:booksynation/userData.dart';
import 'package:booksynation/web_pages/web_data/adminData.dart';
import 'package:booksynation/web_pages/webmanage.dart';
import 'package:booksynation/web_pages/webmissed.dart';
import 'package:booksynation/web_pages/webschedule.dart';
import 'package:booksynation/web_pages/websettings.dart';
import 'package:booksynation/web_pages/weblogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebMain extends StatefulWidget {
  WebMain({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  _WebMainState createState() =>
      _WebMainState(auth: auth, currentUser: currentUser);
}

class _WebMainState extends State<WebMain> {
  _WebMainState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final emails = [
    'nashtaps@gmail.com',
    'joserizal@gmail.com',
    'darksaviour@gmail.com',
    'cyberblaze@gmail.com',
    'mervtampus@gmail.com',
  ];

  String? value;
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final name = 'Dr. ' + admin.firstName + ' ' + admin.lastName;
    final email = userdata.email;
    final urlImage = 'images/user.png';
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFFEFEFEF),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: getContent(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: height,
                width: width - 260,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: width - 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: (width - 260) / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  child: Text(getSection(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xFF334D6E))),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (width - 260) / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: height,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 18,
                      offset: Offset(6, 0), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 18,
                      offset: Offset(6, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 260,
                      height: 25,
                      child: Row(children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 240,
                          child: Text("BookSyNation",
                              style: TextStyle(
                                  fontFamily: 'Antic Didone',
                                  fontSize: 22,
                                  color: Color(0xFF58BCA4))),
                        ),
                      ]),
                    ),
                    Container(
                      height: (height * 0.9) - 45,
                      width: 240,
                      child: Material(
                        color: Colors.white70,
                        child: ListView(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 260,
                                    height: height * 0.18,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(urlImage),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(name,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Color(0xFF192A3E))),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(email,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11,
                                                    color: Color(0xFF90A0B7))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  buildMenuItem(
                                    item: 0,
                                    text: 'Manage Vaccines',
                                    icon: SvgPicture.asset(
                                        'images/vaccine_icon.svg',
                                        color: this.status == 0
                                            ? Color(0xFF4DB89E)
                                            : Color(0xFFCCCCCC),
                                        height: 20),
                                    onClicked: () => setState(() {
                                      this.status = 0;
                                    }),
                                  ),
                                  buildMenuItem(
                                    item: 1,
                                    text: 'Scheduled Vaccinations',
                                    icon: SvgPicture.asset(
                                        'images/schedule_icon.svg',
                                        color: this.status == 1
                                            ? Color(0xFF4DB89E)
                                            : Color(0xFFCCCCCC),
                                        height: 20),
                                    onClicked: () => setState(() {
                                      this.status = 1;
                                    }),
                                  ),
                                  buildMenuItem(
                                    item: 2,
                                    text: 'Missed Vaccinations',
                                    icon: SvgPicture.asset(
                                        'images/missed_icon.svg',
                                        color: this.status == 2
                                            ? Color(0xFF4DB89E)
                                            : Color(0xFFCCCCCC),
                                        height: 20),
                                    onClicked: () => setState(() {
                                      this.status = 2;
                                    }),
                                  ),
                                  buildMenuItem(
                                    item: 3,
                                    text: 'Account Settings',
                                    icon: SvgPicture.asset(
                                        'images/settings_icon.svg',
                                        color: this.status == 3
                                            ? Color(0xFF4DB89E)
                                            : Color(0xFFCCCCCC),
                                        height: 20),
                                    onClicked: () => setState(() {
                                      this.status = 3;
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 260,
                      height: height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            child: signOutMenu(
                              text: 'Sign-out',
                              icon: SvgPicture.asset('images/signout_icon.svg',
                                  height: 15),
                              onClicked: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WebLogin(),
                                ))
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void set status(int selection) {
    _selected = selection;
  }

  int get status => _selected;

  String getSection() {
    String section = 'Manage Vaccines';
    switch (status) {
      case 0:
        section = 'Manage Vaccines';
        break;
      case 1:
        section = 'Scheduled Vaccines';
        break;
      case 2:
        section = 'Missed Vaccinations';
        break;
      case 3:
        section = 'Settings';
        break;
    }
    return section;
  }

  Widget getContent() {
    Widget content = WebManage();
    switch (status) {
      case 0:
        content = WebManage();
        break;
      case 1:
        content = WebSchedule();
        break;
      case 2:
        content = WebMissed();
        break;
      case 3:
        content = WebSettings();
        break;
    }
    return content;
  }

  Widget buildMenuItem({
    required int item,
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    final hoverColor = Colors.grey[200];

    return ListTile(
      leading: icon,
      title: Text(text,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color:
                  this.status == item ? Color(0xFF4DB89E) : Color(0xFF334D6E))),
      horizontalTitleGap: 5,
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget signOutMenu({
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: icon,
      horizontalTitleGap: 3,
      title: Text(text,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF334D6E))),
      onTap: onClicked,
    );
  }
}
