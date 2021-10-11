import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    @required this.label,
  }) : super(key: key);

  final label;
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? getLabel() {
    if (widget.label == 'bday') {
      return 'Birthday';
    } else if (widget.label == 'Diagnosed Date') {
      return 'Diagnosed Date';
    }
  }

  String? getText() {
    if (diagnosedDate == null && widget.label == 'Diagnosed Date') {
      return 'N/A';
    } else if (birthDate == null && widget.label == 'bday') {
      return '01/01/2000';
    } else if (widget.label == 'bday') {
      patient.bday = '${birthDate?.month}/${birthDate?.day}/${birthDate?.year}';
      return patient.bday;
    } else if (widget.label == 'Diagnosed Date') {
      patient.diagnosedDate =
          '${diagnosedDate?.month}/${diagnosedDate?.day}/${diagnosedDate?.year}';
      return patient.diagnosedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateLabel = getLabel().toString();
    String datePicked = getText().toString();
    String error = 'Please select date';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateLabel,
        ),
        InkWell(
          onTap: () {
            if (dateLabel == 'Diagnosed Date') {
              (diagnosed)
                  ? pickDate(context)
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please indicate Yes, if diagnosed with Covid',
                        ),
                      ),
                    );
            } else {
              pickDate(context);
            }
          },
          child: Container(
            margin: (dateLabel == 'Diagnosed Date')
                ? EdgeInsets.only(
                    top: 27,
                    bottom: 8,
                  )
                : EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: (initialState)
                      ? Colors.grey
                      : (datePicked == '01/01/2000' ||
                              (diagnosed && datePicked == 'N/A'))
                          ? Colors.red
                          : Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (dateLabel == 'Diagnosed Date')
                      ? (diagnosed)
                          ? datePicked
                          : 'N/A'
                      : datePicked,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
        Text(
          (initialState)
              ? ''
              : (datePicked == '01/01/2000' ||
                      (diagnosed && datePicked == 'N/A'))
                  ? error
                  : '',
          style: TextStyle(color: Colors.red.shade900, fontSize: 11),
        ),
      ],
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;

    setState(() {
      if (getLabel() == 'Birthday') {
        birthDate = newDate;
      } else if (getLabel() == 'Diagnosed Date') {
        diagnosedDate = newDate;
      }
    });
  }
}
