import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
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

    List<ScheduleData> data = [
      ScheduleData('19-4097-770', 'Nash Uriel A. Tapayan',
          'tnashuriel@gmail.com', 'Astrazenica', '2nd', 'A4', 'Dec 12, 2021'),
      ScheduleData('19-40970-771', 'Mervin John Tampus', 'mervinjohn@gmail.com',
          'Pfizer', '1st', 'A3', 'Dec 15, 2021'),
    ];

    List<ScheduleData> filteredData = dropdownValue == 'All'
        ? data
        : data.where((data) => data.vaccine == dropdownValue).toList();
    return Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: width - (width * 0.03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
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
            Container(
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
                      color: Color(0xFFF7F7F7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 18,
                          offset: Offset(0, 6), // changes position of shadow
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
                        rows: filteredData.map((data) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Container(child: Text(data.uniqueId))),
                              DataCell(Container(child: Text(data.name))),
                              DataCell(Container(child: Text(data.email))),
                              DataCell(Container(child: Text(data.vaccine))),
                              DataCell(Container(child: Text(data.dosage))),
                              DataCell(Container(child: Text(data.category))),
                              DataCell(
                                  Container(child: Text(data.dateScheduled))),
                              DataCell(
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
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
