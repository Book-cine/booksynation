import 'package:booksynation/sidemenu.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

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
    );
  }
}

class PatientProfile extends StatefulWidget {
  const PatientProfile({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Suffix',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Sex',
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Birthdate',
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Civil Status',
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'PHIC/Philhealth No. (If Applicable)',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactDetails extends StatefulWidget {
  const ContactDetails({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: widget.height * 0.010),
            TextField(
              decoration: InputDecoration(
                labelText: 'Current Address',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Region',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Province',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Barangay',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Zip',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Contact No.',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
          ],
        ),
      ],
    );
  }
}

class EssentialInfo extends StatefulWidget {
  const EssentialInfo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  State<EssentialInfo> createState() => _EssentialInfoState();
}

class _EssentialInfoState extends State<EssentialInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Covid-19 Classification',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Are you Employed?',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Are you Pregnant?',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Person with Disability (PWD)?',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            TextField(
              decoration: InputDecoration(
                labelText: 'Directly interacted with Covid-19 Patient?',
              ),
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Are you diagnosed with Covid-19?',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Diagnosed Date',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Allergies',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Comorbidities',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Other Allergies',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Other Allergies',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
