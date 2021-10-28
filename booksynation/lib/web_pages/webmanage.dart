import 'package:booksynation/loading.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
import 'package:booksynation/web_pages/web_data/web_vax_status_data.dart';
import 'package:booksynation/web_pages/web_manage/web_manage_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WebManage extends StatefulWidget {
  WebManage({Key? key}) : super(key: key);

  @override
  _WebManageState createState() => _WebManageState();
}

class _WebManageState extends State<WebManage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('vaccine').snapshots();

  final Stream<QuerySnapshot> _stockStream =
      FirebaseFirestore.instance.collection('vaccine-stock').snapshots();

  final Stream<QuerySnapshot> _bookedStream =
      FirebaseFirestore.instance.collection('scheduled-users').snapshots();
  final Stream<QuerySnapshot> _completedStream =
      FirebaseFirestore.instance.collection('completed-users').snapshots();
  final Stream<QuerySnapshot> _missedStream =
      FirebaseFirestore.instance.collection('missed-sched').snapshots();
  final Stream<QuerySnapshot> _removedStream =
      FirebaseFirestore.instance.collection('removed-users').snapshots();

  int booked = 0;
  int completed = 0;
  int missed = 0;
  int removed = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;

    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Spacer(flex: 2),
          WebManageHeader(),
          Spacer(flex: 2),
          Expanded(
            flex: 40,
            child: Container(
              child: Row(
                children: [
                  Spacer(flex: 1),
                  Expanded(
                    flex: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xFFF7F9FA),
                      ),
                      child: buildTable(width, height),
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 30,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 20,
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 30, left: 30, right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xFFF7F9FA),
                                ),
                                child: buildScheduler(width, height)),
                          ),
                          Spacer(flex: 1),
                          getFooterDataBooked(),
                          // buildFooterUpdates(),
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  StreamBuilder getFooterDataBooked() {
    return StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
      return StreamBuilder<QuerySnapshot>(
          stream: _bookedStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(somethingWrongSnackbar);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }
            booked = 0;
            snapshot.data!.docChanges.forEach((element) {
              booked++;
            });
            return getFooterDataCompleted();
          });
    });
  }

  StreamBuilder getFooterDataCompleted() {
    return StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
      return StreamBuilder<QuerySnapshot>(
          stream: _completedStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(somethingWrongSnackbar);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }

            completed = 0;
            snapshot.data!.docChanges.forEach((element) {
              completed++;
            });
            return getFooterDataMissed();
          });
    });
  }

  StreamBuilder getFooterDataMissed() {
    return StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
      return StreamBuilder<QuerySnapshot>(
          stream: _missedStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(somethingWrongSnackbar);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }
            missed = 0;
            snapshot.data!.docChanges.forEach((element) {
              missed++;
            });
            return getFooterDataRemoved();
          });
    });
  }

  StreamBuilder getFooterDataRemoved() {
    return StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
      return StreamBuilder<QuerySnapshot>(
          stream: _removedStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(somethingWrongSnackbar);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }
            removed = 0;
            snapshot.data!.docChanges.forEach((element) {
              removed++;
            });
            return buildFooterUpdates();
          });
    });
  }

  Widget buildFooterUpdates() {
    StatusData statusData = StatusData(booked, completed, missed, removed);

    return Expanded(
      flex: 20,
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFF7F9FA),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(bookedManageText,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xFF000000))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                              statusData.booked.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 40,
                                                  color: Color(0xFF6A93DD))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFF7F9FA),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(completedManageText,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xFF000000))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                              statusData.completed.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 40,
                                                  color: Color(0xFF87B593))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFF7F9FA),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(missedManageText,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xFF000000))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                              statusData.rescheduled.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 40,
                                                  color: Color(0xFFDAAC51))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Expanded(
                            flex: 10,
                            child: Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFF7F9FA),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(removedManageText,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xFF000000))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                              statusData.cancelled.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 40,
                                                  color: Color(0xFFDE7D7D))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTable(final width, final height) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(somethingWrongSnackbar);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      dateManageLabel,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      stockManageLabel,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      categoryManageLabel,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      vaccineManageLabel,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      actionsManageLabel,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  final DateFormat formatter = DateFormat('MM/dd/yy');
                  String getDateStart() {
                    DateTime dateStart = (data['DateStart']).toDate();
                    String formattedStart = formatter.format(dateStart);
                    return formattedStart;
                  }

                  String getDateEnd() {
                    DateTime dateEnd = (data['DateEnd']).toDate();
                    String formattedEnd = formatter.format(dateEnd);
                    return formattedEnd;
                  }

                  return DataRow(cells: [
                    DataCell(
                      Container(
                        child: Text(getDateStart() + ' - ' + getDateEnd()),
                      ),
                    ),
                    DataCell(Container(
                        child: Text(data['CurrentStock'].toString() +
                            '/' +
                            data['MaxStock'].toString()))),
                    DataCell(Container(child: Text(data['Category']))),
                    DataCell(Container(child: Text(data['Vaccine']))),
                    DataCell(
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                vaccineData.uniqueId = data['UID'];
                                vaccineData.dateStart =
                                    (data['DateStart']).toDate();
                                vaccineData.dateEnd =
                                    (data['DateEnd']).toDate();
                                vaccineData.category = data['Category'];
                                vaccineData.stock = data['MaxStock'];
                                vaccineData.vaccine = data['Vaccine'];
                                vaccineData.isCreated = true;
                                maxStockData.mStock = data['MaxStock'];
                                maxStockData.cStock = data['CurrentStock'];
                                setState(() {
                                  schedulerData.dateStart =
                                      (data['DateStart']).toDate();
                                  schedulerData.dateEnd =
                                      (data['DateEnd']).toDate();
                                  schedulerData.category = data['Category'];
                                  schedulerData.initialText = null;
                                  schedulerData.stock = TextEditingController(
                                      text: data['MaxStock'].toString());
                                  schedulerData.vaccine = data['Vaccine'];
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFFFFFF),
                                fixedSize: Size(
                                  width * 0.085,
                                  height * 0.035,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              child: Text(
                                editText,
                                style: TextStyle(
                                  color: Color(0xFF242731),
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.018,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildScheduler(final width, final height) {
    return StreamBuilder<QuerySnapshot>(
      stream: _stockStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(somethingWrongSnackbar);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        return Column(
          children: [
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              vaxStartText,
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Container(
                            child: datePickerStart(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              vaxEndText,
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Container(
                            child: datePickerEnd(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Expanded(
                flex: 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                stockManageLabel,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value == '') {
                                    vaccineData.stock = 0;
                                  } else {
                                    vaccineData.stock = int.parse(value);
                                  }
                                },
                                initialValue: schedulerData.initialText,
                                controller: schedulerData.stock,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: new InputDecoration(
                                  fillColor: Colors.white,
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 15, 10, 10),
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                vaccineManageLabel,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: schedulerData.vaccine,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 18,
                                  elevation: 16,
                                  isDense: true,
                                  isExpanded: true,
                                  style:
                                      const TextStyle(color: Color(0xFF109CF1)),
                                  onChanged: (String? newValue) {
                                    vaccineData.vaccine = newValue!;
                                    setState(() {
                                      schedulerData.vaccine =
                                          vaccineData.vaccine;
                                    });
                                  },
                                  items: <String>[
                                    'Astrazeneca',
                                    'Janssen',
                                    'Moderna',
                                    'Pfizer',
                                    'Sinovac'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                categoryManageLabel,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: schedulerData.category,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 18,
                                  elevation: 16,
                                  isDense: true,
                                  isExpanded: true,
                                  style:
                                      const TextStyle(color: Color(0xFF109CF1)),
                                  onChanged: (String? newValue) {
                                    vaccineData.category = newValue!;
                                    setState(() {
                                      schedulerData.category =
                                          vaccineData.category;
                                    });
                                  },
                                  items: <String>['A1', 'A2', 'A3', 'A4', 'A5']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        maxStockData.totalCStock = (snapshot.data!.docs
                            .where(
                                (element) => element.id == vaccineData.vaccine)
                            .map((e) => e.get('totalCurrentStock'))
                            .single as int);
                        print(maxStockData.totalCStock);
                        maxStockData.totalMStock = (snapshot.data!.docs
                            .where(
                                (element) => element.id == vaccineData.vaccine)
                            .map((e) => e.get('totalMaxStock'))
                            .single as int);
                        print(maxStockData.totalMStock);
                        if (vaccineData.isCreated) {
                          updateStock();
                          updateVaccineData();
                          setState(
                            () {
                              vaccineData.isCreated = true;
                            },
                          );
                        } else {
                          setState(
                            () {
                              vaccineData.isCreated = false;
                            },
                          );
                          createStock();
                          createVaccineData();
                        }
                        setState(() {
                          schedulerData.dateEnd = null;
                          schedulerData.dateStart = null;
                          schedulerData.stock = null;
                          schedulerData.initialText = '0';
                          schedulerData.vaccine = null;
                          schedulerData.category = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF26A98A),
                        fixedSize: Size(
                          width * 0.15,
                          height * 0.045,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: Text(
                        btnTextSchedVax,
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
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget datePickerStart() {
    return InkWell(
      onTap: () => pickDateStart(context),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTextStart().toString(),
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
    );
  }

  Widget datePickerEnd() {
    return InkWell(
      onTap: () => pickDateEnd(context),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTextEnd().toString(),
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
    );
  }

  String? getTextStart() {
    if (schedulerData.dateStart == null) {
      return 'mm/dd/yy';
    } else {
      return '${schedulerData.dateStart?.month}/${schedulerData.dateStart?.day}/${schedulerData.dateStart?.year}';
    }
  }

  String? getTextEnd() {
    if (schedulerData.dateEnd == null) {
      return 'mm/dd/yy';
    } else {
      return '${schedulerData.dateEnd?.month}/${schedulerData.dateEnd?.day}/${schedulerData.dateEnd?.year}';
    }
  }

  Future pickDateStart(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;
    vaccineData.dateStart = newDate;
    setState(() {
      schedulerData.dateStart = vaccineData.dateStart;
    });
  }

  Future pickDateEnd(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;
    vaccineData.dateEnd = newDate;
    setState(() {
      schedulerData.dateEnd = vaccineData.dateEnd;
    });
  }

  // editVaccineSched(
  //     String currUid,
  //     DateTime currDateStart,
  //     DateTime currDateEnd,
  //     String currVaccine,
  //     String currCategory,
  //     int currStock,
  //     int maxStock,
  //     bool isCreated) {
  //   setState(() {
  //     vaccineData.uniqueId = currUid;
  //     vaccineData.dateStart = currDateStart;
  //     vaccineData.dateEnd = currDateEnd;
  //     vaccineData.vaccine = currVaccine;
  //     vaccineData.category = currCategory;
  //     vaccineData.currentStock = currStock;
  //     vaccineData.maxStock = maxStock;
  //     vaccineData.isCreated = isCreated;

  //     dateEnd = currDateEnd;
  //     dateStart = currDateStart;
  //     stockController.text = maxStock.toString();
  //     dropdownValue = currVaccine;
  //     dropdownValue2 = currCategory;
  //   });
  // }
}
