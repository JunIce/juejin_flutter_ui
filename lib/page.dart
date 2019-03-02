import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.all(10),
        height: 100,
        child: ListView(
        //控制方向 默认是垂直的
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _getContainer('Maps', Icons.map),
          _getContainer('phone', Icons.phone),
          _getContainer('Maps', Icons.map),
        ],
      )
    
    );
  }

  Widget _getContainer(String test, IconData icon) {
    return new Container(
      width: 200.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(icon),
//        显示在title之后
        trailing: new Icon(icon),
        title: new Text(test),
        subtitle:new Text("我是subtitle") ,
      ),
    );
  }
}