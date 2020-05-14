import 'package:flutter/material.dart';


class ListTopTag extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
      child: Row(
        children: [
          _renderTag(true),
          SizedBox(width: 8,),
          _renderTag(false),
          SizedBox(width: 8,),
        ],
      )
    );
  }


  Widget _renderTag(bool active) {
    Color bgColor = active ? Colors.blue : Color(0xfff4f4f4);
    Color textColor = active ? Colors.white : Color(0xff999999);
    return Container(
      padding:  EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Text("3日内", style: TextStyle(color: textColor, fontSize: 14),),
    );
  }

  
}