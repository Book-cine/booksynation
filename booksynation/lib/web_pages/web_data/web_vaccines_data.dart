import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineData {
<<<<<<< Updated upstream
  late String uniqueId;
  late String vaccine;
  late String dateStart;
  late String dateEnd;
  late int currentStock;
  late int maxStock;

  VaccineData({
    required this.uniqueId,
    required this.vaccine,
    required this.dateStart,
    required this.dateEnd,
    required this.currentStock,
    required this.maxStock,
  });
}

var vaccineCollection = FirebaseFirestore.instance.collection('vaccine');

VaccineData vaccineData = VaccineData(
  uniqueId: '',
  vaccine: '',
  dateStart: '',
  dateEnd: '',
  currentStock: 0,
  maxStock: 0,
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
    });
  });
}

Future readVaccineData() async {
  await vaccineCollection.doc().get().then((result) {
    Map<String, dynamic>? value = result.data();
    vaccineData.vaccine = value?['Vaccine'];
    vaccineData.dateStart = value?['DateStart'];
    vaccineData.dateEnd = value?['DateEnd'];
    vaccineData.currentStock = value?['CurrentStock'];
    vaccineData.maxStock = value?['MaxStock'];
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
=======
  String uid = '';
  String vaccine = '';
  String category = '';
  DateTime dateStart = DateTime(0, 0, 0);
  DateTime dateEnd = DateTime(0, 0, 0);
  int currentStock = 0;
  int maxStock = 0;

  VaccineData(
      uid, vaccine, category, dateStart, dateEnd, currentStock, maxStock) {
    this.uid = uid;
    this.vaccine = vaccine;
    this.category = category;
    this.dateStart = dateStart;
    this.dateEnd = dateEnd;
    this.currentStock = currentStock;
    this.maxStock = maxStock;
  }
>>>>>>> Stashed changes
}
