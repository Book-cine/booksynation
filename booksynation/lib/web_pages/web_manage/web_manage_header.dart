import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WebManageHeader extends StatefulWidget {
  WebManageHeader({Key? key}) : super(key: key);

  @override
  _WebManageHeaderState createState() => _WebManageHeaderState();
}

class _WebManageHeaderState extends State<WebManageHeader> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
    return StreamBuilder<QuerySnapshot>(
        stream: stockCollection.snapshots(),
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
                                      snapshot.data!.docChanges
                                          .where((element) =>
                                              element.doc.id == 'Pfizer')
                                          .map((e) =>
                                              e.doc.get('totalCurrentStock'))
                                          .single
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFFEA3D2F))),
                                ),
                                Container(
                                  child: Text(
                                      '/' +
                                          snapshot.data!.docChanges
                                              .where((element) =>
                                                  element.doc.id == 'Pfizer')
                                              .map((e) =>
                                                  e.doc.get('totalMaxStock'))
                                              .single
                                              .toString(),
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
                                      snapshot.data!.docChanges
                                          .where((element) =>
                                              element.doc.id == 'Astrazenica')
                                          .map((e) =>
                                              e.doc.get('totalCurrentStock'))
                                          .single
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF367BF5))),
                                ),
                                Container(
                                  child: Text(
                                      '/' +
                                          snapshot.data!.docChanges
                                              .where((element) =>
                                                  element.doc.id ==
                                                  'Astrazenica')
                                              .map((e) =>
                                                  e.doc.get('totalMaxStock'))
                                              .single
                                              .toString(),
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
                                      snapshot.data!.docChanges
                                          .where((element) =>
                                              element.doc.id == 'Moderna')
                                          .map((e) =>
                                              e.doc.get('totalCurrentStock'))
                                          .single
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF2FA84F))),
                                ),
                                Container(
                                  child: Text(
                                      '/' +
                                          snapshot.data!.docChanges
                                              .where((element) =>
                                                  element.doc.id == 'Moderna')
                                              .map((e) =>
                                                  e.doc.get('totalMaxStock'))
                                              .single
                                              .toString(),
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
                                      snapshot.data!.docChanges
                                          .where((element) =>
                                              element.doc.id == 'Janssen')
                                          .map((e) =>
                                              e.doc.get('totalCurrentStock'))
                                          .single
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFFF3AA18))),
                                ),
                                Container(
                                  child: Text(
                                      '/' +
                                          snapshot.data!.docChanges
                                              .where((element) =>
                                                  element.doc.id == 'Janssen')
                                              .map((e) =>
                                                  e.doc.get('totalMaxStock'))
                                              .single
                                              .toString(),
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
                                      snapshot.data!.docChanges
                                          .where((element) =>
                                              element.doc.id == 'Sinovac')
                                          .map((e) =>
                                              e.doc.get('totalCurrentStock'))
                                          .single
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Color(0xFF6E8987))),
                                ),
                                Container(
                                  child: Text(
                                      '/' +
                                          snapshot.data!.docChanges
                                              .where((element) =>
                                                  element.doc.id == 'Sinovac')
                                              .map((e) =>
                                                  e.doc.get('totalMaxStock'))
                                              .single
                                              .toString(),
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
}
