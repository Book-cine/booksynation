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

//   //Assign vaccine to local class first
  assignAvailableVaccine();

//   //Assign date to local class first
  assignASchedule();
}

assignAvailableVaccine() async {
  print('Assign Available Vaccine Started...');
  var coll = FirebaseFirestore.instance.collection('vaccine');

  await coll
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
      //to subtract one amount from current stock
      value['CurrentStock'] -= 1;
      print('Current Stock: ' + value['CurrentStock'].toString());
      scheduleData.vaccine = value['Vaccine'];
      print('Vaccine is ' + scheduleData.vaccine);
      print('Assign Available Vaccine Finished...(Return Vaccine)');
      scheduleData.dateStart = value['DateStart'].toDate();
      scheduleData.dateEnd = value['DateEnd'].toDate();
      scheduleData.cStock = value['CurrentStock'];
      scheduleData.maxStock = value['MaxStock'];

      return null;
    } else {
      print('Assign Available Vaccine Finished... (No vaccine)');
    }
  });
}

assignASchedule() {
  print('Assign a schedule started...');
  //current stock 99 : maxStock 100 : perDay 20 since 5 days
  int perDay = scheduleData.maxStock /
          scheduleData.dateEnd.difference(scheduleData.dateStart).inDays
      as int; // 100 % 5 = 20

  print('Vaccine Alloted per Day: $perDay');
  int counter = 0;
  if (scheduleData.cStock % perDay > 0) {
    //today & vaccine.currentStock -= 1
    counter = counter;
  } else {
    //tomorrow
    counter += 1;
  }
  scheduleData.cStock -= 1;

  scheduleData.dateScheduled = scheduleData.dateStart;
  print('Current Stock: ' + scheduleData.cStock.toString());
  print('Data Scheduled for patient: ' + scheduleData.dateStart.toString());
  print('Assign Schedule Completed!');
}
