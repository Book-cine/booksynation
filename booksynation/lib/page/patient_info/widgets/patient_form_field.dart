import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:flutter/material.dart';

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
          isDense: true,
          helperText: '',
          // hintText: 'Tap to edit',
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
            return 'This field is required';
          }
          return null;
        },
      ),
    ]);
  }
}
