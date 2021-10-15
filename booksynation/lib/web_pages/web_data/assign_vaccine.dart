import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

createScheduleVaccine(User? _patient) async {
  var coll = FirebaseFirestore.instance.collection('patient');
  await coll.doc(_patient!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    scheduleData.uniqueId = value?['UID'];
    scheduleData.name = value?['FirstName'] +
        ' ' +
        value?['MiddleName'] +
        ' ' +
        value?['LastName'];
    scheduleData.email = value?['Email'];
    scheduleData.category = value?['Cov19_Classification'];
  });

  print('Patient Category: ' + scheduleData.category);
  print('Patient Name: ' + scheduleData.name);

  print('Before Function -> Vaccine: ' + scheduleData.vaccine);

  //Assign vaccine to local class first
  assignAvailableVaccine();
}

var vaccineColl = FirebaseFirestore.instance.collection('vaccine');
assignAvailableVaccine() async {
  print('Assign Available Vaccine Started...');
  // var coll = FirebaseFirestore.instance.collection('vaccine');

  await vaccineColl
      .where('Category', isEqualTo: scheduleData.category)
      .snapshots()
      .elementAt(0)
      .then((docSnap) {
    Map<String, dynamic>? value = docSnap.docs.elementAt(0).data();
    print('Vaccine: ' + value['Vaccine']);
    print('Current Stock: ' + value['CurrentStock'].toString());
    print('Vaccine Category: ' + value['Category']);
    print('Patient Category: ' + scheduleData.category);

    // if category matches the patient classification and vaccine stock > 0
    if (value['CurrentStock'] > 0 &&
        value['Category'] == scheduleData.category) {
      //insert update query to vaccine collection
      scheduleData.vaccine = value['Vaccine'];
      print('Vaccine is ' + scheduleData.vaccine);
      scheduleData.dateStart = value['DateStart'].toDate();
      scheduleData.dateEnd = value['DateEnd'].toDate();

      print('Local Date assigned is ' +
          scheduleData.dateStart.toString() +
          ' - ' +
          scheduleData.dateEnd.toString());
      scheduleData.cStock = value['CurrentStock'];
      print('Cstock: ' + scheduleData.cStock.toString());
      scheduleData.maxStock = value['MaxStock'];
      print('Maxstock: ' + scheduleData.maxStock.toString());
      scheduleData.vaccineID = value['UID'];
      print('VaccineID: ' + scheduleData.vaccineID);
      print('Assign Available Vaccine Finished...(Return Vaccine)');
    } else {
      print('Assign Available Vaccine Finished... (No vaccine)');
    }
  });
}

assignASchedule() {
  print('Assign a schedule started...');

  scheduleData.cStock -= 1;
  //current stock 99 : maxStock 100 : perDay 20 since 5 days
  // int numberOfDays =
  //     scheduleData.dateEnd.difference(scheduleData.dateStart).inDays;
  // double perDay = scheduleData.maxStock / numberOfDays; // 100 / 5 = 20
  // List<int>? stockArray;
  // //Assign stock per day
  // for (int x = 0; x < numberOfDays; x++) {
  //   stockArray!.add(perDay);
  // }

  // int cStock = scheduleData.cStock;
  // // cStock!=0 if less than perDay but still not zero
  // if (cStock > perDay || cStock != 0) {
  //   //assign slot and subtract stock
  //   scheduleData.cStock-=1;
  // } else {
  //   print('No available stock for this vaccine.');
  // }

  // print('Vaccine Alloted per Day: $perDay');
  // int counter = 0;
  // //if available stock is 20 then 20
  // if (scheduleData.cStock % perDay > 0) {
  //   //today & vaccine.currentStock -= 1
  //   counter = counter;

  //   print('Counter(true): $counter');
  // } else {
  //   //tomorrow
  //   counter += 1;

  //   print('Counter(false): $counter');
  // }

  updateStockData();
  scheduleData.dateScheduled = scheduleData.dateStart;
  print('Current Stock: ' + scheduleData.cStock.toString());
  print('Data Scheduled for patient: ' + scheduleData.dateStart.toString());
  print('Assign Schedule Date Completed!');
}

updateStockData() async {
  vaccineColl
      .doc(scheduleData.vaccineID)
      .update({
        'CurrentStock': scheduleData.cStock,
      })
      .then((value) => print(scheduleData.vaccine + ' Current Stock Updated'))
      .catchError((error) => print('Failed to update vaccine: $error'));
}

setScheduleFirebase() async {
  var coll = FirebaseFirestore.instance.collection('scheduled-users');

  await coll
      .doc(scheduleData.uniqueId)
      .set({
        'Category': scheduleData.category, // John Doe
        'Date': scheduleData.dateScheduled, // Stokes and Sons
        'Dosage': scheduleData.dosage,
        'Email': scheduleData.email, // 42
        'Name': scheduleData.name,
        'Vaccine': scheduleData.vaccine,
        'uniqueID': scheduleData.uniqueId,
        // 42
      })
      .then((value) => print("Schedule Added"))
      .catchError((error) => print("Failed to add schedule: $error"));
}

//assign to local
getScheduleFirebase(User? user) async {
  var coll = FirebaseFirestore.instance.collection('scheduled-users');

  await coll.doc(user!.uid).get().then((result) {
    Map<String, dynamic>? value = result.data();
    scheduleData.dateScheduled = value?['Date'].toDate();
  }).catchError((error) => print("Failed to get vaccine schedule: $error"));
}

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
