import 'package:flutter/material.dart';

class DemoFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 100,
          height: 50,
          color: Colors.yellow,
        ),
        Container(
          width: 50,
          height: 100,
          color: Colors.green,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.red,
        )
      ],
    );
  }
}