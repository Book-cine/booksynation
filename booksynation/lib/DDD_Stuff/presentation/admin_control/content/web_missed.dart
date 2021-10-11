import 'package:flutter/material.dart';

class WebMissed extends StatefulWidget {
  const WebMissed({Key? key}) : super(key: key);

  @override
  _WebMissedState createState() => _WebMissedState();
}

class _WebMissedState extends State<WebMissed> {
  String dropdownValue = 'All';
  List<bool> _selectedIndex = [false, false];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    return SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: width - (width * 0.03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text('Vaccine: ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Color(0xFF334D6E))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 18,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFF109CF1)),
                          underline: Container(
                            height: 2,
                            color: const Color(0xFFCCCCCC),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'All',
                            'Astrazenica',
                            'Janssen',
                            'Moderna',
                            'Pfizer',
                            'Sinovac'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Color(0xFF109CF1))),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF2ED47A),
                          fixedSize: Size(
                            width * 0.15,
                            height * 0.045,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Reschedule Patient',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.018,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF11010),
                          fixedSize: Size(
                            width * 0.15,
                            height * 0.045,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Remove Patient',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.018,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height - 100,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width - (width * 0.035),
                    height: height - 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 18,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        showCheckboxColumn: true,
                        columnSpacing: width / 1000,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Unique ID',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Email',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Vaccine',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Dosage',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Category',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Date Scheduled',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            selected: true == _selectedIndex[0],
                            onSelectChanged: (val) {
                              setState(() {
                                _selectedIndex[0] = !_selectedIndex[0];
                              });
                            },
                            cells: const <DataCell>[
                              DataCell(Text('19-4097-770')),
                              DataCell(Text('Nash Uriel A. Tapayan')),
                              DataCell(Text('tnashuriel@gmail.com')),
                              DataCell(Text('Astrazenica')),
                              DataCell(Text('2nd')),
                              DataCell(Text('A4')),
                              DataCell(Text('Sept 23, 2021')),
                            ],
                          ),
                          DataRow(
                            selected: true == _selectedIndex[1],
                            onSelectChanged: (val) {
                              setState(() {
                                _selectedIndex[1] = !_selectedIndex[1];
                              });
                            },
                            cells: const <DataCell>[
                              DataCell(Text('19-4097-771')),
                              DataCell(Text('Mervin John Tampus')),
                              DataCell(Text('mervinjohn@gmail.com')),
                              DataCell(Text('Pfizer')),
                              DataCell(Text('1st')),
                              DataCell(Text('A2')),
                              DataCell(Text('Sept 24, 2021')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
