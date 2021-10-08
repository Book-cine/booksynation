import 'package:booksynation/page/patient_info/widgets/date_picker.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_dropdown.dart';
import 'package:booksynation/page/patient_info/widgets/patient_form_field.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientFormField(
                label: 'First Name',
                placeholder: patient.firstName,
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: PatientFormField(
                label: 'Middle Name',
                placeholder: patient.middleName,
              ),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: PatientFormField(
                label: 'Last Name',
                placeholder: patient.lastName,
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 1,
              child: PatientFormField(
                label: 'Suffix',
                placeholder: patient.suffix,
              ),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: PatientDropdown(
                dropList: gender,
                label: 'Gender',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 2,
              child: DatePicker(label: 'bday'),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 1,
              child: PatientFormField(
                label: 'Age',
                placeholder: patient.age,
              ),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
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
                label: 'PHIC/Philhealth No. (If Applicable)',
                placeholder: patient.philhealth,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
