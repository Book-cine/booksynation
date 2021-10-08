import 'package:booksynation/main.dart';
import 'package:booksynation/page/appointment.dart';
import 'package:booksynation/page/patient_info/covid_19_info.dart';
import 'package:booksynation/page/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
    final image = 'images/nashimg.png';
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Material(
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: image,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PatientSettings(),
                    ))),
            Container(
              height: height * 0.8,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        buildMenuItem(
                          text: 'Personal Information',
                          icon: Icons.people,
                          onClicked: () => selectedItem(context, 0),
                        ),
                        const SizedBox(height: 12),
                        buildMenuItem(
                          text: 'My Appointment',
                          icon: Icons.phone_outlined,
                          onClicked: () => selectedItem(context, 1),
                        ),
                        const SizedBox(height: 12),
                        buildMenuItem(
                          text: 'Settings',
                          icon: Icons.settings_outlined,
                          onClicked: () => selectedItem(context, 2),
                        ),
                        const SizedBox(height: 12),
                        buildSignOutItem(),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/Logo_BSN.svg',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'BookSyNation',
                          style: TextStyle(
                            fontFamily: 'Antic Didone',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        image: DecorationImage(
          image: ExactAssetImage(urlImage),
          colorFilter: new ColorFilter.mode(
              Colors.grey.withOpacity(0.30), BlendMode.modulate),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: Colors.white,
                )),
            const SizedBox(
              height: 2,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                dropdownColor: Colors.teal[200],
                hint: Text(
                  email,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextStyle(color: Colors.white),
                icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                isExpanded: true,
                items: emails.map(buildDropItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
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

  Widget buildSignOutItem() {
    final color = Colors.black;
    final hoverColor = Colors.grey.withOpacity(0.5);

    return ListTile(
      title: Text('Sign-out', style: TextStyle(color: color)),
      leading: SvgPicture.asset(
        'images/signout_icon.svg',
        color: color,
        width: 18,
        alignment: Alignment.center,
      ),
      hoverColor: hoverColor,
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => App(),
        ))
      },
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CovidInfo(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAppointment(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CovidInfo(),
        ));
        break;
    }
  }

  Widget signOutMenu({
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    return ListTile(
      leading: icon,
      horizontalTitleGap: 3,
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  DropdownMenuItem<String> buildDropItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
}
