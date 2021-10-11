import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
import 'package:booksynation/web_pages/web_data/web_vax_status_data.dart';
import 'package:flutter/material.dart';

class WebManage extends StatefulWidget {
  WebManage({Key? key}) : super(key: key);

  @override
  _WebManageState createState() => _WebManageState();
}

class _WebManageState extends State<WebManage> {
  String? uid;
  int? stock;
  String? dropdownValue;
  String? dropdownValue2;
  DateTime? dateStart;
  DateTime? dateEnd;

  List<VaccineData> data = [
    VaccineData(
      uniqueId: '',
      vaccine: 'Pfizer',
      dateStart: DateTime(2021, 05, 12),
      dateEnd: DateTime(2021, 05, 17),
      currentStock: 49,
      maxStock: 50,
      category: 'A5',
    ),
    VaccineData(
      uniqueId: '',
      vaccine: 'Janssen',
      dateStart: DateTime(2021, 05, 17),
      dateEnd: DateTime(2021, 05, 24),
      currentStock: 49,
      maxStock: 50,
      category: 'A5',
    ),
  ];

  StatusData statusData = StatusData(250, 100, 10, 5);

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
          buildHeaderVaccines(),
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

  Widget buildHeaderVaccines() {
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Pfizer') >=
                                        0
                                    ? data[data.indexWhere((element) =>
                                            element.vaccine == 'Pfizer')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Pfizer') >=
                                        0
                                    ? '/' +
                                        data[data.indexWhere((element) =>
                                                element.vaccine == 'Pfizer')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Astrazenica') >=
                                        0
                                    ? data[data.indexWhere((element) =>
                                            element.vaccine == 'Astrazenica')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Astrazenica') >=
                                        0
                                    ? '/' +
                                        data[data.indexWhere((element) =>
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Moderna') >=
                                        0
                                    ? data[data.indexWhere((element) =>
                                            element.vaccine == 'Moderna')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Moderna') >=
                                        0
                                    ? '/' +
                                        data[data.indexWhere((element) =>
                                                element.vaccine == 'Moderna')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Janssen') >=
                                        0
                                    ? data[data.indexWhere((element) =>
                                            element.vaccine == 'Janssen')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Janssen') >=
                                        0
                                    ? '/' +
                                        data[data.indexWhere((element) =>
                                                element.vaccine == 'Janssen')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Sinovac') >=
                                        0
                                    ? data[data.indexWhere((element) =>
                                            element.vaccine == 'Sinovac')]
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
                                data.indexWhere((element) =>
                                            element.vaccine == 'Sinovac') >=
                                        0
                                    ? '/' +
                                        data[data.indexWhere((element) =>
                                                element.vaccine == 'Sinovac')]
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
            rows: data.map((data) {
              return DataRow(cells: [
                DataCell(Container(
                    child: Text(
                        '${data.dateStart.month}/${data.dateStart.day}/${data.dateStart.year}' +
                            ' - ' +
                            '${data.dateEnd.month}/${data.dateEnd.day}/${data.dateEnd.year}'))),
                DataCell(Container(
                    child: Text(data.currentStock.toString() +
                        '/' +
                        data.maxStock.toString()))),
                DataCell(Container(child: Text(data.category))),
                DataCell(Container(child: Text(data.vaccine))),
                DataCell(
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () => editVaccineSched(
                              data.uniqueId,
                              data.dateStart,
                              data.dateEnd,
                              data.vaccine,
                              data.category,
                              data.currentStock,
                              data.maxStock),
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
                            },
                            controller:
                                TextEditingController(text: stock.toString()),
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
                                  vaccineData.vaccine = dropdownValue!;
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
                                  vaccineData.category = newValue;
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
                  onPressed: () async {
                    createVaccineData();
                    setState(
                      () {
                        data.add(
                          VaccineData(
                            uniqueId: vaccineData.uniqueId,
                            vaccine: vaccineData.vaccine,
                            dateStart: vaccineData.dateStart,
                            dateEnd: vaccineData.dateEnd,
                            currentStock: vaccineData.currentStock,
                            maxStock: vaccineData.maxStock,
                            category: vaccineData.category,
                          ),
                        );
                      },
                    );
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
      vaccineData.dateStart = newDate;
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
      vaccineData.dateEnd = newDate;
    });
  }

  editVaccineSched(String currUid, DateTime currDateStart, DateTime currDateEnd,
      String currVaccine, String currCategory, int currStock, int maxStock) {
    setState(() {
      vaccineData.uniqueId = currUid;
      vaccineData.dateStart = currDateStart;
      vaccineData.dateEnd = currDateEnd;
      vaccineData.vaccine = currVaccine;
      vaccineData.category = currCategory;
      vaccineData.currentStock = currStock;
      vaccineData.maxStock = maxStock;

      dateEnd = currDateEnd;
      dateStart = currDateStart;
      stock = maxStock;
      dropdownValue = currVaccine;
      dropdownValue2 = currCategory;
    });
  }
}
