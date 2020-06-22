import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final double iconSize;
  final double textSize;

  const IconText(
      {Key key,
      this.icon,
      this.text,
      this.onTap,
      this.iconSize = 14,
      this.textSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xff999999),
                size: iconSize,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                text,
                style: TextStyle(color: Color(0xff999999), fontSize: textSize),
              )
            ],
          ),
        ));
  }
}
