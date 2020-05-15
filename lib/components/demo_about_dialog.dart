import 'package:flutter/material.dart';

class DemoAboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AboutDialog"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          showAboutDialog(
            context: context,
            applicationIcon: FlutterLogo(),
            applicationName: 'Show About Example',
            applicationVersion: 'August 2019',
            applicationLegalese: '© 2014 The Flutter Authors',
            children: [],
          );
        },child: Text("AboutDialog"),),
      ),
    );
  }
}