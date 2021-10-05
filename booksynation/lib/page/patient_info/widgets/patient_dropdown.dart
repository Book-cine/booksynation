import 'package:booksynation/page/patient_info/widgets/infoData.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Container(
          height: 35,
          margin: EdgeInsets.only(
            bottom: 22,
          ),
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey),
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
                setState(() => this.dropdownValue = value);
                switch (widget.label) {
                  case 'Gender':
                    docFields['gender'] = value.toString();
                    break;
                  case 'Civil Status':
                    docFields['civstatus'] = value.toString();
                    break;
                  case 'Are you diagnosed with Covid-19?':
                    if (value == 'Yes') {
                      diagnosed = true;
                    } else {
                      diagnosed = false;
                    }
                    break;
                }
              },
              items:
                  widget.dropList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}