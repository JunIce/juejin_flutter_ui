import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const IconText({Key key, this.icon, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(onTap: onTap,
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xff999999),
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                text,
                style:
                TextStyle(color: Color(0xff999999), fontSize: 12),
              )
            ],
          ),
        ));
  }
}