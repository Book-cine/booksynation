import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebSchedule extends StatefulWidget {
  WebSchedule({Key? key}) : super(key: key);

  @override
  _WebScheduleState createState() => _WebScheduleState();
}

class _WebScheduleState extends State<WebSchedule> {
  String dropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;

    return Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: width * 0.03,
              child: Container(
                height: 40,
                width: width - (width * 0.03),
                child: Row(
                  children: [
                    Container(
                      child: Text('Vaccine: ',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF334D6E))),
                    ),
                    SizedBox(
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
                          color: Color(0xFFCCCCCC),
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
                                style: TextStyle(
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
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: height - 50,
                width: width,
                child: Center(
                  child: Container(
                    width: width - (width * 0.03) - 30,
                    height: height - 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 18,
                          offset: Offset(0, 6), // changes position of shadow
                        )
                      ],
                    ),
                    child: DataTable(
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
                            DataCell(Text('19-4097-770')),
                            DataCell(Text('Nash Uriel A. Tapayan')),
                            DataCell(Text('tnashuriel@gmail.com')),
                            DataCell(Text('Astrazenica')),
                            DataCell(Text('2nd')),
                            DataCell(Text('A4')),
                            DataCell(Text('Sept 23, 2021')),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'images/check_icon.svg',
                                    color: Color(0xFF4ECB71),
                                    height: 25,
                                    width: 25,
                                  ),
                                  tooltip: 'Mark as finished',
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'images/reject_icon.svg',
                                    color: Color(0xFFF11010),
                                    height: 25,
                                    width: 25,
                                  ),
                                  tooltip: 'Mark as missed',
                                  onPressed: () {},
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
