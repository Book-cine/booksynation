import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

List<VaccineData> vaccineSchedules = [];
var vaccineCollection = FirebaseFirestore.instance.collection('vaccine');
var stockCollection = FirebaseFirestore.instance.collection('vaccine-stock');

class SchedulerData {
  late String? vaccine;
  late DateTime? dateStart;
  late DateTime? dateEnd;
  late TextEditingController? stock;
  late String? initialText;
  late String? category;

  SchedulerData({
    required this.vaccine,
    required this.dateStart,
    required this.dateEnd,
    required this.stock,
    required this.initialText,
    required this.category,
  });
}

SchedulerData schedulerData = SchedulerData(
  vaccine: null,
  dateStart: null,
  dateEnd: null,
  stock: null,
  initialText: '0',
  category: null,
);

class MaxStockData {
  late int totalMStock;
  late int totalCStock;
  late int mStock;
  late int cStock;

  MaxStockData({
    required this.totalMStock,
    required this.totalCStock,
    required this.mStock,
    required this.cStock,
  });
}

MaxStockData maxStockData = MaxStockData(
  totalMStock: 0,
  totalCStock: 0,
  mStock: 0,
  cStock: 0,
);

class VaccineData {
  late String uniqueId;
  late String? vaccine;
  late DateTime? dateStart;
  late DateTime? dateEnd;
  late int stock;
  late String? category;
  late bool isCreated;

  VaccineData({
    required this.uniqueId,
    required this.vaccine,
    required this.dateStart,
    required this.dateEnd,
    required this.stock,
    required this.category,
    required this.isCreated,
  });
}

VaccineData vaccineData = VaccineData(
  uniqueId: '',
  vaccine: null,
  dateStart: null,
  dateEnd: null,
  stock: 0,
  category: null,
  isCreated: false,
);

createStock() async {
  var stockDocument = stockCollection.doc(vaccineData.vaccine);
  stockDocument.update({
    'totalCurrentStock': maxStockData.totalCStock + vaccineData.stock,
    'totalMaxStock': maxStockData.totalMStock + vaccineData.stock,
  });
}

createVaccineData() async {
  vaccineCollection.add({}).then((value) {
    print(value.id);
    vaccineData.uniqueId = value.id;
    value.set({
      'UID': vaccineData.uniqueId,
      'Vaccine': vaccineData.vaccine,
      'DateStart': vaccineData.dateStart,
      'DateEnd': vaccineData.dateEnd,
      'CurrentStock': vaccineData.stock,
      'MaxStock': vaccineData.stock,
      'Category': vaccineData.category,
      'isCreated': true,
    });
  });
}

updateStock() async {
  var stockDocument = stockCollection.doc(vaccineData.vaccine);
  stockDocument
      .update({
        'totalCurrentStock':
            maxStockData.totalCStock + vaccineData.stock - maxStockData.mStock,
        'totalMaxStock':
            maxStockData.totalMStock + vaccineData.stock - maxStockData.mStock,
      })
      .then((value) => print('Stock Updated'))
      .catchError((error) => print('Failed to update stock: $error'));
}

updateVaccineData() async {
  vaccineCollection
      .doc(vaccineData.uniqueId)
      .update({
        'UID': vaccineData.uniqueId,
        'Vaccine': vaccineData.vaccine,
        'DateStart': vaccineData.dateStart,
        'DateEnd': vaccineData.dateEnd,
        'CurrentStock':
            maxStockData.cStock + (vaccineData.stock - maxStockData.mStock),
        'MaxStock': vaccineData.stock,
        'Category': vaccineData.category,
        'isCreated': true,
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
