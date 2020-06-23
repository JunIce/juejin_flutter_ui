import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final double iconSize;
  final Color iconColor;
  final double textSize;
  final Color textColor;
  final Axis direction;

  const IconText(
      {Key key,
      this.icon,
      this.text,
      this.onTap,
      this.iconSize = 14,
      this.textSize = 12,
      this.iconColor = const Color(0xff999999),
      this.textColor = const Color(0xff999999),
        this.direction = Axis.horizontal
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        text,
        style: TextStyle(color: textColor, fontSize: textSize),
      )
    ];

    Widget child = null;
    if(direction == Axis.horizontal) {
      child = Row(
        children: children,
      );
    }

    if(direction == Axis.vertical) {
      child = Column(
        children: children,
      );
    }


    // TODO: implement build
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: child,
        ));
  }
}
