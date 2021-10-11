import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:booksynation/page/appointment.dart';
// import 'package:booksynation/page/info.dart';
// import 'package:booksynation/page/settings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

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
    const name = 'Juan Dela Cruz';
    const email = 'book-cine@gmail.com';
    const image = 'images/nashimg.png';
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Material(
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: image, name: name, email: email, onClicked: () {}
                //TODO: Add back settings
                // onClicked: (){}
                //  => Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => PatientSettings(),
                //     )),
                ),
            SizedBox(
              height: height * 0.8,
              child: Column(
                children: [
                  Column(
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
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/Logo_BSN.svg',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'BookSyNation',
                        style: TextStyle(
                          fontFamily: 'Antic Didone',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
          colorFilter: ColorFilter.mode(
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
            const SizedBox(
              height: 20,
            ),
            Text(name,
                style: const TextStyle(
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
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: const TextStyle(color: Colors.white),
                icon: const Icon(Icons.arrow_drop_down_outlined,
                    color: Colors.white),
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

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    //TODO: Add back these options
    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PersonalInfo(),
        // ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => MyAppointment(),
        // ));
        break;
      case 2:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PatientSettings(),
        // ));
        break;
    }
  }

  DropdownMenuItem<String> buildDropItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
}
