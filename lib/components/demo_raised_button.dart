import 'package:flutter/material.dart';
class DemoRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        textStyle: MaterialStateProperty.all(Colors.white as TextStyle?),
      ),
      // color: Colors.red,
      child: Text("raised Button"),
      onPressed: () {
        // showDialog(
        //     context: context,
        //     child: AlertDialog(
        //         title: Text("alert title"),
        //         content: Text("alert content")
        //   )
        // );
      },
    );
  }
}