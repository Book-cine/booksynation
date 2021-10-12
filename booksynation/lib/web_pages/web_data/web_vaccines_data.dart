import 'package:cloud_firestore/cloud_firestore.dart';

List<VaccineData> vaccineSchedules = [
  // VaccineData(
  //   uniqueId: '',
  //   vaccine: 'Pfizer',
  //   dateStart: DateTime(2021, 05, 12),
  //   dateEnd: DateTime(2021, 05, 17),
  //   currentStock: 49,
  //   maxStock: 50,
  //   category: 'A5',
  // ),
  // VaccineData(
  //   uniqueId: '',
  //   vaccine: 'Janssen',
  //   dateStart: DateTime(2021, 05, 17),
  //   dateEnd: DateTime(2021, 05, 24),
  //   currentStock: 49,
  //   maxStock: 50,
  //   category: 'A5',
  // ),
];

// vaccineSchedules.add(
//   VaccineData(
//     uniqueId: vaccineData.uniqueId,
//     vaccine: vaccineData.vaccine,
//     dateStart: vaccineData.dateStart,
//     dateEnd: vaccineData.dateEnd,
//     currentStock: vaccineData.currentStock,
//     maxStock: vaccineData.maxStock,
//     category: vaccineData.category,
//   ),
// );

class VaccineData {
  late String uniqueId;
  late String vaccine;
  late DateTime dateStart;
  late DateTime dateEnd;
  late int currentStock;
  late int maxStock;
  late String category;
  late bool isCreated;

  VaccineData({
    required this.uniqueId,
    required this.vaccine,
    required this.dateStart,
    required this.dateEnd,
    required this.currentStock,
    required this.maxStock,
    required this.category,
    required this.isCreated,
  });
}

var vaccineCollection = FirebaseFirestore.instance.collection('vaccine');

VaccineData vaccineData = VaccineData(
  uniqueId: '',
  vaccine: '',
  dateStart: DateTime.now(),
  dateEnd: DateTime.now(),
  currentStock: 0,
  maxStock: 0,
  category: '',
  isCreated: false,
);

createVaccineData() async {
  vaccineCollection.add({}).then((value) {
    print(value.id);
    vaccineData.uniqueId = value.id;
    value.set({
      'UID': vaccineData.uniqueId,
      'Vaccine': vaccineData.vaccine,
      'DateStart': vaccineData.dateStart,
      'DateEnd': vaccineData.dateEnd,
      'CurrentStock': vaccineData.currentStock,
      'MaxStock': vaccineData.maxStock,
      'Category': vaccineData.category,
      'isCreated': vaccineData.isCreated,
    });
  });
}

// Future readVaccineData() async {
//   await vaccineCollection.doc().get().then((result) {
//     Map<String, dynamic>? value = result.data();
//     vaccineData.vaccine = value?['UID'];
//     vaccineData.vaccine = value?['Vaccine'];
//     vaccineData.dateStart = value?['DateStart'];
//     vaccineData.dateEnd = value?['DateEnd'];
//     vaccineData.currentStock = value?['CurrentStock'];
//     vaccineData.maxStock = value?['MaxStock'];
//     vaccineData.category = value?['Category'];
//     vaccineData.category = value?['Category'];
//   });
// }

updateVaccineData() async {
  vaccineCollection
      .doc(vaccineData.uniqueId)
      .update({
        'UID': vaccineData.uniqueId,
        'Vaccine': vaccineData.vaccine,
        'DateStart': vaccineData.dateStart,
        'DateEnd': vaccineData.dateEnd,
        'CurrentStock': vaccineData.currentStock,
        'MaxStock': vaccineData.maxStock,
        'Category': vaccineData.category,
        'isCreated': vaccineData.isCreated,
      })
      .then((value) => print('Vaccine Updated'))
      .catchError((error) => print('Failed to update vaccine: $error'));
}

deleteVaccineData() async {
  vaccineCollection
      .doc()
      .delete()
      .then((value) => print('Vaccine Deleted'))
      .catchError((error) => print('Failed to delete vaccine: $error'));
}
