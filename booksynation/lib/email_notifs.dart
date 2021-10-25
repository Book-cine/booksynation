import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

Future sendEmailSchedToday({
  required String name,
  required String email,
  required String vaccine,
  required String dosage,
  required String schedule,
}) async {
  final serviceId = 'service_uudw07o';
  final templateId = 'template_zryeo5q';
  final userId = 'user_tTVTjivQHURFBCECQLga4';

  final url = Uri.parse(
      'https://api.emailjs.com/api/v1.0/email/send'); //insert resource url from emailjs insidoe here
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'user_vaccine': vaccine,
        'user_dosage': dosage,
        'user_schedule': schedule,
      }
    }),
  );
}

Future sendEmailConfirmBooking({
  required String name,
  required String email,
  required String vaccine,
  required String dosage,
  required String schedule,
}) async {
  final serviceId = 'service_uudw07o';
  final templateId = 'template_xp295v9';
  final userId = 'user_tTVTjivQHURFBCECQLga4';

  final url = Uri.parse(
      'https://api.emailjs.com/api/v1.0/email/send'); //insert resource url from emailjs insidoe here
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'user_vaccine': vaccine,
        'user_dosage': dosage,
        'user_schedule': schedule,
      }
    }),
  );
}

Future sendEmailNewSchedFromMissed({
  required String name,
  required String email,
  required String vaccine,
  required String dosage,
  required String schedule,
}) async {
  final serviceId = 'service_ffs7rvv';
  final templateId = 'template_qkb31wm';
  final userId = 'user_NhcmIPVtXBNwkqllKf1M8';

  final url = Uri.parse(
      'https://api.emailjs.com/api/v1.0/email/send'); //insert resource url from emailjs insidoe here
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'user_vaccine': vaccine,
        'user_dosage': dosage,
        'user_schedule': schedule,
      }
    }),
  );
}

periodicSendEmailToPatients() async {
  var schedColl = FirebaseFirestore.instance.collection('scheduled-users');
  await schedColl.snapshots().forEach((element) {
    element.docs.forEach((patientDoc) {
      Map<String, dynamic>? value = patientDoc.data();
      // print('Date retrieved from Firebase: ' + value?['Date']);
      // print('Date retrieved from DateTimeNow: ' + DateTime.now().toString());
      if (value['EmailNotif'] == false &&
          DateTime.now().day == value['Date'].day &&
          DateTime.now().month == value['Date'].month) {
        sendEmailSchedToday(
                name: value['Name'],
                email: value['Email'],
                vaccine: value['Vaccine'],
                dosage: value['Dosage'],
                schedule: value['Date'])
            .then((value) =>
                schedColl.doc(patientDoc.id).update({'EmailNotif': true}))
            .then((value) => print('Email Notif Sent'))
            .catchError(
                (error) => print('Failed to send email notification: $error'));
      }
    });
  });
  // await schedColl.doc(uniqueID).get().then((result) async {
  //   Map<String, dynamic>? value = result.data();
  //   // print('Date retrieved from Firebase: ' + value?['Date']);
  //   // print('Date retrieved from DateTimeNow: ' + DateTime.now().toString());
  //   if (value?['EmailNotif'] == false &&
  //       DateTime.now().day == value?['Date'].day &&
  //       DateTime.now().month == value?['Date'].month) {
  //     sendEmailNotifs(
  //             name: value?['Name'],
  //             email: value?['Email'],
  //             vaccine: value?['Vaccine'],
  //             dosage: value?['Dosage'],
  //             schedule: value?['Date'])
  //         .then((value) => schedColl.doc(uniqueID).update({'EmailNotif': true}))
  //         .then((value) => print('Email Notif Sent'))
  //         .catchError(
  //             (error) => print('Failed to send email notification: $error'));
  //   }
  // });
}

sendConfirmationBookingEmailNotif(String uniqueID) async {
  var schedColl = FirebaseFirestore.instance.collection('scheduled-users');
  await schedColl.doc(uniqueID).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    // print('Date retrieved from Firebase: ' + value?['Date']);
    // print('Date retrieved from DateTimeNow: ' + DateTime.now().toString());
    if (value?['EmailNotif'] == false &&
        DateTime.now().day == value?['Date'].day &&
        DateTime.now().month == value?['Date'].month) {
      sendEmailConfirmBooking(
              name: value?['Name'],
              email: value?['Email'],
              vaccine: value?['Vaccine'],
              dosage: value?['Dosage'],
              schedule: value?['Date'])
          .then((value) => print('Email Notif Sent'))
          .catchError((error) => print(
              'Failed to send email notification(confirmationBooking): $error'));
    }
  });
}

sendNewBookingEmailNotifFromMissed(String uniqueID) async {
  var schedColl = FirebaseFirestore.instance.collection('scheduled-users');
  await schedColl.doc(uniqueID).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    // print('Date retrieved from Firebase: ' + value?['Date']);
    // print('Date retrieved from DateTimeNow: ' + DateTime.now().toString());
    if (value?['EmailNotif'] == false &&
        DateTime.now().day == value?['Date'].day &&
        DateTime.now().month == value?['Date'].month) {
      sendEmailConfirmBooking(
              name: value?['Name'],
              email: value?['Email'],
              vaccine: value?['Vaccine'],
              dosage: value?['Dosage'],
              schedule: value?['Date'])
          .then((value) => print('Email Notif Sent'))
          .catchError((error) =>
              print('Failed to send email notification(fromMissed): $error'));
    }
  });
}
