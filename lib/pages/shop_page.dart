import 'package:flutter/material.dart';
import 'package:flutter_app/components/demo_card.dart';
import 'package:flutter_app/components/demo_comtainer.dart';

import 'package:flutter_app/components/list_tile.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Column(
        children: <Widget>[
            DemoContainer()
//          Container(height: 100,color: Colors.red,),
//          DemoListTile(),
//            DemoCard()
        ],
      ),
      )
    );
  }
}