import 'package:flutter/material.dart';

class DemoNavigaitonToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:NavigationToolbar(
          leading: Icon(Icons.accessibility_new),
          middle: Text("biaot "),
          trailing: Icon(Icons.close)
      ) ,
    );
  }
}