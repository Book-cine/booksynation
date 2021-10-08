import 'package:booksynation/page/booksched.dart';
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
    String schedule =
        ''; //Schedule of User's vaccine from firestore/ Book button pressed if not empty
    bool status =
        true; //Status of Vaccination of User from firestore (false when vaccine is missed, true otherwise)
    bool fillStatus = true; //Status of Fill up Form of User from firestore
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
        if (!fillStatus) {
          Future.delayed(Duration.zero, () {
            showFormAlert(context);
          });
        }
        return BookSchedule();
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
          title: const Text('Today is your Vaccination Day'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please visit your respective vaccination site'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Okay'),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  void showFormAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('No Appointment Issued'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please fill out the form first!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Okay'),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
