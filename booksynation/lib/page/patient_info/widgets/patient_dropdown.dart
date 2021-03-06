import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:flutter/material.dart';

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
  String error = 'Select option';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Container(
          height: 35,
          margin: EdgeInsets.only(
            bottom: 7,
          ),
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: (initialState)
                    ? Colors.grey
                    : (dropdownValue == null)
                        ? Colors.red
                        : Colors.grey,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 20,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
              onChanged: (value) {
                setState(() {
                  this.dropdownValue = value;
                });
                switch (widget.label) {
                  case 'Gender':
                    patient.sex = value.toString();
                    break;
                  case 'Civil Status':
                    patient.civStatus = value.toString();
                    break;
                  case 'Region':
                    patient.region = value.toString();
                    break;
                  case 'Province':
                    patient.province = value.toString();
                    break;
                  case 'City':
                    patient.city = value.toString();
                    break;
                  case 'Barangay':
                    patient.brgy = value.toString();
                    break;
                  case 'Patient Classification':
                    patient.covclass = value.toString();
                    break;
                  case 'Are you Employed?':
                    patient.employed = value.toString();
                    break;
                  case 'Are you Pregnant?':
                    patient.pregnant = value.toString();
                    break;
                  case 'Person with Disability?':
                    patient.disability = value.toString();
                    break;
                  case 'Directly interacted with Covid-19 Patient?':
                    patient.interactedCovid = value.toString();
                    break;
                  case 'Are you diagnosed with Covid-19?':
                    if (value == 'Yes') {
                      diagnosed = true;
                    } else {
                      diagnosed = false;
                    }
                    patient.isDiagnosed = value.toString();
                    break;
                }
              },
              items:
                  widget.dropList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Text(
          (initialState)
              ? ''
              : (dropdownValue == null)
                  ? error
                  : '',
          style: TextStyle(color: Colors.red.shade900, fontSize: 11),
        ),
      ],
    );
  }
}
