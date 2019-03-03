import 'package:flutter/material.dart';

class ItemPanelBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.hd),
            SizedBox(
              width: 8,
            ),
            Text('赞')
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.comment),
            SizedBox(
              width: 8,
            ),
            Text('评论')
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.share),
            SizedBox(
              width: 8,
            ),
            Text('分享')
          ],
        ),
      ],
    );
  }
}
