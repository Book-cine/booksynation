import 'package:booksynation/page/booksched.dart';
import 'package:booksynation/page/missed.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/schedule.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
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
    DateTime scheduleDate = scheduleData
        .dateScheduled; //Schedule of User's vaccine from firestore/ Book button pressed if not empty
    bool status =
        true; //Status of Vaccination of User from firestore (false when vaccine is missed, true otherwise)
    bool fillStatus =
        patient.fillStatus; //Status of Fill up Form of User from firestore
    print('FillStatus: ' +
        fillStatus.toString()); //TODO: no alert even if Fillstatus is false
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('MM/dd/yyyy');
    String date = formatter.format(now);
    String schedule = formatter.format(scheduleDate);

    Future.delayed(Duration.zero, () {
      if (status && date == schedule) {
        showAlert(context);
      }
    });

    Widget getStatus(String schedule, bool status) {
      if (schedule != formatter.format(DateTime.utc(1969, 7, 20, 20, 18, 04))) {
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
