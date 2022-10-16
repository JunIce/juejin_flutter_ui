import 'package:flutter/material.dart';
class DemoRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      color: Colors.red,
      textColor: Colors.white,
      child: Text("raised Button"),
      elevation: 10.0,
      onPressed: () {
        showDialog(
            context: context,
            child: AlertDialog(
                title: Text("alert title"),
                content: Text("alert content")
          )
        );
      },
    );
  }
}