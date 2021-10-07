import 'package:booksynation/page/patient_info/widgets/display_data.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:flutter/material.dart';

class SaveChanges extends StatelessWidget {
  const SaveChanges({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
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
                .doc(docFields['uid'])
                .update({
                  'UID': docFields['uid'].toString(),
                  'FirstName': docFields['firstname'].toString(),
                  'MiddleName': docFields['middlename'].toString(),
                  'LastName': docFields['lastname'].toString(),
                  'Suffix': docFields['suffix'].toString(),
                  'Sex': docFields['gender'].toString(),
                  'Age': docFields['age'].toString(),
                  'Civil_Status': docFields['civstatus'].toString(),
                  'Philhealth_Num': docFields['philhealth'].toString(),
                  'Bday': docFields['bday'].toString(),
                  'Address': docFields['currentaddress'].toString(),
                  'Region': docFields['region'].toString(),
                  'Province': docFields['province'].toString(),
                  'City': docFields['city'].toString(),
                  'Barangay': docFields['brgy'].toString(),
                  'Zip': docFields['zip'].toString(),
                  'Contact_Num': docFields['contact'].toString(),
                  'Email': docFields['email'].toString(),
                  'Cov19_Classification': docFields['covclass'].toString(),
                  'Employment_Status': docFields['employed'].toString(),
                  'Pregnant': docFields['pregnant'].toString(),
                  'PWD': docFields['disability'].toString(),
                  'Covid_Interaction': docFields['interactedCovid'].toString(),
                  'Diagnosed_w_Covid': docFields['diagnosed'].toString(),
                  'Diagnosed_Date': docFields['diagnoseDate'].toString(),
                  'Allergies': allergies,
                  'Comorbidities': comorbidities,
                })
                .then((value) => print('Add User'))
                .catchError((error) => print('Failed to add user: $error'));
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DisplayData()),
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
