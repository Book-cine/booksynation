import 'package:booksynation/page/patient_info/widgets/display_data.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SaveChanges extends StatelessWidget {
  const SaveChanges({
    Key? key,
    required this.width,
    required this.users,
    required this.height,
  }) : super(key: key);

  final double width;
  final Stream<QuerySnapshot<Object?>> users;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.65,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF1D74E9).withOpacity(0.16),
          blurRadius: 8,
          offset: Offset(0, 4), // changes position of shadow
        ),
      ]),
      child: ElevatedButton(
        onPressed: () {
          initialState = false;

          allergies.add(docFields['otherallergies'].toString());
          comorbidities.add(docFields['others'].toString());

          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Submitting Your Data',
                ),
              ),
            );
            userCollection
                .add({
                  'firstname': docFields['firstname'].toString(),
                  'middlename': docFields['middlename'].toString(),
                  'lastname': docFields['lastname'].toString(),
                  'suffix': docFields['suffix'].toString(),
                  'gender': docFields['gender'].toString(),
                  'age': docFields['age'].toString(),
                  'civstatus': docFields['civstatus'].toString(),
                  'philhealth': docFields['philhealth'].toString(),
                  'bday': docFields['bday'].toString(),
                  'currentaddress': docFields['currentaddress'].toString(),
                  'region': docFields['region'].toString(),
                  'province': docFields['province'].toString(),
                  'city': docFields['city'].toString(),
                  'brgy': docFields['brgy'].toString(),
                  'zip': docFields['zip'].toString(),
                  'contact': docFields['contact'].toString(),
                  'email': docFields['email'].toString(),
                  'covclass': docFields['covclass'].toString(),
                  'employed': docFields['employed'].toString(),
                  'pregnant': docFields['pregnant'].toString(),
                  'disability': docFields['disability'].toString(),
                  'interactedCovid': docFields['interactedCovid'].toString(),
                  'diagnoseDate': docFields['diagnoseDate'].toString(),
                  'allergies': allergies,
                  'comorbidities': comorbidities,
                })
                .then((value) => print('Add User'))
                .catchError((error) => print('Failed to add user: $error'));
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayData(users: users)),
              );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Please review the fields before submitting.',
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[700],
          fixedSize: Size(
            width * 0.65,
            height * 0.060,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
            fontSize: height * 0.018,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
