import 'package:booksynation/page/patient_info/widgets/contact_details.dart';
import 'package:booksynation/page/patient_info/widgets/essential_info.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
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
