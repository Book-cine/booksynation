import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleData {
  late String uniqueId;
  late String name;
  late String email;
  late String vaccine;
  late String dosage;
  late String category;
  late String vaccineID;
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
    required this.vaccineID,
  });
}

CollectionReference patientCollection =
    FirebaseFirestore.instance.collection('patient');

ScheduleData scheduleData = ScheduleData(
  uniqueId: '',
  name: '',
  email: '',
  vaccine: '',
  dosage: '1st',
  category: '',
  cStock: 0,
  maxStock: 0,
  vaccineID: '',
  dateScheduled: DateTime.now(),
  dateStart: DateTime.now(),
  dateEnd: DateTime.now(),
);

transferToMissed(String uniqueID) async {
  var coll = FirebaseFirestore.instance.collection('scheduled-users');
  var coll2 = FirebaseFirestore.instance.collection('missed-sched');
  int counter = 0;
  coll2.get().then((value) {
    value.docs.forEach((element) {
      counter += 1;
    });
  });
  //get data from scheduled users
  await coll.doc(uniqueID).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    //copy to missed collection
    await coll2.doc(uniqueID).set({
      'Category': value?['Category'],
      'DateSchedule': value?['Date'],
      'Dosage': value?['Dosage'],
      'Email': value?['Email'],
      'Name': value?['Name'],
      'Vaccine': value?['Vaccine'],
      'UID': value?['uniqueID'],
      'Index': counter,
    }).then((value) async {
      print('Schedule transferred to Missed');
      //remove from scheduled collection
      await coll
          .doc(uniqueID)
          .delete()
          .then((value) => print('Schedule Deleted'))
          .catchError(
              (error) => print('Failed to delete scheduled-user: $error'));
    }).catchError(
        (error) => print('Failed to transfer schedule to Missed: $error'));
  }).catchError((error) => print('Failed to get scheduled-user: $error'));
}
