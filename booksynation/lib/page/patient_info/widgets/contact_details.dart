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
        Column(
          children: [
            SizedBox(height: widget.height * 0.010),
            TextField(
              decoration: InputDecoration(
                labelText: 'Current Address',
              ),
            ),
            SizedBox(width: widget.width * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Region',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Province',
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
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Barangay',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Zip',
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
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Contact No.',
                    ),
                  ),
                ),
                SizedBox(width: widget.width * 0.015),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.010),
          ],
        ),
      ],
    );
  }
}
