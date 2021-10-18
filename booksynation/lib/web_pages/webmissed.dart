import 'package:booksynation/web_pages/web_data/web_missed_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WebMissed extends StatefulWidget {
  WebMissed({Key? key}) : super(key: key);

  @override
  _WebMissedState createState() => _WebMissedState();
}

class _WebMissedState extends State<WebMissed> {
  String dropdownValue = 'All';
  List _selectedIndex = [];
  List<String> _selectedUserID = [];

  final Stream<QuerySnapshot> _missedStream =
      FirebaseFirestore.instance.collection('missed-sched').snapshots();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _selectedUserID.forEach((element) {
                            reschedMissedPatient(element);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2ED47A),
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
                        onPressed: () {
                          _selectedUserID.forEach((element) {
                            deleteMissedData(element);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF11010),
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
            Container(
              height: height - 100,
              width: width,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _missedStream,
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
                              showCheckboxColumn: true,
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
                              ],
                              rows: dropdownValue == 'All'
                                  ? snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      final DateFormat formatter =
                                          DateFormat('MM/dd/yyyy');

                                      String getDateString() {
                                        DateTime dateSched =
                                            data['DateSchedule'].toDate();
                                        String formattedStart =
                                            formatter.format(dateSched);
                                        return formattedStart;
                                      }

                                      return DataRow(
                                        selected: _selectedIndex
                                            .contains(data['Index']),
                                        onSelectChanged: (val) {
                                          setState(() {
                                            if (_selectedIndex
                                                .contains(data['Index'])) {
                                              _selectedIndex
                                                  .remove(data['Index']);
                                              _selectedUserID
                                                  .remove(data['UID']);
                                            } else {
                                              _selectedIndex.add(data['Index']);
                                              _selectedUserID.add(data['UID']);
                                            }
                                          });
                                        },
                                        cells: <DataCell>[
                                          DataCell(Container(
                                              child: Text(data['UID']))),
                                          DataCell(Container(
                                              child: Text(data['Name']))),
                                          DataCell(Container(
                                              child: Text(data['Email']))),
                                          DataCell(Container(
                                              child: Text(data['Vaccine']))),
                                          DataCell(Container(
                                              child: Text(data['Dosage']))),
                                          DataCell(Container(
                                              child: Text(data['Category']))),
                                          DataCell(Container(
                                              child: Text(getDateString()))),
                                        ],
                                      );
                                    }).toList()
                                  : snapshot.data!.docs
                                      .where((DocumentSnapshot document) =>
                                          (document.data()! as Map<String,
                                              dynamic>)['Vaccine'] ==
                                          dropdownValue)
                                      .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      final DateFormat formatter =
                                          DateFormat('MM/dd/yyyy');

                                      String getDateString() {
                                        DateTime dateSched =
                                            data['DateSchedule'].toDate();
                                        String formattedStart =
                                            formatter.format(dateSched);
                                        return formattedStart;
                                      }

                                      return DataRow(
                                        selected: _selectedIndex
                                            .contains(data['Index']),
                                        onSelectChanged: (val) {
                                          setState(() {
                                            if (_selectedIndex
                                                .contains(data['Index'])) {
                                              _selectedIndex
                                                  .remove(data['Index']);
                                              _selectedUserID
                                                  .remove(data['UID']);
                                            } else {
                                              _selectedIndex.add(data['Index']);
                                              _selectedUserID.add(data['UID']);
                                            }
                                          });
                                        },
                                        cells: <DataCell>[
                                          DataCell(Container(
                                              child: Text(data['UID']))),
                                          DataCell(Container(
                                              child: Text(data['Name']))),
                                          DataCell(Container(
                                              child: Text(data['Email']))),
                                          DataCell(Container(
                                              child: Text(data['Vaccine']))),
                                          DataCell(Container(
                                              child: Text(data['Dosage']))),
                                          DataCell(Container(
                                              child: Text(data['Category']))),
                                          DataCell(Container(
                                              child: Text(getDateString()))),
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
