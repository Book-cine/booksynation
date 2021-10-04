import 'package:booksynation/page/patient_info/widgets/contact_details.dart';
import 'package:booksynation/page/patient_info/widgets/essential_info.dart';
import 'package:booksynation/page/patient_info/widgets/patient_profile.dart';
import 'package:booksynation/sidemenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

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
        body: Container(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(25.0),
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
                    PatientProfile(height: height, width: width),
                    SizedBox(height: height * 0.10),
                    Text('Contact Details',
                        style: TextStyle(
                          fontSize: height * 0.024,
                          fontWeight: FontWeight.bold,
                        )),
                    ContactDetails(height: height, width: width),
                    SizedBox(height: height * 0.10),
                    Text('Essential Information',
                        style: TextStyle(
                          fontSize: height * 0.024,
                          fontWeight: FontWeight.bold,
                        )),
                    EssentialInfo(height: height, width: width),
                    SizedBox(height: height * 0.10),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
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
                            Navigator.pop(context);
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
