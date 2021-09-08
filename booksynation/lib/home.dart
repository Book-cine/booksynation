import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookSyNation',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF3DDD6A).withOpacity(0.5),
      ),
      body: Center(
        child: Text('LOGIN INTERFACE',
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }
}
