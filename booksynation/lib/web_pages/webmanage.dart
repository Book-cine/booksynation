import 'package:flutter/material.dart';

class WebManage extends StatefulWidget {
  WebManage({Key? key}) : super(key: key);

  @override
  _WebManageState createState() => _WebManageState();
}

class _WebManageState extends State<WebManage> {
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
          Spacer(flex: 1),
          Expanded(
            flex: 40,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 20,
                            child: Container(),
                          ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
