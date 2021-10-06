import 'package:booksynation/page/patient_info/widgets/infoData.dart';
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
    if (date == null && widget.label == 'Diagnosed Date') {
      return 'N/A';
    } else if (date == null && widget.label == 'bday') {
      return '01/01/2000';
    } else if (widget.label == 'bday') {
      docFields['bday'] = '${date?.month}/${date?.day}/${date?.year}';
      return docFields['bday'];
    } else if (widget.label == 'Diagnosed Date') {
      docFields['diagnoseDate'] = '${date?.month}/${date?.day}/${date?.year}';
      return docFields['diagnoseDate'];
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateLabel = getLabel().toString();
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
                    bottom: 23,
                  )
                : EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getText().toString(),
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
      date = newDate;
    });
  }
}
