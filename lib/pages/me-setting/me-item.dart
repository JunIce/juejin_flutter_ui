import 'package:flutter/material.dart';


class MeListItem extends StatelessWidget {
  final IconData icon;
  final double iconGap;
  final String title;
  final dynamic trailing;
  final double iconSize;
  final Color iconColor;
  final Function onTap;
  final double height;
  const MeListItem(
      {Key key,
        this.icon,
        this.title,
        this.trailing,
        this.iconSize = 18,
        this.iconColor = Colors.blue,
        @required this.onTap,
        this.iconGap = 10,
        this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (icon != null) {
      children
        ..add(Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ))
        ..add(SizedBox(
          width: iconGap,
        ));
    }

    if (title != null) {
      children.add(Expanded(child: Text(title)));
    }

    if (trailing != null) {
      if (trailing is String) {
        children.add(Text(
          trailing,
          style: TextStyle(color: Color(0xff999999), fontSize: 14),
        ));
      }

      if (trailing is Widget) {
        children.add(trailing);
      }
    }

    // TODO: implement build
    return Material(
      child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children),
            ),
          )),
    );
  }
}