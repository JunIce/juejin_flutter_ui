import 'package:flutter/material.dart';

class DemoCard extends StatelessWidget {
  const DemoCard();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        color: Colors.grey,
        shadowColor: Colors.green[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
        margin: EdgeInsets.all(30),
        elevation: 20,
        borderOnForeground: false,
        clipBehavior: Clip.antiAlias,
        child: Container(child: Text("Card Title"),)
    );
  }
}