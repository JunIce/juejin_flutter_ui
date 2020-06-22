import 'package:flutter/material.dart';

class TitleTag extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String text;
  final Color fontColor;

  const TitleTag(
      {Key key,
      this.color = Colors.blue,
      this.fontSize = 8,
      @required this.text,
      this.fontColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(2),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: fontColor),
      ),
    );
  }
}
