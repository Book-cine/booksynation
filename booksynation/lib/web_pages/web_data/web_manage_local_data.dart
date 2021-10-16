// import 'package:booksynation/web_pages/temp_files/web_vaccines_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

class SchedulerFieldsData {
  DateTime? dateStart;
  DateTime? dateEnd;
  String? vaccine;
  String? category;
  TextEditingController? stock;
  String? initialValue;

  SchedulerFieldsData({
    required this.dateStart,
    required this.dateEnd,
    required this.vaccine,
    required this.category,
    required this.stock,
    required this.initialValue,
  });
}

SchedulerFieldsData schedulerFieldsData = SchedulerFieldsData(
  vaccine: 'Astrazenica',
  dateStart: DateTime.now(),
  dateEnd: DateTime.now(),
  category: 'A1',
  stock: null,
  initialValue: '0',
);

class UpdaterFieldsData {
  int? maxStock;
  int? totalMaxStock;
  int? currStock;
  int? totalCurrStock;

  UpdaterFieldsData({
    required this.maxStock,
    required this.totalMaxStock,
    required this.currStock,
    required this.totalCurrStock,
  });
}

UpdaterFieldsData updaterFieldsData = UpdaterFieldsData(
  maxStock: 0,
  totalMaxStock: 0,
  currStock: 0,
  totalCurrStock: 0,
);

class LocalFieldsData {
  late String? uniqueId;
  late String? vaccine;
  late DateTime? dateStart;
  late DateTime? dateEnd;
  late int? currentStock;
  late int? maxStock;
  late String? category;
  late bool isCreated;

  LocalFieldsData({
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

LocalFieldsData localFieldsData = LocalFieldsData(
  uniqueId: '',
  vaccine: 'Astrazenica',
  dateStart: DateTime.now(),
  dateEnd: DateTime.now(),
  currentStock: 0,
  maxStock: 0,
  category: 'A1',
  isCreated: false,
);

var vaccineCollection = FirebaseFirestore.instance.collection('vaccine');

class LocalHeaderVaccines {
  late int? pfizerMaxCount;
  late int? pfizerCurrCount;
  late int? astraMaxCount;
  late int? astraCurrCount;
  late int? modernaMaxCount;
  late int? modernaCurrCount;
  late int? janssenMaxCount;
  late int? janssenCurrCount;
  late int? sinoMaxCount;
  late int? sinoCurrCount;

  LocalHeaderVaccines({
    required this.pfizerMaxCount,
    required this.pfizerCurrCount,
    required this.astraMaxCount,
    required this.astraCurrCount,
    required this.modernaMaxCount,
    required this.modernaCurrCount,
    required this.janssenMaxCount,
    required this.janssenCurrCount,
    required this.sinoMaxCount,
    required this.sinoCurrCount,
  });
}

LocalHeaderVaccines localHeaderVaccines = LocalHeaderVaccines(
  pfizerMaxCount: 0,
  pfizerCurrCount: 0,
  astraMaxCount: 0,
  astraCurrCount: 0,
  modernaMaxCount: 0,
  modernaCurrCount: 0,
  janssenMaxCount: 0,
  janssenCurrCount: 0,
  sinoMaxCount: 0,
  sinoCurrCount: 0,
);

createVaccineData() async {
  vaccineCollection.add({}).then((value) {
    localFieldsData.uniqueId = value.id;
    vaccineCollection.doc(localFieldsData.uniqueId).set({
      'UID': value.id,
      'Vaccine': localFieldsData.vaccine,
      'DateStart': localFieldsData.dateStart,
      'DateEnd': localFieldsData.dateEnd,
      'CurrentStock': localFieldsData.maxStock,
      'MaxStock': localFieldsData.maxStock,
      'Category': localFieldsData.category,
      'isCreated': localFieldsData.isCreated,
      'TotalMaxStock': updaterFieldsData.totalMaxStock,
      'TotalCurrentStock': updaterFieldsData.totalCurrStock,
    });
  });
}

updateVaccineData() async {
  vaccineCollection
      .doc(localFieldsData.uniqueId)
      .update({
        'UID': localFieldsData.uniqueId,
        'Vaccine': localFieldsData.vaccine,
        'DateStart': localFieldsData.dateStart,
        'DateEnd': localFieldsData.dateEnd,
        'CurrentStock':
            (localFieldsData.maxStock! - updaterFieldsData.maxStock!) +
                localFieldsData.currentStock!,
        'MaxStock': localFieldsData.maxStock,
        'Category': localFieldsData.category,
        'isCreated': localFieldsData.isCreated,
        'TotalMaxStock': updaterFieldsData.totalMaxStock,
        'TotalCurrentStock': updaterFieldsData.totalCurrStock,
      })
      .then((value) => print('Vaccine Updated'))
      .catchError((error) => print('Failed to update vaccine: $error'));
}
