import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
              color: Colors.red,
              height: 200,
            ),
          )
        ],
      )
    );
  }
}