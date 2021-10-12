import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
import 'package:booksynation/web_pages/web_data/web_vax_status_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WebManage extends StatefulWidget {
  WebManage({Key? key}) : super(key: key);

  @override
  _WebManageState createState() => _WebManageState();
}

class _WebManageState extends State<WebManage> {
  String? uid;
  TextEditingController stockController = TextEditingController();
  String dropdownValue = 'Astrazenica';
  String dropdownValue2 = 'A1';
  DateTime? dateStart;
  DateTime? dateEnd;

  StatusData statusData = StatusData(250, 100, 10, 5);

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('vaccine').snapshots();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    FirebaseFirestore.instance
        .collection('vaccine')
        .snapshots()
        .map((QuerySnapshot docSnap) {
      Map<String, dynamic> data = docSnap.docs as Map<String, dynamic>;

      addVaccineSched(
        data['UID'],
        data['Vaccine'],
        data['DateStart'].toDate(),
        data['DateEnd'].toDate(),
        data['CurrentStock'],
        data['MaxStock'],
        data['Category'],
        data['isCreated'],
      );
      print('Was here' + data['UID']);
    });

    Future.delayed(Duration(seconds: 1), () async {
      setState(() {
        vaccineSchedules = cloneVaccineSchedules;
      });
    });
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Spacer(flex: 2),
          buildHeaderVaccines(width, height),
          Spacer(flex: 2),
          Expanded(
            flex: 40,
            child: Container(
              child: Row(
                children: [
                  Spacer(flex: 1),
                  Expanded(
                    flex: 30,
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
                    flex: 20,
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
                          buildFooterUpdates(),
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

  Widget buildHeaderVaccines(double width, double height) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              alignment: Alignment.center,
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

          return Expanded(
            flex: 10,
            child: Container(
              child: Row(
                children: [
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Pfizer',
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
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Pfizer') >=
                                              0
                                          ? vaccineSchedules[vaccineSchedules
                                                  .indexWhere((element) =>
                                                      element.vaccine ==
                                                      'Pfizer')]
                                              .currentStock
                                              .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFFEA3D2F))),
                                ),
                                Container(
                                  child: Text(
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Pfizer') >=
                                              0
                                          ? '/' +
                                              vaccineSchedules[vaccineSchedules
                                                      .indexWhere((element) =>
                                                          element.vaccine ==
                                                          'Pfizer')]
                                                  .maxStock
                                                  .toString()
                                          : '/0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          color: Color(0xFFBFBFBF))),
                                )
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Astrazenica',
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
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Astrazenica') >=
                                              0
                                          ? vaccineSchedules[vaccineSchedules
                                                  .indexWhere((element) =>
                                                      element.vaccine ==
                                                      'Astrazenica')]
                                              .currentStock
                                              .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF367BF5))),
                                ),
                                Container(
                                  child: Text(
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Astrazenica') >=
                                              0
                                          ? '/' +
                                              vaccineSchedules[vaccineSchedules
                                                      .indexWhere((element) =>
                                                          element.vaccine ==
                                                          'Astrazenica')]
                                                  .maxStock
                                                  .toString()
                                          : '/0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          color: Color(0xFFBFBFBF))),
                                )
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Moderna',
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
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Moderna') >=
                                              0
                                          ? vaccineSchedules[vaccineSchedules
                                                  .indexWhere((element) =>
                                                      element.vaccine ==
                                                      'Moderna')]
                                              .currentStock
                                              .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF2FA84F))),
                                ),
                                Container(
                                  child: Text(
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Moderna') >=
                                              0
                                          ? '/' +
                                              vaccineSchedules[vaccineSchedules
                                                      .indexWhere((element) =>
                                                          element.vaccine ==
                                                          'Moderna')]
                                                  .maxStock
                                                  .toString()
                                          : '/0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          color: Color(0xFFBFBFBF))),
                                )
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Janssen',
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
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Janssen') >=
                                              0
                                          ? vaccineSchedules[vaccineSchedules
                                                  .indexWhere((element) =>
                                                      element.vaccine ==
                                                      'Janssen')]
                                              .currentStock
                                              .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFFF3AA18))),
                                ),
                                Container(
                                  child: Text(
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Janssen') >=
                                              0
                                          ? '/' +
                                              vaccineSchedules[vaccineSchedules
                                                      .indexWhere((element) =>
                                                          element.vaccine ==
                                                          'Janssen')]
                                                  .maxStock
                                                  .toString()
                                          : '/0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          color: Color(0xFFBFBFBF))),
                                )
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Sinovac',
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
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Sinovac') >=
                                              0
                                          ? vaccineSchedules[vaccineSchedules
                                                  .indexWhere((element) =>
                                                      element.vaccine ==
                                                      'Sinovac')]
                                              .currentStock
                                              .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF6E8987))),
                                ),
                                Container(
                                  child: Text(
                                      vaccineSchedules.indexWhere((element) =>
                                                  element.vaccine ==
                                                  'Sinovac') >=
                                              0
                                          ? '/' +
                                              vaccineSchedules[vaccineSchedules
                                                      .indexWhere((element) =>
                                                          element.vaccine ==
                                                          'Sinovac')]
                                                  .maxStock
                                                  .toString()
                                          : '/0',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          color: Color(0xFFBFBFBF))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          );
        });
  }

  Widget buildFooterUpdates() {
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
                                          child: Text('Booked',
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
                                          child: Text('Completed',
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
                                          child: Text('Rescheduled',
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
                                          child: Text('Cancelled',
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
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              alignment: Alignment.center,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Date',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Stock',
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
                        'Vaccine',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    final DateFormat formatter = DateFormat('MM/dd/yy');
                    String getDateStart() {
                      DateTime dateStart = data['DateStart'].toDate();
                      String formattedStart = formatter.format(dateStart);
                      return formattedStart;
                    }

                    String getDateEnd() {
                      DateTime dateEnd = data['DateEnd'].toDate();
                      String formattedEnd = formatter.format(dateEnd);
                      return formattedEnd;
                    }

                    addVaccineSched(
                      data['UID'],
                      data['Vaccine'],
                      data['DateStart'].toDate(),
                      data['DateEnd'].toDate(),
                      data['CurrentStock'],
                      data['MaxStock'],
                      data['Category'],
                      data['isCreated'],
                    );

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
                                onPressed: () => editVaccineSched(
                                  data['UID'],
                                  data['DateStart'].toDate(),
                                  data['DateEnd'].toDate(),
                                  data['Vaccine'],
                                  data['Category'],
                                  data['CurrentStock'],
                                  data['MaxStock'],
                                  data['isCreated'],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFFFFFF),
                                  fixedSize: Size(
                                    width * 0.1,
                                    height * 0.045,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                child: Text(
                                  'Edit',
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
        });
  }

  Widget buildScheduler(final width, final height) {
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
                          'Vaccination Start',
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
                          'Vaccination End',
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
                            'Stock',
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
                              vaccineData.maxStock = int.parse(value);
                              vaccineData.currentStock = (vaccineData.isCreated)
                                  ? vaccineData.currentStock
                                  : int.parse(value);
                            },
                            controller: stockController,
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
                              //fillColor: Colors.green
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
                            'Vaccine',
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
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 18,
                              elevation: 16,
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(color: Color(0xFF109CF1)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
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
                            'Category',
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
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 18,
                              elevation: 16,
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(color: Color(0xFF109CF1)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>[
                                'A1',
                                'A2',
                                'A3',
                                'A4',
                                'A5'
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
                    vaccineData.vaccine = dropdownValue;
                    vaccineData.category = dropdownValue2;
                    vaccineData.dateStart = dateStart!;
                    vaccineData.dateEnd = dateEnd!;
                    vaccineData.maxStock = int.parse(stockController.text);

                    if (vaccineData.isCreated) {
                      updateVaccineData();
                      setState(
                        () {
                          vaccineData.isCreated = false;
                        },
                      );
                    } else {
                      setState(
                        () {
                          vaccineData.isCreated = true;
                        },
                      );
                      createVaccineData();
                    }
                    setState(() {
                      dateEnd = DateTime.now();
                      dateStart = DateTime.now();
                      stockController.text = '';
                      dropdownValue = 'Astrazenica';
                      dropdownValue2 = 'A1';
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
                    'Schedule Vaccine',
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
    if (dateStart == null) {
      return 'mm/dd/yy';
    } else {
      return '${dateStart?.month}/${dateStart?.day}/${dateStart?.year}';
    }
  }

  String? getTextEnd() {
    if (dateEnd == null) {
      return 'mm/dd/yy';
    } else {
      return '${dateEnd?.month}/${dateEnd?.day}/${dateEnd?.year}';
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

    setState(() {
      dateStart = newDate;
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

    setState(() {
      dateEnd = newDate;
    });
  }

  addVaccineSched(
      String currUid,
      String currVaccine,
      DateTime currDateStart,
      DateTime currDateEnd,
      int currStock,
      int maxStock,
      String currCategory,
      bool isCreated) {
    cloneVaccineSchedules.add(VaccineData(
      uniqueId: currUid,
      vaccine: currVaccine,
      dateStart: currDateStart,
      dateEnd: currDateEnd,
      currentStock: currStock,
      maxStock: maxStock,
      category: currCategory,
      isCreated: isCreated,
    ));
  }

  editVaccineSched(
      String currUid,
      DateTime currDateStart,
      DateTime currDateEnd,
      String currVaccine,
      String currCategory,
      int currStock,
      int maxStock,
      bool isCreated) {
    setState(() {
      vaccineData.uniqueId = currUid;
      vaccineData.dateStart = currDateStart;
      vaccineData.dateEnd = currDateEnd;
      vaccineData.vaccine = currVaccine;
      vaccineData.category = currCategory;
      vaccineData.currentStock = currStock;
      vaccineData.maxStock = maxStock;
      vaccineData.isCreated = isCreated;

      dateEnd = currDateEnd;
      dateStart = currDateStart;
      stockController.text = maxStock.toString();
      dropdownValue = currVaccine;
      dropdownValue2 = currCategory;
    });
  }
}
