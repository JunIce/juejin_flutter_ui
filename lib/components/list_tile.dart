import 'package:flutter/material.dart';

class DemoListTile extends StatelessWidget {
  const DemoListTile();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(Icons.ac_unit, color: Colors.red),
      title: Text("测试标题"),
      isThreeLine: true,
      dense: true,
      enabled: true,
      subtitle: Container(
        child: Padding(padding: EdgeInsets.only(top: 20, bottom: 20), child: Text("Padding"),),
      ),
      onTap: () {
        print("点击事件");
      },
      trailing: Icon(Icons.accessibility_new),
    );
  }
}