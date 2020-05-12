



import 'package:flutter/material.dart';


class DemoContainer extends StatelessWidget {
  const DemoContainer();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: 200,
//      color: Colors.green,
        padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: new Border.all(width: 5), // 边色与边宽度
          color: Color(0xFF9E9E9E), // 底色
          borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)),
      ),
      transform: Matrix4.rotationZ(0.3),
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Text("Hello world"),
      ),

    );
  }
}