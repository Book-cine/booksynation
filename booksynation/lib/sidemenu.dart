import 'package:booksynation/page/appointment.dart';
import 'package:booksynation/page/info.dart';
import 'package:booksynation/page/settings.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white70,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
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
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.black;
  final hoverColor = Color(0xFF3DDD6A).withOpacity(0.5);

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
        builder: (context) => PersonalInfo(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyAppointment(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PatientSettings(),
      ));
      break;
  }
}
