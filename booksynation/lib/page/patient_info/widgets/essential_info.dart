import 'package:booksynation/page/patient_info/widgets/date_picker.dart';
import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_check_box.dart';
import 'package:booksynation/page/patient_info/widgets/patient_dropdown.dart';
import 'package:booksynation/page/patient_info/widgets/patient_form_field.dart';
import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return _essentialInfoForm();
  }

  Widget _essentialInfoForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PatientDropdown(
                    dropList: covclass, label: 'Covid-19 Classification'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                child: PatientDropdown(
                    dropList: yesOrNo, label: 'Are you Employed?'),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PatientDropdown(
                    dropList: yesOrNo, label: 'Are you Pregnant?'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                child: PatientDropdown(
                    dropList: yesOrNo, label: 'Person with Disability?'),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.025),
          PatientDropdown(
              dropList: yesOrNo,
              label: 'Directly interacted with Covid-19 Patient?'),
          SizedBox(height: widget.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PatientDropdown(
                    dropList: yesOrNo,
                    label: 'Are you diagnosed with Covid-19?'),
              ),
              SizedBox(width: widget.width * 0.015),
              Expanded(
                child: DatePicker(label: 'Diagnosed Date'),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Allergies', style: TextStyle(fontSize: 16)),
                    PatientCheckbox(label: 'Drug'),
                    PatientCheckbox(label: 'Food'),
                    PatientCheckbox(label: 'Insect'),
                    PatientCheckbox(label: 'Latex'),
                    PatientCheckbox(label: 'Mold'),
                    PatientCheckbox(label: 'Pet'),
                    PatientCheckbox(label: 'Pollen'),
                  ],
                ),
              ),
              SizedBox(width: widget.width * 0.010),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Comorbidities', style: TextStyle(fontSize: 16)),
                    PatientCheckbox(label: 'Hypertension'),
                    PatientCheckbox(label: 'Heart Disease'),
                    PatientCheckbox(label: 'Kidney Disease'),
                    PatientCheckbox(label: 'Diabetes'),
                    PatientCheckbox(label: 'Asthma'),
                    PatientCheckbox(label: 'Immunodeficiency'),
                    PatientCheckbox(label: 'Cancer'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: widget.width * 0.1),
              Expanded(
                child: PatientFormField(label: 'Other Allergies:'),
              ),
              SizedBox(width: widget.width * 0.1),
              Expanded(
                child: PatientFormField(label: 'Others:'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
