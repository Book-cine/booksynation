import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width * 0.10,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.greenAccent.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
