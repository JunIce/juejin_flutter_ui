import 'package:flutter/material.dart';

class DemoExpand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("1"),
            height: 50,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("1"),
            height: 50,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text("1"),
            height: 50,
          ),
        )
      ],
    );
  }
}