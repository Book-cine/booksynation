import 'package:booksynation/web_pages/web_manage/web_manage_header.dart';
import 'package:booksynation/web_pages/web_manage/web_manage_main.dart';
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
          WebManageHeader(),
          Spacer(flex: 2),
          Expanded(
            flex: 40,
            child: Container(
              child: WebManageMain(),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
