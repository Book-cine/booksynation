import 'package:booksynation/page/missed.dart';
import 'package:booksynation/page/pending.dart';
import 'package:booksynation/page/schedule.dart';
import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String schedule = '';
    bool status = false;
    DateTime now = new DateTime.now();
    String date = new DateTime(now.year, now.month, now.day).toString();
    Widget getStatus(String schedule, bool status) {
      if (schedule.isNotEmpty) {
        if (status) {
          return ScheduleScreen();
        } else {
          return MissedScreen();
        }
      } else {
        return PendingScreen();
      }
    }

    return Scaffold(
      drawer: SideMenu(),
      body: getStatus(schedule, status),
    );
  }
}
