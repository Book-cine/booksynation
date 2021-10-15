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
