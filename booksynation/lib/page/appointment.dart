import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Personal Information'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
