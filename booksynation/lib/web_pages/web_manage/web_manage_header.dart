import 'package:booksynation/web_pages/web_data/web_manage_local_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WebManageHeader extends StatefulWidget {
  WebManageHeader({Key? key}) : super(key: key);

  @override
  State<WebManageHeader> createState() => _WebManageHeaderState();
}

class _WebManageHeaderState extends State<WebManageHeader> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('vaccine').snapshots();

  renderHeaderValues() {
    vaccineCollection.doc().snapshots().forEach((element) {
      setState(() {
        if (element.get('Vaccine') == 'Pfizer') {
          localHeaderVaccines.pfizerMaxCount =
              element.get('TotalMaxStock') as int;
          localHeaderVaccines.pfizerCurrCount =
              element.get('TotalCurrentStock') as int;
        } else if (element.get('Vaccine') == 'Astrazenica') {
          localHeaderVaccines.astraMaxCount =
              element.get('TotalMaxStock') as int;
          localHeaderVaccines.astraCurrCount =
              element.get('TotalCurrentStock') as int;
        } else if (element.get('Vaccine') == 'Moderna') {
          localHeaderVaccines.modernaMaxCount =
              element.get('TotalMaxStock') as int;
          localHeaderVaccines.modernaCurrCount =
              element.get('TotalCurrentStock') as int;
        } else if (element.get('Vaccine') == 'Janssen') {
          localHeaderVaccines.janssenMaxCount =
              element.get('TotalMaxStock') as int;
          localHeaderVaccines.janssenCurrCount =
              element.get('TotalCurrentStock') as int;
        } else if (element.get('Vaccine') == 'Sinovac') {
          localHeaderVaccines.sinoMaxCount =
              element.get('TotalMaxStock') as int;
          localHeaderVaccines.sinoCurrCount =
              element.get('TotalCurrentStock') as int;
        }
      });
    });
  },

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 260;
    final height = MediaQuery.of(context).size.height - 60;
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
                                      localHeaderVaccines.pfizerCurrCount
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
                                          localHeaderVaccines.pfizerMaxCount
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
                                      localHeaderVaccines.astraCurrCount
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
                                          localHeaderVaccines.astraMaxCount
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
                                      localHeaderVaccines.modernaCurrCount
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
                                          localHeaderVaccines.modernaMaxCount
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
                                      localHeaderVaccines.janssenCurrCount
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
                                          localHeaderVaccines.janssenMaxCount
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
                                      localHeaderVaccines.sinoCurrCount
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
                                          localHeaderVaccines.sinoMaxCount
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
