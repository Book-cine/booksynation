import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineData {
  late String uniqueId;
  late String vaccine;
  late DateTime dateStart;
  late DateTime dateEnd;
  late int currentStock;
  late int maxStock;
  late String category;

  VaccineData({
    required this.uniqueId,
    required this.vaccine,
    required this.dateStart,
    required this.dateEnd,
    required this.currentStock,
    required this.maxStock,
    required this.category,
  });
}

var vaccineCollection = FirebaseFirestore.instance.collection('vaccine');

VaccineData vaccineData = VaccineData(
  uniqueId: '',
  vaccine: '',
  dateStart: DateTime(2021, 1, 1),
  dateEnd: DateTime(2021, 1, 1),
  currentStock: 0,
  maxStock: 0,
  category: '',
);

createVaccineData() async {
  await FirebaseFirestore.instance.collection('vaccine').add({}).then((value) {
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
    });
  });
}

Future readVaccineData() async {
  await vaccineCollection.doc().get().then((result) {
    Map<String, dynamic>? value = result.data();
    vaccineData.vaccine = value?['UID'];
    vaccineData.vaccine = value?['Vaccine'];
    vaccineData.dateStart = value?['DateStart'];
    vaccineData.dateEnd = value?['DateEnd'];
    vaccineData.currentStock = value?['CurrentStock'];
    vaccineData.maxStock = value?['MaxStock'];
    vaccineData.category = value?['Category'];
  });
}

updateVaccineData() async {
  vaccineCollection
      .doc()
      .update({
        'UID': vaccineData.uniqueId,
        'Vaccine': vaccineData.vaccine,
        'DateStart': vaccineData.dateStart,
        'DateEnd': vaccineData.dateEnd,
        'CurrentStock': vaccineData.currentStock,
        'MaxStock': vaccineData.maxStock,
        'Category': vaccineData.category,
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
