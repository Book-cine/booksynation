import 'package:booksynation/page/patient_info/widgets/display_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayData(users: users)),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF26A98A),
                fixedSize: Size(
                  widget.width * 0.45,
                  widget.height * 0.060,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: Text(
                'Display Data',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  fontSize: widget.height * 0.018,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: widget.height * 0.010),
            MyCustomForm(height: widget.height, width: widget.width),
          ],
        ),
      ],
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({
    Key? key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final height;
  final width;

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  var firstName = '';
  var middleName = '';
  var lastName = '';
  var suffix = '';
  var age = '';
  var philhealth = '';
  var gender = [
    "Male",
    "Female",
  ];
  var sex = '';
  var civstatus = [
    "Single",
    "Married",
  ];
  var civstat = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PatientFormField(
                  label: 'First Name',
                  docField: firstName,
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                child: PatientFormField(
                  label: 'Middle Name',
                  docField: middleName,
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
                child: PatientFormField(
                  label: 'Last Name',
                  docField: lastName,
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 1,
                child: PatientFormField(
                  label: 'Suffix',
                  docField: suffix,
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
                child: PatientDropdown(
                  dropList: gender,
                  docField: sex,
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
                child: PatientFormField(
                  label: 'Age',
                  docField: age,
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
                child: PatientDropdown(
                  dropList: civstatus,
                  docField: civstat,
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 13,
                    ),
                    labelText: 'PHIC/Philhealth No. (If Applicable)',
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                  onChanged: (value) {
                    philhealth = value;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Sending Data to Cloud Firestore',
                      ),
                    ),
                  );

                  users
                      .add({
                        'firstname': firstName,
                        'middlename': middleName,
                        'lastname': lastName,
                        'suffix': suffix,
                        'gender': sex,
                        'age': age,
                        'civstatus': civstat,
                        'philhealth': philhealth,
                      })
                      .then((value) => print('Add User'))
                      .catchError(
                          (error) => print('Failed to add user: $error'));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

//TextFormField
@immutable
class PatientFormField extends StatelessWidget {
  PatientFormField({
    Key? key,
    @required this.label,
    @required this.docField,
  }) : super(key: key);

  final label;
  late final docField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '$label',
      ),
      onChanged: (value) {
        docField = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

class PatientDropdown extends StatefulWidget {
  PatientDropdown({
    Key? key,
    @required this.dropList,
    @required this.docField,
  }) : super(key: key);

  final dropList;
  late final docField;
  @override
  _PatientDropdownState createState() => _PatientDropdownState();
}

class _PatientDropdownState extends State<PatientDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 20,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey.shade700,
      ),
      underline: Container(
        height: 1,
        color: Colors.grey,
      ),
      onChanged: (value) {
        setState(() => this.dropdownValue = value);
        widget.docField = value;
      },
      items: widget.dropList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
