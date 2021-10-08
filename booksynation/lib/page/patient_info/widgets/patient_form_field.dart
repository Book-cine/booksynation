import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:flutter/material.dart';

class PatientFormField extends StatelessWidget {
  const PatientFormField({
    Key? key,
    @required this.label,
    required this.placeholder,
  }) : super(key: key);
  final label;
  final String placeholder;

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
          isDense: true,
          helperText: '',
          hintText: placeholder,
        ),
        onChanged: (value) {
          switch (label) {
            case 'First Name':
              patient.firstName = value;
              break;
            case 'Middle Name':
              patient.middleName = value;
              break;
            case 'Last Name':
              patient.lastName = value;
              break;
            case 'Suffix':
              patient.suffix = value;
              break;
            case 'Age':
              patient.age = value;
              break;
            case 'PHIC/Philhealth No. (If Applicable)':
              patient.philhealth = value;
              break;
            case 'Current Address':
              patient.address = value;
              break;
            case 'Zip':
              patient.zip = value;
              break;
            case 'Contact No.':
              patient.contact = value;
              break;
            case 'Email Address':
              patient.email = value;
              break;
            case 'Other Allergies:':
              patient.otherAllergies = value;
              break;
            case 'Others:':
              patient.others = value;
              break;
          }
        },
        validator: (value) {
          if (label == 'Suffix' ||
              label == 'PHIC/Philhealth No. (If Applicable)' ||
              label == 'Other Allergies:' ||
              label == 'Others:') {
            return null;
          } else if (value == null || value.isEmpty) {
            return 'This field is required.';
          } else {
            return null;
          }
        },
      ),
    ]);
  }
}
