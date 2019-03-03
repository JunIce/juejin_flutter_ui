import 'package:flutter/material.dart';

class ItemPanelHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img2.woyaogexing.com/2019/03/02/ee38a03fceb34c7db6040fd240229987!400x400.jpeg'),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '用户名',
                  style: TextStyle(fontSize: 16, color: Color(0xff333333)),
                ),
                Text(
                  '11小时',
                  style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: null,
        )
      ],
    );
  }
}
