import 'package:booksynation/page/patient_info/widgets/display_data.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _patientProfileForm(); // returns whole Profile form
  }

  Widget _patientProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
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
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: PatientFormField(label: 'Last Name'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 1,
                child: PatientFormField(label: 'Suffix'),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: PatientDropdown(dropList: gender, label: 'Gender'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 2,
                child: DatePicker(label: 'bday'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 1,
                child: PatientFormField(label: 'Age'),
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
                  label: 'Civil Status',
                ),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                flex: 2,
                child: PatientFormField(
                    label: 'PHIC/Philhealth No. (If Applicable)'),
                // TextFormField(
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.symmetric(
                //       vertical: 13,
                //     ),
                //     labelText: 'PHIC/Philhealth No. (If Applicable)',
                //     labelStyle: TextStyle(fontSize: 12),
                //   ),
                //   onChanged: (value) {
                //     docFields['philhealth'] = value;
                //   },
                // ),
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
                      })
                      .then((value) => print('Add User'))
                      .catchError(
                          (error) => print('Failed to add user: $error'));
                }
              },
              child: const Text('Submit'),
            ),
          ),
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
        ],
      ),
    );
  }
}

class PatientFormField extends StatelessWidget {
  const PatientFormField({Key? key, @required this.label}) : super(key: key);
  final label;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: (label == 'PHIC/Philhealth No. (If Applicable)')
            ? TextStyle(fontSize: 13)
            : null,
      ),
      TextFormField(
        decoration: InputDecoration(
          hintText: '$label',
          // labelStyle: (label == 'PHIC/Philhealth No. (If Applicable)')
          //     ? TextStyle(fontSize: 11)
          //     : null,
        ),
        onChanged: (value) {
          switch (label) {
            case 'First Name':
              docFields['firstname'] = value;
              break;
            case 'Middle Name':
              docFields['middlename'] = value;
              break;
            case 'Last Name':
              docFields['lastname'] = value;
              break;
            case 'Suffix':
              docFields['suffix'] = value;
              break;
            case 'Age':
              docFields['age'] = value;
              break;
            case 'PHIC/Philhealth No. (If Applicable)':
              docFields['philhealth'] = value;
              break;
          }
        },
        validator: (value) {
          if (label == 'Suffix' ||
              label == 'PHIC/Philhealth No. (If Applicable)') {
            return null;
          } else if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    ]);
  }
}

class PatientDropdown extends StatefulWidget {
  PatientDropdown({
    Key? key,
    @required this.dropList,
    @required this.label,
  }) : super(key: key);

  final dropList;
  final label;
  @override
  _PatientDropdownState createState() => _PatientDropdownState();
}

class _PatientDropdownState extends State<PatientDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Container(
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
                switch (widget.label) {
                  case 'Gender':
                    docFields['gender'] = value.toString();
                    break;
                  case 'Civil Status':
                    docFields['civstatus'] = value.toString();
                    break;
                }
              },
              items:
                  widget.dropList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    @required this.label,
  }) : super(key: key);

  final label;
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? getText() {
    if (date == null && widget.label == 'bday') {
      return 'Birthday';
    } else if (date == null && widget.label == 'Diagnosed Date') {
      return 'Diagnosed Date';
    } else if (widget.label == 'bday') {
      docFields['bday'] = '${date?.month}/${date?.day}/${date?.year}';
      return docFields['bday'];
    } else if (widget.label == 'Diagnosed Date') {
      docFields['diagnoseDate'] = '${date?.month}/${date?.day}/${date?.year}';
      return docFields['diagnoseDate'];
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateLabel = getText().toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateLabel,
        ),
        InkWell(
          onTap: () => pickDate(context),
          child: Container(
            padding: EdgeInsets.only(bottom: 10, top: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getText().toString(),
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
        ),
      ],
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
