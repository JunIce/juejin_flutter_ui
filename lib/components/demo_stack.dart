import 'package:flutter/material.dart';

class DemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Text("hello world")
      ],
    );
  }
}