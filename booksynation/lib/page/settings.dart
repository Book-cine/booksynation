import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class PatientSettings extends StatelessWidget {
  const PatientSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
