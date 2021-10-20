import 'package:booksynation/page/booksched.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/web_pages/web_data/assign_vaccine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SaveChanges extends StatelessWidget {
  const SaveChanges({
    Key? key,
    required this.auth,
    @required this.currentUser,
    required this.width,
    required this.height,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;
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

          allergies.add(patient.otherAllergies);
          comorbidities.add(patient.others);

          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Submitting Your Data',
                ),
              ),
            );

            fillStatus = true;
            patient.fillStatus = fillStatus;
            updatePatientData();
            fullname = patient.firstName +
                ' ' +
                patient.lastName +
                ' ' +
                ((patient.suffix == 'N/A') ? '' : patient.suffix);
            User? user = FirebaseAuth.instance.currentUser;
            print("CurrentUser:" + user.toString());
            createScheduleVaccine(user);

            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookSchedule(
                          auth: auth,
                          currentUser: currentUser,
                        )),
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
