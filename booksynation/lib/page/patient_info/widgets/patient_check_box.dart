import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
        allergies.remove(label);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            value: value,
            activeColor: Colors.blueAccent,
            onChanged: (bool? newValue) {
              onChanged(newValue);
              switch (label) {
                case 'Drug':
                case 'Food':
                case 'Insect':
                case 'Latex':
                case 'Mold':
                case 'Pet':
                case 'Pollen':
                  (newValue == true)
                      ? allergies.add(label)
                      : allergies.remove(label);
                  break;
                default:
                  (newValue == true)
                      ? comorbidities.add(label)
                      : comorbidities.remove(label);
                  break;
              }
            },
          ),
          Expanded(child: Text(label, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class PatientCheckbox extends StatefulWidget {
  const PatientCheckbox({
    Key? key,
    @required this.label,
  }) : super(key: key);
  final label;
  @override
  State<PatientCheckbox> createState() => _PatientCheckboxState();
}

/// This is the private State class that goes with PatientCheckbox.
class _PatientCheckboxState extends State<PatientCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: widget.label,
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
