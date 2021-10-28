import 'package:booksynation/web_pages/web_data/assign_vaccine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MissedData {
  late int index;
  late String uniqueId;
  late String name;
  late String email;
  late String vaccine;
  late String dosage;
  late String category;
  late DateTime dateScheduled;

  MissedData({
    required this.index,
    required this.uniqueId,
    required this.name,
    required this.email,
    required this.vaccine,
    required this.dosage,
    required this.category,
    required this.dateScheduled,
  });
}

MissedData missedPatient = MissedData(
  index: 0,
  uniqueId: '',
  name: '',
  email: '',
  vaccine: '',
  dosage: '',
  category: '',
  dateScheduled: DateTime.now(), // isGoogleUser: isGoogleUser,
);

CollectionReference missedCollection =
    FirebaseFirestore.instance.collection('missed-sched');
CollectionReference patientCollection =
    FirebaseFirestore.instance.collection('patient');

deleteMissedData(String uid) async {
  var coll = FirebaseFirestore.instance.collection('missed-sched');
  var coll2 = FirebaseFirestore.instance.collection('removed-users');

  await coll.doc(uid).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    //copy to completed-users collection
    await coll2.doc(uid).set({
      'Category': value?['Category'],
      'DateSchedule': value?['DateSchedule'],
      'Dosage': value?['Dosage'],
      'Email': value?['Email'],
      'Name': value?['Name'],
      'Vaccine': value?['Vaccine'],
      'UID': value?['UID'],
    }).then((value) async {
      print('Schedule transferred to removed-users');
      //remove from missed scheduled collection
      coll
          .doc(uid)
          .delete()
          .then((value) => print('Missed Patient Deleted'))
          .catchError(
              (error) => print('Failed to delete Missed Patient: $error'));
    }).catchError((error) =>
        print('Failed to transfer schedule to Removed Collection: $error'));
  }).catchError(
      (error) => print('Failed to get missed scheduled-user: $error'));
}

//called when approval button is pressed by admin
reschedMissedPatient(String uniqueID) async {
  missedPatient.uniqueId = uniqueID;
  var coll = FirebaseFirestore.instance.collection('missed-sched');
  patientCollection
      .doc(uniqueID)
      .update({
        'Missed_Status': false,
      })
      .then((value) => print('Update User'))
      .catchError((error) => print('Failed to update user: $error'));

  missedPatient.uniqueId = uniqueID;
  print('Missed Patient UniqueID: ' + missedPatient.uniqueId);
  await coll.doc(missedPatient.uniqueId).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    missedPatient.dosage = value?['Dosage'];
    print('Missed Patient Dosage:' + missedPatient.dosage);

    assignAvailableVaccine(missedPatient.dosage, true).then(
      (value) => assignASchedule().then(
        (value) => setMissedScheduleFirebase().then(
          (value) {
            print('Missed Patient Successfully Rescheduled');
            transferToSchedule(uniqueID);
          },
        ).catchError((error) =>
            print('Failed to reschedule missed patient: $error') as Null),
      ),
    );
  });
}

transferToSchedule(String uniqueID) async {
  var coll = FirebaseFirestore.instance.collection('missed-sched');
  var coll2 = FirebaseFirestore.instance.collection('scheduled-users');

  //get data from missed scheduled users
  await coll.doc(uniqueID).get().then((result) async {
    Map<String, dynamic>? value = result.data();
    //copy to scheduled-users collection
    await coll2.doc(uniqueID).set({
      'Category': value?['Category'],
      'Date': value?['DateSchedule'],
      'Dosage': value?['Dosage'],
      'Email': value?['Email'],
      'Name': value?['Name'],
      'Vaccine': value?['Vaccine'],
      'uniqueID': value?['UID'],
    }).then((value) async {
      print('Missed Schedule transferred to Schedule');
      //remove from scheduled collection
      await coll
          .doc(uniqueID)
          .delete()
          .then((value) => print('Missed Schedule Deleted'))
          .catchError((error) =>
              print('Failed to delete missed-sched patient: $error'));
    }).catchError(
        (error) => print('Failed to transfer schedule to Schedule: $error'));
  }).catchError((error) => print('Failed to get missed-user: $error'));
}
