import 'package:booksynation/web_pages/webmanage.dart';
import 'package:booksynation/web_pages/webmissed.dart';
import 'package:booksynation/web_pages/webschedule.dart';
import 'package:booksynation/weblogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebSettings extends StatefulWidget {
  WebSettings({Key? key}) : super(key: key);

  @override
  _WebSettingsState createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final emails = [
    'nashtaps@gmail.com',
    'joserizal@gmail.com',
    'darksaviour@gmail.com',
    'cyberblaze@gmail.com',
    'mervtampus@gmail.com',
  ];

  String? value;
  @override
  Widget build(BuildContext context) {
    final name = 'Juan Dela Cruz';
    final email = 'book-cine@gmail.com';
    final urlImage = 'images/nashimg.png';
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF3DDD6A).withOpacity(0.10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
                    height: 3,
                  ),
                  Container(
                    width: 260,
                    height: 22,
                    child: Row(children: [
                      const SizedBox(
                        width: 3,
                      ),
                      Text("BookSyNation",
                          style: TextStyle(
                              fontFamily: 'Antic Didone',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF58BCA4))),
                    ]),
                  ),
                  Container(
                    height: (height * 0.9) - 25,
                    width: 260,
                    child: Material(
                      color: Colors.white70,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 260,
                                  height: height * 0.2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
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
                                                  fontSize: 16,
                                                  color: Color(0xFF192A3E))),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(email,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF90A0B7))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                buildMenuItem(
                                  text: 'Manage Vaccines',
                                  icon: SvgPicture.asset(
                                      'images/vaccine_icon.svg',
                                      height: 20),
                                  onClicked: () => selectedItem(context, 0),
                                ),
                                const SizedBox(height: 12),
                                buildMenuItem(
                                  text: 'Scheduled Vaccinations',
                                  icon: SvgPicture.asset(
                                      'images/schedule_icon.svg',
                                      height: 20),
                                  onClicked: () => selectedItem(context, 1),
                                ),
                                const SizedBox(height: 12),
                                buildMenuItem(
                                  text: 'Missed Vaccinations',
                                  icon: SvgPicture.asset(
                                      'images/missed_icon.svg',
                                      height: 20),
                                  onClicked: () => selectedItem(context, 2),
                                ),
                                const SizedBox(height: 12),
                                buildMenuItem(
                                  text: 'Account Settings',
                                  icon: SvgPicture.asset(
                                      'images/settings_icon.svg',
                                      height: 20),
                                  onClicked: () => selectedItem(context, 3),
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
                        Container(
                          width: 260,
                          child: signOutMenu(
                            text: 'Sign-out',
                            icon: SvgPicture.asset('images/signout_icon.svg',
                                height: 20),
                            onClicked: () => selectedItem(context, 4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.grey[200];

    return ListTile(
      leading: icon,
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget signOutMenu({
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;

    return ListTile(
      leading: icon,
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebManage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebSchedule(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebMissed(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebSettings(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebLogin(),
        ));
        break;
    }
  }
}
