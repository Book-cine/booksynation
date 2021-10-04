import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileData extends InheritedWidget {
  final String firstName;

  const ProfileData({
    Key? key,
    required this.firstName,
    required Widget child,
  }) : super(key: key, child: child);

  static String of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProfileData>()!.firstName;

  @override
  bool updateShouldNotify(ProfileData old) => firstName != old.firstName;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientFormField(label: 'First Name'),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: PatientFormField(label: 'Middle Name'),
            ),
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
    return ProfileData(
      firstName: '',
      child: Form(
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
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: PatientFormField(
                    label: 'Middle Name',
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
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 1,
                  child: PatientFormField(
                    label: 'Suffix',
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
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 2,
                  child: BirthdayPicker(),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 1,
                  child: PatientFormField(
                    label: 'Age',
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
                          'Submitting Your Data',
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
        // log('docField: $docField');
        // docField = value;
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
  }) : super(key: key);

  final dropList;
  late final docField;
  @override
  _PatientDropdownState createState() => _PatientDropdownState();
}

class _PatientDropdownState extends State<PatientDropdown> {
  String? dropdownValue;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
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
            // widget.docField = value;
          },
          items: widget.dropList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
  }
}

class BirthdayPicker extends StatefulWidget {
  const BirthdayPicker({Key? key}) : super(key: key);

  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'Birthdate';
    } else {
      return '${date?.month}/${date?.day}/${date?.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pickDate(context),
      child: Container(
        padding: EdgeInsets.only(bottom: 15, top: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getText(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
  }
}
