import 'package:flutter/material.dart';
import 'package:flutter_app/components/demo_drawer.dart';
import 'package:flutter_app/components/demo_material.dart';
import 'package:flutter_app/components/demo_navigation_tool_bar.dart';
import 'package:flutter_app/components/demo_raised_button.dart';
import 'package:flutter_app/components/demo_sizebox.dart';
import 'package:flutter_app/components/demo_stack.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DemoDrawer(),
      appBar: AppBar(
        title: Text("Home"),
          leading: Icon(Icons.ac_unit)
      ),
      body: Container(
        height: 40,
        color: Colors.yellow,
        child: DemoRaisedButton(),
      ),
    );
  }
}