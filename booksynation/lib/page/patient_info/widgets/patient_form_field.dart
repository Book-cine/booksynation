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
              // docFields['firstname'] = value;
              patient.firstName = value;
              print('First name: ' + patient.firstName);
              break;
            case 'Middle Name':
              // docFields['middlename'] = value;
              patient.middleName = value;
              break;
            case 'Last Name':
              // docFields['lastname'] = value;
              patient.lastName = value;
              break;
            case 'Suffix':
              // docFields['suffix'] = value;
              patient.suffix = value;
              break;
            case 'Age':
              // docFields['age'] = value;
              patient.age = value;
              break;
            case 'PHIC/Philhealth No. (If Applicable)':
              // docFields['philhealth'] = value;
              patient.philhealth = value;
              break;
            case 'Current Address':
              // docFields['currentaddress'] = value;
              patient.address = value;
              break;
            case 'Zip':
              // docFields['zip'] = value;
              patient.zip = value;
              break;
            case 'Contact No.':
              // docFields['contact'] = value;
              patient.contact = value;
              break;
            case 'Email Address':
              // docFields['email'] = value;
              patient.email = value;
              break;
            case 'Other Allergies:':
              // docFields['otherallergies'] = value;
              patient.otherAllergies = value;
              break;
            case 'Others:':
              // docFields['others'] = value;
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
