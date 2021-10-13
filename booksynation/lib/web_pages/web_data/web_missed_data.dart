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

deleteMissedData(String uid) {
  missedCollection
      .doc(uid)
      .delete()
      .then((value) => print('Missed Patient Deleted'))
      .catchError((error) => print('Failed to delete Missed Patient: $error'));
}
