import 'package:flutter/material.dart';

class ListItemListTile extends StatelessWidget {
  ListItemListTile({Key key, this.show}):super(key: key);
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text('Hooks 对 Vue 而言意味着什么Hooks 对 Vue 而言意味着什么Hooks'),
      ),
      subtitle: Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: Text(
            '57人赞|清秋|2天前',
            style: TextStyle(fontSize: 14, color: Color(0xff999999)),
          )),
      trailing: Container(
        width: 80,
        height: 80,
        decoration: !show ? null : BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: NetworkImage('https://img2.woyaogexing.com/2019/03/01/b27e308d4a574c5a97fa33299e43c681!400x400.webp')
          )
        ),
      )
    );
  }
}
