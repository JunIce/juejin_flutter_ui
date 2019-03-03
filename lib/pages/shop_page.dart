import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: Column(
        children: <Widget>[
          // Container(
          //   color: Colors.blue,
          //   height: double.infinity,
          // ),
          SafeArea(
            child: Container(
              color: Colors.red[300],
              height: 200,
            ),
          )
        ],
      )
    );
  }
}