// import 'package:booksynation/web_pages/temp_files/web_vaccines_data.dart';
import 'package:booksynation/web_pages/web_data/web_manage_local_data.dart';
import 'package:booksynation/web_pages/web_manage/web_manage_footer.dart';
// import 'package:booksynation/web_pages/web_manage/web_manage_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WebManageMain extends StatefulWidget {
  WebManageMain({Key? key}) : super(key: key);

  @override
  _WebManageMainState createState() => _WebManageMainState();
}

class _WebManageMainState extends State<WebManageMain> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('vaccine').snapshots();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;

    return Row(
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFFF7F9FA),
            ),
            child: buildTable(height, width),
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
                    padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFFF7F9FA),
                    ),
                    child: buildScheduler(height, width),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                WebManageFooter(),
              ],
            ),
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }

  Widget buildTable(double height, double width) {
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
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
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
                      rows:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
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

                        // addVaccineSched(
                        //   data['UID'],
                        //   data['Vaccine'],
                        //   data['DateStart'].toDate(),
                        //   data['DateEnd'].toDate(),
                        //   data['CurrentStock'],
                        //   data['MaxStock'],
                        //   data['Category'],
                        //   data['isCreated'],
                        // );

                        return DataRow(cells: [
                          DataCell(
                            Container(
                              child:
                                  Text(getDateStart() + ' - ' + getDateEnd()),
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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
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
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget buildScheduler(double height, double width) {
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
                        child: InkWell(
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
                                  (schedulerFieldsData.dateStart == null
                                      ? 'mm/dd/yy'
                                      : '${schedulerFieldsData.dateStart!.month}/${schedulerFieldsData.dateStart!.day}/${schedulerFieldsData.dateStart!.year}'
                                          .toString()),
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
                        ),
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
                        child: InkWell(
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
                                  (schedulerFieldsData.dateEnd == null
                                      ? 'mm/dd/yy'
                                      : '${schedulerFieldsData.dateEnd!.month}/${schedulerFieldsData.dateEnd!.day}/${schedulerFieldsData.dateEnd!.year}'
                                          .toString()),
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
                        ),
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
                              if (value == '') {
                                localFieldsData.maxStock = 0;
                                localFieldsData.currentStock = 0;
                              } else {
                                localFieldsData.maxStock = int.parse(value);
                                localFieldsData.currentStock =
                                    (localFieldsData.isCreated)
                                        ? localFieldsData.currentStock
                                        : int.parse(value);
                              }
                            },
                            initialValue: schedulerFieldsData.initialValue,
                            controller: schedulerFieldsData.stock,
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
                              value: schedulerFieldsData.vaccine,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 18,
                              elevation: 16,
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(color: Color(0xFF109CF1)),
                              onChanged: (String? newValue) {
                                localFieldsData.vaccine = newValue!;
                                setState(() {
                                  schedulerFieldsData.vaccine =
                                      localFieldsData.vaccine;
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
                              value: schedulerFieldsData.category,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 18,
                              elevation: 16,
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(color: Color(0xFF109CF1)),
                              onChanged: (String? newValue) {
                                localFieldsData.category = newValue!;
                                setState(() {
                                  schedulerFieldsData.category =
                                      localFieldsData.category;
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
                    if (localFieldsData.isCreated) {
                      updateVaccineData();
                      localFieldsData.isCreated = false;
                    } else {
                      localFieldsData.isCreated = true;
                      createVaccineData();
                    }
                    setState(() {
                      updaterFieldsData.maxStock = 0;
                      updaterFieldsData.currStock = 0;
                      updaterFieldsData.totalCurrStock = 0;
                      updaterFieldsData.totalMaxStock = 0;
                      schedulerFieldsData.dateEnd = DateTime.now();
                      schedulerFieldsData.dateStart = DateTime.now();
                      schedulerFieldsData.stock = null;
                      schedulerFieldsData.initialValue = '0';
                      schedulerFieldsData.vaccine = 'Astrazenica';
                      schedulerFieldsData.category = 'A1';
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
      localFieldsData.uniqueId = currUid;
      localFieldsData.dateStart = currDateStart;
      localFieldsData.dateEnd = currDateEnd;
      localFieldsData.vaccine = currVaccine;
      localFieldsData.category = currCategory;
      localFieldsData.currentStock = currStock;
      localFieldsData.maxStock = maxStock;
      localFieldsData.isCreated = isCreated;
      schedulerFieldsData.category = localFieldsData.category;
      schedulerFieldsData.dateEnd = localFieldsData.dateEnd;
      schedulerFieldsData.dateStart = localFieldsData.dateStart;
      schedulerFieldsData.vaccine = localFieldsData.vaccine;
      schedulerFieldsData.stock =
          TextEditingController(text: maxStock.toString());
      schedulerFieldsData.initialValue = null;
    });
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
    localFieldsData.dateStart = newDate;
    setState(() {
      schedulerFieldsData.dateStart = localFieldsData.dateStart;
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
    localFieldsData.dateEnd = newDate;
    setState(() {
      schedulerFieldsData.dateEnd = localFieldsData.dateEnd;
    });
  }
}
