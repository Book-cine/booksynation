import 'package:booksynation/page/patient_info/widgets/date_picker.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_check_box.dart';
import 'package:booksynation/page/patient_info/widgets/patient_dropdown.dart';
import 'package:booksynation/page/patient_info/widgets/patient_form_field.dart';
import 'package:booksynation/strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return _essentialInfoForm();
  }

  Widget _essentialInfoForm() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientDropdown(
                dropList: covclass,
                label: covclassEssInfoLabel,
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: PatientDropdown(
                  dropList: yesOrNo, label: employedEssInfoLabel),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientDropdown(
                  dropList: yesOrNo, label: pregnantEssInfoLabel),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: PatientDropdown(
                  dropList: yesOrNo, label: disabilityEssInfoLabel),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.025),
        PatientDropdown(dropList: yesOrNo, label: interactCovidEssInfoLabel),
        SizedBox(height: widget.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PatientDropdown(
                  dropList: yesOrNo, label: diagnosedEssInfoLabel),
            ),
            SizedBox(width: widget.width * 0.015),
            Expanded(
              child: DatePicker(label: diagDateEssInfoLabel),
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
                  Text(allergiesEssInfoLabel, style: TextStyle(fontSize: 16)),
                  PatientCheckbox(label: allergyCheckDrug),
                  PatientCheckbox(label: allergyCheckFood),
                  PatientCheckbox(label: allergyCheckInsect),
                  PatientCheckbox(label: allergyCheckLatex),
                  PatientCheckbox(label: allergyCheckMold),
                  PatientCheckbox(label: allergyCheckPet),
                  PatientCheckbox(label: allergyCheckPollen),
                ],
              ),
            ),
            SizedBox(width: widget.width * 0.010),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comorbidEssInfoLabel, style: TextStyle(fontSize: 16)),
                  PatientCheckbox(label: comorbidCheckHypertension),
                  PatientCheckbox(label: comorbidCheckHeart),
                  PatientCheckbox(label: comorbidCheckKidney),
                  PatientCheckbox(label: comorbidCheckDiabetes),
                  PatientCheckbox(label: comorbidCheckAsthma),
                  PatientCheckbox(label: comorbidCheckImmunodeficieny),
                  PatientCheckbox(label: comorbidCheckCancer),
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
              child: PatientFormField(
                label: otherAllergyEssInfoLabel,
                placeholder: patient.otherAllergies,
              ),
            ),
            SizedBox(width: widget.width * 0.1),
            Expanded(
              child: PatientFormField(
                  label: othersEssInfoLabel, placeholder: patient.others),
            ),
          ],
        ),
      ],
    );
  }
}
