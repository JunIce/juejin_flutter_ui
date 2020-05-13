import 'package:flutter/material.dart';
class DemoBoxDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          width: 30,
          color: Colors.red
        ),
//        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.amber,
            blurRadius: 5.0,
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 10.0,
            offset: Offset(3.5, 12)
          )
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage("https://img2.woyaogexing.com/2020/05/13/f74a273d69884ed9a5d8f73b5376fcdf!400x400.jpeg"),
            fit: BoxFit.fitHeight
        )
      ),
    );
  }
}