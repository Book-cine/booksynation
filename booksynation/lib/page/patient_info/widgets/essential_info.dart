
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
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Covid-19 Classification',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Are you Employed?',
                    ),
                  ),
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
                      labelText: 'Are you Pregnant?',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Person with Disability (PWD)?',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
            TextField(
              decoration: InputDecoration(
                labelText: 'Directly interacted with Covid-19 Patient?',
              ),
            ),
            SizedBox(height: widget.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Are you diagnosed with Covid-19?',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Diagnosed Date',
                    ),
                  ),
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
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Other Allergies',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Other Allergies',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
