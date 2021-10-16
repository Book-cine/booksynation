import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ScheduleData {
  late String uniqueId;
  late String name;
  late String email;
  late String vaccine;
  late String dosage;
  late String category;
  late int cStock;
  late int maxStock;
  late DateTime dateScheduled;
  late DateTime dateStart;
  late DateTime dateEnd;

  ScheduleData({
    required this.uniqueId,
    required this.name,
    required this.email,
    required this.vaccine,
    required this.dosage,
    required this.category,
    required this.cStock,
    required this.maxStock,
    required this.dateScheduled,
    required this.dateStart,
    required this.dateEnd,
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
  cStock: 0,
  maxStock: 0,
  dateScheduled: DateTime.now(),
  dateStart: DateTime.now(),
  dateEnd: DateTime.now(),
);

// CollectionReference schedCollection =
//     FirebaseFirestore.instance.collection('scheduled-users');
// CollectionReference vaccineCollection =
//     FirebaseFirestore.instance.collection('vaccine');

// assignAvailableVaccine() async {
//   print('Assign Available Vaccine Started...');
//   var dataSnap = await FirebaseFirestore.instance
//       .collection('vaccine')
//       .where('Category', isEqualTo: scheduleData.category)
//       .orderBy('DateStart', descending: true)
//       .limit(1)
//       .get();

//   List<QueryDocumentSnapshot> docs = dataSnap.docs;
//   for (var doc in docs) {
//     if (doc.data() != null) {
//       var datadoc = doc.data() as Map<String, dynamic>;

//       print('DateStart: ' + datadoc['DateStart']);
//       print('Vaccine: ' + datadoc['Vaccine']);
//       print('Current Stock: ' + datadoc['CurrentStock']);
//       print('Vaccine Category: ' + datadoc['Category']);
//       print('Patient Category: ' + scheduleData.category);
//     }
//   }

//   //
//   // );
//   // await vaccineCollection.snapshots().map((QuerySnapshot docSnap) {
//   //   Map<String, dynamic> data = docSnap.docs as Map<String, dynamic>;
//   //   print('Vaccine: ' + data['Vaccine']);
//   //   print('Current Stock: ' + data['CurrentStock']);
//   //   print('Vaccine Category: ' + data['Category']);
//   //   print('Patient Category: ' + scheduleData.category);

//   //   // if category matches the patient classification and vaccine stock > 0
//   //   if (data['CurrentStock'] > 0 && data['Category'] == scheduleData.category) {
//   //     //insert update query to vaccine collection
//   //     //to subtract one amount from current stock
//   //     data['CurrentStock'] -= 1;
//   //     scheduleData.vaccine = data['Vaccine'];
//   //   } else {
//   //     scheduleData.vaccine = 'Failed: No Vaccine satisfies the condition';
//   //   }
//   // });
// }

// // Future<String> assignAvailableVaccine() async {
// //   print('Assign Available Vaccine Started...');
// //   await vaccineCollection.snapshots().map((QuerySnapshot docSnap) {
// //     docSnap.docs.forEach((element) {
// //       Map<String, dynamic> data = element as Map<String, dynamic>;
// //        print('Vaccine: ' + data['Vaccine']);
// //       print('Current Stock: ' + data['CurrentStock']);
// //       print('Vaccine Category: ' + data['Category']);
// //       print('Patient Category: ' + scheduleData.category);

// //       // if category matches the patient classification and vaccine stock > 0
// //       if (data['CurrentStock'] > 0 &&
// //           data['Category'] == scheduleData.category) {
// //         //insert update query to vaccine collection
// //         //to subtract one amount from current stock
// //         data['CurrentStock'] -= 1;

// //         print('Assign Available Vaccine Finished...(Return Vaccine)');
// //         return data['Vaccine'];
// //       }
// //     });
// //   });
// //   print('Assign Available Vaccine Finished... (No vaccine)');
// //   return 'Failed: No Vaccine satisfies the condition';
// // }

// assignASchedule(vaccine) {
//   print('Assign a schedule started...');
//   //current stock 99 : maxStock 100 : perDay 20 since 5 days
//   int perDay = vaccine.maxStock %
//       (vaccine.dateEnd.difference(vaccine.dateStart)); // 100 % 5 = 20
//   int counter = 0;
//   if (vaccine.currentStock % perDay > 0) {
//     //today & vaccine.currentStock -= 1
//     counter = counter;
//   } else {
//     //tomorrow
//     counter += 1;
//   }
//   vaccine.currentStock -= 1;

//   scheduleData.dateScheduled = vaccine.dateStart.add(Duration(days: counter));
//   print('Assign a schedule finished...');
// }

// createSchedData(User? _patient) async {
//   await FirebaseFirestore.instance
//       .collection('patient')
//       .doc(_patient!.uid) //change this to patient's UID
//       .get()
//       .then((result) {
//     Map<String, dynamic>? value = result.data();
//     scheduleData.uniqueId = value?['UID'];
//     scheduleData.name = value?['FirstName'] +
//         ' ' +
//         value?['MiddleName'] +
//         ' ' +
//         value?['LastName'];
//     scheduleData.email = value?['Email'];
//     // scheduleData.vaccine = value?['UID']; //needs to be set by
//     // scheduleData.dosage = value?['']; //needs to be set not here
//     scheduleData.category = value?['Cov19_Classification'];
//   });

//   print('Before Function -> Vaccine: ' + scheduleData.vaccine);
//   //Assign vaccine to local class first

//   assignAvailableVaccine();

//   print('Vaccine: ' + scheduleData.vaccine);
//   //Assign date to local class first
//   assignASchedule(scheduleData.vaccine);

//   print('UniqueID: ' + scheduleData.uniqueId);
//   print('Name: ' + scheduleData.name);
//   print('Email: ' + scheduleData.email);
//   print('Category: ' + scheduleData.category);
//   print('DateScheduled: ' + scheduleData.dateScheduled.toString());
//   print('Vaccine: ' + scheduleData.vaccine);

//   await schedCollection.doc(_patient.uid).set({
//     'uniqueId': scheduleData.uniqueId,
//     'name': scheduleData.name,
//     'email': scheduleData.email,
//     'vaccine': scheduleData.vaccine, //still needs to be assigned
//     'dosage': scheduleData.dosage, //still needs to be assigned
//     'category': scheduleData.category,
//     'dateScheduled': scheduleData.dateScheduled,
//     // 'dateScheduled': assignASchedule(scheduleData.vaccine),
//   })
//       // .then((value) => print('Added Sched'))
//       .catchError((error) => print('Failed to add schedule: $error'));
// }

// var patient = FirebaseFirestore.instance.collection('patient');
//   await patient.doc(_patient!.uid).get().then((result) {
//     Map<String, dynamic>? value = result.data();
//     scheduleData.uniqueId = value?['UID'];
//   }
