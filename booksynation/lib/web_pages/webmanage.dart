import 'package:flutter/material.dart';

class WebManage extends StatefulWidget {
  WebManage({Key? key}) : super(key: key);

  @override
  _WebManageState createState() => _WebManageState();
}

class _WebManageState extends State<WebManage> {
  String? dropdownValue;
  String? dropdownValue2;
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
                                    top: 20, left: 20, right: 20),
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
                            child: Text('49',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Color(0xFFEA3D2F))),
                          ),
                          Container(
                            child: Text('/50',
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
                            child: Text('49',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Color(0xFF367BF5))),
                          ),
                          Container(
                            child: Text('/50',
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
                            child: Text('49',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Color(0xFF2FA84F))),
                          ),
                          Container(
                            child: Text('/50',
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
                            child: Text('0',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Color(0xFFF3AA18))),
                          ),
                          Container(
                            child: Text('/50',
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
                            child: Text('0',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Color(0xFF6E8987))),
                          ),
                          Container(
                            child: Text('/50',
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
                                          child: Text('50',
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
                                          child: Text('50',
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
                                          child: Text('0',
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
                                          child: Text('0',
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
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Container(child: Text('05/12/21 - 05/17/21'))),
                  DataCell(Container(child: Text('49/50'))),
                  DataCell(Container(child: Text('Pfizer'))),
                  DataCell(
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
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
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Container(child: Text('05/17/21 - 05/24/21'))),
                  DataCell(Container(child: Text('50/50'))),
                  DataCell(Container(child: Text('Jansseen'))),
                  DataCell(
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
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
                ],
              ),
            ],
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Container(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Stock',
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
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                Expanded(
                  flex: 7,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          child: DropdownButton<String>(
                            value: dropdownValue2,
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
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: <String>['A1', 'A2', 'A3', 'A4', 'A5']
                                .map<DropdownMenuItem<String>>((String value) {
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
                  onPressed: () {},
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
}
