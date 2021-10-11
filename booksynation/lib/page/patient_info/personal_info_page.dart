import 'package:booksynation/page/patient_info/widgets/contact_details.dart';
import 'package:booksynation/page/patient_info/widgets/essential_info.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_profile.dart';
import 'package:booksynation/page/patient_info/widgets/save_changes_button.dart';
import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black87),
          ),
        ),
        drawer: SideMenu(),
        body: PesonalInfoBody(height: height, width: width),
      ),
    );
  }
}

class PesonalInfoBody extends StatelessWidget {
  const PesonalInfoBody({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    if (patient.fillStatus) {
      return LockedPersonalInfo(height: height, width: width);
    } else {
      return UnlockedPersonalInfo(height: height, width: width);
    }
  }
}

class UnlockedPersonalInfo extends StatelessWidget {
  const UnlockedPersonalInfo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                PatientProfile(height: height, width: width),
                SizedBox(height: height * 0.03),
                Text('Contact Details',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                ContactDetails(height: height, width: width),
                SizedBox(height: height * 0.03),
                Text('Essential Information',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                EssentialInfo(height: height, width: width),
                SizedBox(height: height * 0.1),
                Align(
                  alignment: Alignment.center,
                  child: SaveChanges(width: width, height: height),
                ),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Please ko Mervin sa kani na part if makaya pa kay murag list lang sa personal info from the forms mao nani katong locked mode sa forms.
class LockedPersonalInfo extends StatelessWidget {
  const LockedPersonalInfo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    List patientData = [
      Text('First Name: ' + patient.firstName),
      Text('Middle Name: ' + patient.middleName),
      Text('Last Name: ' + patient.lastName),
      Text('Suffix: ' + patient.suffix),
      Text('Sex: ' + patient.sex),
      Text('Bday: ' + patient.bday),
      Text('Age: ' + patient.age),
      Text('Civil Status: ' + patient.civStatus),
      Text('Philhealth: ' + patient.philhealth),
      Text('Address: ' + patient.address),
      Text('Region: ' + patient.region),
      Text('Province: ' + patient.province),
      Text('City: ' + patient.city),
      Text('Barangay: ' + patient.brgy),
      Text('Zip: ' + patient.zip),
      Text('Contact Num: ' + patient.contact),
      Text('Email Address: ' + patient.email),
      Text('Cov19 Classification: ' + patient.covclass),
      Text('Employed? : ' + patient.employed),
      Text('Pregnant? : ' + patient.pregnant),
      Text('PWD: ' + patient.disability),
      Text('Interacted Covid: ' + patient.interactedCovid),
      Text('Diagnosed with Covid: ' + patient.isDiagnosed),
      Text('Diagnosed Date: ' + patient.diagnosedDate),
      Text('Allergies: '),
      for (var item in patient.allergies) Text(item),
      Text('Comorbidities: '),
      for (var item in patient.comorbidities) Text(item),
      // Text('Other Allergies: ' + patient.otherAllergies),
      // Text('Other Comorbidities: ' + patient.others),
    ];
    return SafeArea(
      child: Scaffold(
        //TODO: Please ko Mervin sa kani na part if makaya pa kay murag list lang sa personal info from the forms mao nani katong locked mode sa forms.
        drawer: SideMenu(),
        body: ListView.builder(
            itemCount: patientData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: patientData[index],
              );
            }),
      ),
    );
  }
}
