import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booksynation_form/presentation/admin_control/content/web_manage.dart';
import 'package:booksynation_form/presentation/admin_control/content/web_missed.dart';
import 'package:booksynation_form/presentation/admin_control/content/web_schedule.dart';
import 'package:booksynation_form/presentation/admin_control/content/web_settings.dart';
import 'package:booksynation_form/presentation/admin_control/web_login.dart';

class WebMain extends StatefulWidget {
  const WebMain({Key? key}) : super(key: key);

  @override
  _WebMainState createState() => _WebMainState();
}

class _WebMainState extends State<WebMain> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

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
    const name = 'Dr. Jose Aguinaldo';
    const email = 'book-cine@gmail.com';
    const urlImage = 'images/nashimg.png';
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
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
              child: SizedBox(
                height: height,
                width: width - 260,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: width - 260,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (width - 260) / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Text(getSection(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Color(0xFF334D6E))),
                              ],
                            ),
                          ),
                          SizedBox(
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
                      offset: const Offset(6, 0), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 18,
                      offset: const Offset(6, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 260,
                      height: 25,
                      child: Row(children: const [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 240,
                          child: Text("BookSyNation",
                              style: TextStyle(
                                  fontFamily: 'Antic Didone',
                                  fontSize: 22,
                                  color: Color(0xFF58BCA4))),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: (height * 0.9) - 45,
                      width: 240,
                      child: Material(
                        color: Colors.white70,
                        child: ListView(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  width: 260,
                                  height: height * 0.18,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(urlImage),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(name,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xFF192A3E))),
                                          SizedBox(
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
                                      color: status == 0
                                          ? const Color(0xFF4DB89E)
                                          : const Color(0xFFCCCCCC),
                                      height: 20),
                                  onClicked: () => setState(() {
                                    status = 0;
                                  }),
                                ),
                                buildMenuItem(
                                  item: 1,
                                  text: 'Scheduled Vaccinations',
                                  icon: SvgPicture.asset(
                                      'images/schedule_icon.svg',
                                      color: status == 1
                                          ? const Color(0xFF4DB89E)
                                          : const Color(0xFFCCCCCC),
                                      height: 20),
                                  onClicked: () => setState(() {
                                    status = 1;
                                  }),
                                ),
                                buildMenuItem(
                                  item: 2,
                                  text: 'Missed Vaccinations',
                                  icon: SvgPicture.asset(
                                      'images/missed_icon.svg',
                                      color: status == 2
                                          ? const Color(0xFF4DB89E)
                                          : const Color(0xFFCCCCCC),
                                      height: 20),
                                  onClicked: () => setState(() {
                                    status = 2;
                                  }),
                                ),
                                buildMenuItem(
                                  item: 3,
                                  text: 'Account Settings',
                                  icon: SvgPicture.asset(
                                      'images/settings_icon.svg',
                                      color: status == 3
                                          ? const Color(0xFF4DB89E)
                                          : const Color(0xFFCCCCCC),
                                      height: 20),
                                  onClicked: () => setState(() {
                                    status = 3;
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 260,
                      height: height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 250,
                            child: signOutMenu(
                              text: 'Sign-out',
                              icon: SvgPicture.asset('images/signout_icon.svg',
                                  height: 15),
                              onClicked: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WebLogin(),
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

  // ignore: unnecessary_getters_setters
  set status(int selection) {
    _selected = selection;
  }

  // ignore: unnecessary_getters_setters
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
    Widget content = const WebManage();
    switch (status) {
      case 0:
        content = const WebManage();
        break;
      case 1:
        content = const WebSchedule();
        break;
      case 2:
        content = const WebMissed();
        break;
      case 3:
        content = const WebSettings();
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
              color: status == item
                  ? const Color(0xFF4DB89E)
                  : const Color(0xFF334D6E))),
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
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF334D6E))),
      onTap: onClicked,
    );
  }
}
