import 'package:booksynation/page/missed.dart';
import 'package:booksynation/page/pending.dart';
import 'package:booksynation/page/schedule.dart';
import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String schedule = '2021-10-08';
    bool status = false;
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    Future.delayed(Duration.zero, () {
      if (status && schedule.isNotEmpty && date == schedule) {
        showAlert(context);
      }
    });

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

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Today is your Vaccination Day'),
                Text('Please visit your respective vaccination site'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
