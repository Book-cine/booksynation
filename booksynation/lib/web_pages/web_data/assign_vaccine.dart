import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createScheduleVaccine(User? _patient) async {
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
  // peekAvailableVaccine().then((value) => assignAvailableVaccine());
  String dosage = '1st';
  bool fromMissedPatients = false;
  assignAvailableVaccine(dosage, fromMissedPatients).then(
    (value) => assignASchedule().then((value) => setScheduleFirebase()),
  );
}

var vaccineColl = FirebaseFirestore.instance.collection('vaccine');

Future<void> assignAvailableVaccine(String dosage, bool fromMissed) async {
  print('Assign Available Vaccine Started...');

  //if first dose, can assign any schedule matching the category.
  //if second dose, needs to check date if it's a month after the first dose.
  if (fromMissed) {
    print('From missed patients start resched');
    //make 14 days difference from first dose schedule
    var coll = FirebaseFirestore.instance.collection('scheduled-users');
    await coll.doc(scheduleData.uniqueId).get().then((result) async {
      Map<String, dynamic>? value = result.data();
      var patientColl = FirebaseFirestore.instance.collection('patient');
      await patientColl.doc(scheduleData.uniqueId).get().then((result) async {
        //get patient Data first
        Map<String, dynamic>? patientData = result.data();
        scheduleData.uniqueId = patientData?['UID'];
        print('schedUniqueID: ' + scheduleData.uniqueId);
        scheduleData.name = patientData?['FirstName'] +
            ' ' +
            patientData?['MiddleName'] +
            ' ' +
            patientData?['LastName'];

        scheduleData.email = patientData?['Email'];
        scheduleData.category = patientData?['Cov19_Classification'];
        print('Missed Patient Category: ' + scheduleData.category);
        print('Missed Patient Name: ' + scheduleData.name);
        scheduleData.vaccine = value?['Vaccine'];
        print('[Missed]Before Function -> Vaccine: ' + scheduleData.vaccine);
        //assign to 1st dose dateSched to local
        scheduleData.dateScheduled = value?['Date'].toDate();

        print('Missed Patient last known Schedule: ' +
            scheduleData.dateScheduled.toString());

        //get documents that have the same vaccine and are scheduled
        //after 1 week from the first dose
        //peek first matching documents if their current stock > 0
        // matches with vaccine and category
        await peekAvailableVaccine(fromMissed).then((value) async {
          //successfully assigned vaccineID to local, get vaccine from vaccine collection
          await vaccineColl.doc(scheduleData.vaccineID).get().then((docSnap) {
            Map<String, dynamic>? value = docSnap.data();
            scheduleData.vaccine = value?['Vaccine'];
            print('Vaccine is ' + scheduleData.vaccine);
            scheduleData.dateStart = value?['DateStart'].toDate();
            scheduleData.dateEnd = value?['DateEnd'].toDate();

            print('Local Date assigned is ' +
                scheduleData.dateStart.toString() +
                ' - ' +
                scheduleData.dateEnd.toString());
            scheduleData.cStock = value?['CurrentStock'];
            print('Cstock: ' + scheduleData.cStock.toString());
            scheduleData.maxStock = value?['MaxStock'];
            print('Maxstock: ' + scheduleData.maxStock.toString());
            scheduleData.vaccineID = value?['UID'];
            print('VaccineID: ' + scheduleData.vaccineID);
            print('Assign Available Vaccine Finished...(Return Vaccine)');
          }).catchError((error) => print(
              'Assign Available Vaccine Finished... (No vaccine): $error'));
        });
      });
    }).catchError((error) => print('Failed to get scheduled-user: $error'));
  } else if (dosage == '1st') {
    //peek first matching documents if their current stock > 0
    await vaccineColl
        .where('Category', isEqualTo: scheduleData.category)
        .get()
        .then((docSnap) {
      print('Document Found');
      docSnap.docs.forEach((element) {
        Map<String, dynamic>? value = element.data();

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
          int dateDifference = scheduleData.dateStart
              .difference(value['DateStart'].toDate())
              .inDays;
          if (dateDifference <= 14) {
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
        }
      });
    }).catchError((error) => print('No matching document found.'));
  } else {
    print('2nd Dose start resched');
    //make 14 days difference from first dose schedule
    var coll = FirebaseFirestore.instance.collection('scheduled-users');
    await coll.doc(scheduleData.uniqueId).get().then((result) async {
      Map<String, dynamic>? value = result.data();
      var patientColl = FirebaseFirestore.instance.collection('patient');
      await patientColl.doc(scheduleData.uniqueId).get().then((result) async {
        //get patient Data first
        Map<String, dynamic>? patientData = result.data();
        scheduleData.uniqueId = patientData?['UID'];
        print('schedUniqueID: ' + scheduleData.uniqueId);
        scheduleData.name = patientData?['FirstName'] +
            ' ' +
            patientData?['MiddleName'] +
            ' ' +
            patientData?['LastName'];

        scheduleData.email = patientData?['Email'];
        scheduleData.category = patientData?['Cov19_Classification'];
        print('Patient Category: ' + scheduleData.category);
        print('Patient Name: ' + scheduleData.name);
        scheduleData.vaccine = value?['Vaccine'];
        print('Before Function -> Vaccine: ' + scheduleData.vaccine);
        //assign to 1st dose dateSched to local
        scheduleData.dateScheduled = value?['Date'].toDate();

        print(
            'Patient last Schedule: ' + scheduleData.dateScheduled.toString());

        //get documents that have the same vaccine and are scheduled
        //after 2 weeks-1 month from the first dose
        //peek first matching documents if their current stock > 0
        // matches with vaccine and category
        await peekAvailableVaccine(fromMissed).then((value) async {
          //successfully assigned vaccineID to local, get vaccine from vaccine collection
          await vaccineColl.doc(scheduleData.vaccineID).get().then((docSnap) {
            Map<String, dynamic>? value = docSnap.data();
            scheduleData.vaccine = value?['Vaccine'];
            print('Vaccine is ' + scheduleData.vaccine);
            scheduleData.dateStart = value?['DateStart'].toDate();
            scheduleData.dateEnd = value?['DateEnd'].toDate();

            print('Local Date assigned is ' +
                scheduleData.dateStart.toString() +
                ' - ' +
                scheduleData.dateEnd.toString());
            scheduleData.cStock = value?['CurrentStock'];
            print('Cstock: ' + scheduleData.cStock.toString());
            scheduleData.maxStock = value?['MaxStock'];
            print('Maxstock: ' + scheduleData.maxStock.toString());
            scheduleData.vaccineID = value?['UID'];
            print('VaccineID: ' + scheduleData.vaccineID);
            print('Assign Available Vaccine Finished...(Return Vaccine)');
          }).catchError((error) => print(
              'Assign Available Vaccine Finished... (No vaccine): $error'));
        });
      });
    }).catchError((error) => print('Failed to get scheduled-user: $error'));
  }
}

Future<void> peekAvailableVaccine(bool fromMissed) async {
  print('peek vaccine Start');
  int? dateDifference;
  await vaccineColl
      .where('Category', isEqualTo: scheduleData.category)
      .get()
      .then((docSnap) {
    docSnap.docs.forEach((element) {
      dateDifference = 0;
      print('last schedule: ' + scheduleData.dateScheduled.toString());
      Map<String, dynamic>? value = element.data();
      dateDifference = value['DateStart']
          .toDate()
          .difference(scheduleData.dateScheduled)
          .inDays;

      print('date difference = $dateDifference');
      print('Vaccine Peek: ' + value['Vaccine']);
      if (value['Vaccine'] == scheduleData.vaccine &&
          value['CurrentStock'] > 0 &&
          //This makes sure that patients from the missed collection gets
          //assigned a week after their initial schedule
          fromMissed &&
          dateDifference! > 7) {
        scheduleData.vaccineID = value['UID'];

        print('Valid date difference = $dateDifference');
      } else if (value['Vaccine'] == scheduleData.vaccine &&
          value['CurrentStock'] > 0 &&
          dateDifference! > 14) {
        scheduleData.vaccineID = value['UID'];

        print('Valid date difference = $dateDifference');
      }
    });
  });
}

Future<void> assignASchedule() async {
  print('Assign a schedule started...');

  //current stock 99 : maxStock 100 : perDay 20 since 5 days
  int numberOfDays =
      scheduleData.dateEnd.difference(scheduleData.dateStart).inDays;
  print('Number of Days: $numberOfDays');
  double vaccineRatio = scheduleData.cStock / scheduleData.maxStock;
  print('Vaccine Ratio: $vaccineRatio');
  double dayProportion = numberOfDays * vaccineRatio;
  print('Day Proportion: $dayProportion');
  int scheduled_Add =
      numberOfDays - dayProportion.ceil(); //if first day it should be 0
  print('How much days to add to dateStart: $scheduled_Add');

  scheduleData.dateScheduled =
      scheduleData.dateStart.add(Duration(days: scheduled_Add));
  print('Date Scheduled for patient: ' + scheduleData.dateScheduled.toString());

  scheduleData.cStock -= 1;
  print('Current Stock: ' + scheduleData.cStock.toString());

  await updateStockData();

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

Future<void> setScheduleFirebase() async {
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
        'vaccineID': scheduleData.vaccineID,
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
