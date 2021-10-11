import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_dropdown.dart';
import 'package:booksynation/page/patient_info/widgets/patient_form_field.dart';
import 'package:flutter/material.dart';

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
        SizedBox(height: widget.height * 0.010),
        PatientFormField(
          label: 'Current Address',
          placeholder: patient.address,
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientDropdown(
                dropList: region,
                label: 'Region',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: PatientDropdown(
                dropList: province,
                label: 'Province',
              ),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: PatientDropdown(
                dropList: city,
                label: 'City',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 2,
              child: PatientDropdown(
                dropList: brgy,
                label: 'Barangay',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 1,
              child: PatientFormField(
                label: 'Zip',
                placeholder: patient.zip,
              ),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: PatientFormField(
                label: 'Contact No.',
                placeholder: patient.contact,
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              flex: 3,
              child: PatientFormField(
                label: 'Email Address',
                placeholder: patient.email,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
