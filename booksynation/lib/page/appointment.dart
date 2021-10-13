import 'package:booksynation/page/booksched.dart';
import 'package:booksynation/page/missed.dart';
import 'package:booksynation/page/schedule.dart';
import 'package:booksynation/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  Widget build(BuildContext context) {
    String schedule =
        '2021-10-11'; //Schedule of User's vaccine from firestore/ Book button pressed if not empty
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
          return ScheduleScreen(
            auth: auth,
            currentUser: currentUser,
          );
        } else {
          return MissedScreen();
        }
      } else {
        if (!fillStatus) {
          Future.delayed(Duration.zero, () {
            showFormAlert(context);
          });
        }
        return BookSchedule(
          auth: auth,
          currentUser: currentUser,
        );
      }
    }

    return Scaffold(
      body: getStatus(schedule, status),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(appointAlertTitle1),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(appointAlertText1),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, okayText),
              child: const Text(okayText),
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
          title: const Text(appointAlertTitle2),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(appointAlertText2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, okayText),
              child: const Text(okayText),
            ),
          ],
        );
      },
    );
  }
}
