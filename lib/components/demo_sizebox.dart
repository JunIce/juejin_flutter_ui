import 'package:flutter/material.dart';
class DemoSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child:  Container(
        width: 200.0,
        height: 200.0,
        color: Color(0xffff0000),
      ),
    );
  }
}