import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebSchedule extends StatefulWidget {
  const WebSchedule({Key? key}) : super(key: key);

  @override
  _WebScheduleState createState() => _WebScheduleState();
}

class _WebScheduleState extends State<WebSchedule> {
  String dropdownValue = 'All';
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
                  const Text('Vaccine: ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF334D6E))),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
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
                          DataColumn(
                            label: Text(''),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              const DataCell(Text('19-4097-770')),
                              const DataCell(Text('Nash Uriel A. Tapayan')),
                              const DataCell(Text('tnashuriel@gmail.com')),
                              const DataCell(Text('Astrazenica')),
                              const DataCell(Text('2nd')),
                              const DataCell(Text('A4')),
                              const DataCell(Text('Sept 23, 2021')),
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'images/check_icon.svg',
                                        color: const Color(0xFF4ECB71),
                                        height: 25,
                                        width: 25,
                                      ),
                                      tooltip: 'Mark as finished',
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'images/reject_icon.svg',
                                        color: const Color(0xFFF11010),
                                        height: 25,
                                        width: 25,
                                      ),
                                      tooltip: 'Mark as missed',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              const DataCell(Text('19-4097-771')),
                              const DataCell(Text('Mervin John Tampus')),
                              const DataCell(Text('mervinjohn@gmail.com')),
                              const DataCell(Text('Pfizer')),
                              const DataCell(Text('1st')),
                              const DataCell(Text('A2')),
                              const DataCell(Text('Sept 24, 2021')),
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'images/check_icon.svg',
                                        color: const Color(0xFF4ECB71),
                                        height: 25,
                                        width: 25,
                                      ),
                                      tooltip: 'Mark as finished',
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'images/reject_icon.svg',
                                        color: const Color(0xFFF11010),
                                        height: 25,
                                        width: 25,
                                      ),
                                      tooltip: 'Mark as missed',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
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
