import 'package:flutter/material.dart';
import 'package:flutter_app/components/item_panel.dart';

class HomeFollowPage extends StatelessWidget {
  Widget build(BuildContext context) => _HomeFollowPages();
}

class _HomeFollowPages extends StatefulWidget {
  @override
  _HomeFollowPage createState() => _HomeFollowPage();
}

class _HomeFollowPage extends State<_HomeFollowPages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ItemPanel(),
    );
  }
}
