import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_profile.dart';
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
          Column(
            children: [
              SizedBox(height: widget.height * 0.010),
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
              SizedBox(height: widget.height * 0.010),
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
              SizedBox(height: widget.height * 0.010),
              PatientDropdown(
                  dropList: yesOrNo,
                  label: 'Directly interacted with Covid-19 Patient?'),
              SizedBox(height: widget.height * 0.010),
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
              SizedBox(height: widget.height * 0.010),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Allergies',
                      ),
                    ),
                  ),
                  SizedBox(width: widget.width * 0.015),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Comorbidities',
                      ),
                    ),
                  ),
                  SizedBox(width: widget.width * 0.015),
                ],
              ),
              SizedBox(height: widget.height * 0.010),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PatientFormField(label: 'Other Allergies'),
                  ),
                  SizedBox(width: widget.width * 0.015),
                  Expanded(
                    child: PatientFormField(label: 'Other Allergies'),
                  ),
                  SizedBox(width: widget.width * 0.015),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
