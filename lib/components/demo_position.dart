import 'package:flutter/material.dart';

class DemoPosition extends StatelessWidget {
  const DemoPosition();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
          alignment: Alignment.center,
          child: Text("Stack"),
        ),
        Positioned(
          top: 10.0,
          width: 100,
          left: 10,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("测试Posittion"),
          ),
        )
      ],
    );
  }
}