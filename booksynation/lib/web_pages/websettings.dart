import 'package:booksynation/web_pages/webmanage.dart';
import 'package:booksynation/web_pages/webmissed.dart';
import 'package:booksynation/web_pages/webschedule.dart';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(urlImage),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF3DDD6A))),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            buildMenuItem(
                              text: 'Manage Vaccines',
                              icon: Icons.hourglass_bottom_outlined,
                              onClicked: () => selectedItem(context, 0),
                            ),
                            const SizedBox(height: 12),
                            buildMenuItem(
                              text: 'Scheduled Vaccinations',
                              icon: Icons.phone_outlined,
                              onClicked: () => selectedItem(context, 1),
                            ),
                            const SizedBox(height: 12),
                            buildMenuItem(
                              text: 'Missed Vaccinations',
                              icon: Icons.payment_outlined,
                              onClicked: () => selectedItem(context, 2),
                            ),
                            const SizedBox(height: 12),
                            buildMenuItem(
                              text: 'Account Settings',
                              icon: Icons.settings_outlined,
                              onClicked: () => selectedItem(context, 3),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('images/Logo_BSN.svg', height: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'BookSyNation',
                              style: TextStyle(
                                fontFamily: 'Antic Didone',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.grey.withOpacity(0.5);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
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
    }
  }
}
