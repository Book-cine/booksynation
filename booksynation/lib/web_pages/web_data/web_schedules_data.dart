import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScheduleData {
  late String uniqueId;
  late String name;
  late String email;
  late String vaccine;
  late String dosage;
  late String category;
  late DateTime dateScheduled;

  ScheduleData({
    required this.uniqueId,
    required this.name,
    required this.email,
    required this.vaccine,
    required this.dosage,
    required this.category,
    required this.dateScheduled,
  });
}

CollectionReference patientCollection =
    FirebaseFirestore.instance.collection('patient');

ScheduleData scheduleData = ScheduleData(
    uniqueId: '',
    name: '',
    email: '',
    vaccine: '',
    dosage: 'First',
    category: '',
    dateScheduled: DateTime.now());

CollectionReference schedCollection =
    FirebaseFirestore.instance.collection('schedule');
CollectionReference vaccineCollection =
    FirebaseFirestore.instance.collection('vaccine');

Future<String> assignAvailableVaccine() async {
  await vaccineCollection.snapshots().map((QuerySnapshot docSnap) {
    docSnap.docs.forEach((element) {
      Map<String, dynamic> data = element as Map<String, dynamic>;
      if (data['currentStock'] > 0) {
        //insert update query to vaccine collection
        //to subtract one amount from current stock
        data['currentStock'] -= 1;
        return data['vaccine'];
      }
    });
  });
  return 'Failed: No Vaccine satisfies the condition';
}

Future<DateTime> assignASchedule(vaccine) async {
  //current stock 99 : maxStock 100 : perDay 20 since 5 days
  int perDay = vaccine.maxStock %
      (vaccine.dateEnd.difference(vaccine.dateStart)); // 100 % 5 = 20
  int counter = 0;
  if (vaccine.currentStock % perDay > 0) {
    //today & vaccine.currentStock -= 1
    counter = counter;
  } else {
    //tomorrow
    counter += 1;
  }
  vaccine.currentStock -= 1;
  return vaccine.dateStart.add(Duration(days: counter));
}

createSchedData(User? _patient) async {
  await FirebaseFirestore.instance
      .collection('patient')
      .doc(_patient!.uid) //change this to patient's UID
      .get()
      .then((result) {
    Map<String, dynamic>? value = result.data();
    scheduleData.uniqueId = value?['UID'];
    scheduleData.name = value?['FirstName'] +
        ' ' +
        value?['MiddleName'] +
        ' ' +
        value?['LastName'];
    scheduleData.email = value?['Email'];
    // scheduleData.vaccine = value?['UID']; //needs to be set by
    // scheduleData.dosage = value?['']; //needs to be set not here
    scheduleData.category = value?['Category'];
  });

  //Assign date to local class first
  scheduleData.dateScheduled =
      assignASchedule(scheduleData.vaccine) as DateTime;
  //Assign vaccine to local class first

  scheduleData.vaccine = assignAvailableVaccine() as String;
  print('UniqueID: ' + scheduleData.uniqueId);
  print('Name: ' + scheduleData.name);
  print('Email: ' + scheduleData.email);
  print('Category: ' + scheduleData.category);
  print('DateScheduled: ' + scheduleData.dateScheduled.toString());
  print('Vaccine: ' + scheduleData.vaccine);

  await schedCollection.doc(_patient.uid).set({
    'uniqueId': scheduleData.uniqueId,
    'name': scheduleData.name,
    'email': scheduleData.email,
    'vaccine': scheduleData.vaccine, //still needs to be assigned
    'dosage': scheduleData.dosage, //still needs to be assigned
    'category': scheduleData.category,
    'dateScheduled': scheduleData.dateScheduled,
    // 'dateScheduled': assignASchedule(scheduleData.vaccine),
  })
      // .then((value) => print('Added Sched'))
      .catchError((error) => print('Failed to add schedule: $error'));
}

// var patient = FirebaseFirestore.instance.collection('patient');
//   await patient.doc(_patient!.uid).get().then((result) {
//     Map<String, dynamic>? value = result.data();
//     scheduleData.uniqueId = value?['UID'];
//   }
