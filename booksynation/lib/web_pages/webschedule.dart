import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class WebSchedule extends StatefulWidget {
  WebSchedule({Key? key}) : super(key: key);

  @override
  _WebScheduleState createState() => _WebScheduleState();
}

class _WebScheduleState extends State<WebSchedule> {
  String dropdownValue = 'All';

  final Stream<QuerySnapshot> _scheduledStream =
      FirebaseFirestore.instance.collection('scheduled-users').snapshots();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    List<ScheduleData> data = [
      // ScheduleData(
      //   uniqueId: '19-4097-770',
      //   name: 'Nash Uriel A. Tapayan',
      //   email: 'tnashuriel@gmail.com',
      //   vaccine: 'Astrazenica',
      //   dosage: '2nd',
      //   category: 'A4',
      //   dateScheduled: DateTime(2021, 12, 12),
      // ),
      // ScheduleData(
      //   uniqueId: '19-40970-771',
      //   name: 'Mervin John Tampus',
      //   email: 'mervinjohn@gmail.com',
      //   vaccine: 'Pfizer',
      //   dosage: '1st',
      //   category: 'A3',
      //   dateScheduled: DateTime(2021, 12, 15),
      // ),
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: _scheduledStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          width: width * 0.10,
                          height: height * 0.10,
                          child: CircularProgressIndicator(
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                        ),
                      );
                    }

                    return Column(
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
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
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Email',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Vaccine',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Dosage',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Category',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Date Scheduled',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              rows: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                // filteredData.map((data) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;

                                // final DateFormat formatter =
                                //     DateFormat('MM/dd/yy');
                                // String getDateString() {
                                //   DateTime dateSched =
                                //       data['Date'];
                                //   String formattedStart =
                                //       formatter.format(dateSched);
                                //   return formattedStart;
                                // }

                                return DataRow(
                                  cells: <DataCell>[
                                    DataCell(Container(
                                        child: Text(data['uniqueID']))),
                                    DataCell(
                                        Container(child: Text(data['Name']))),
                                    DataCell(
                                        Container(child: Text(data['Email']))),
                                    DataCell(Container(
                                        child: Text(data['Vaccine']))),
                                    DataCell(
                                        Container(child: Text(data['Dosage']))),
                                    DataCell(Container(
                                        child: Text(data['Category']))),
                                    DataCell(
                                        Container(child: Text(data['Date']))),
                                    DataCell(
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                    );
                  }),
            ),
          ],
        ));
  }
}
