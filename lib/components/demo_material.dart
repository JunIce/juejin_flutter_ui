import 'package:flutter/material.dart';
class DemoMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.green,
      elevation: 5,
      type: MaterialType.button,
      child: Container(
        height: 90,
//        color: Colors.amber,
      ),
    );
  }
}