import 'package:flutter/material.dart';

class HomeTopRec extends StatelessWidget {
  HomeTopRec();
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,
      child: Column(
      children: <Widget>[
        _topTitle,
        Divider(height: 0,),
        _itemTile,
        Divider(height: 0,),
        _itemTile,
        Divider(height: 0,),
        _itemTile,
      ],
    ),);
  }

  ListTile _itemTile =ListTile(
    title: Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text('Hooks 对 Vue 而言意味着什么'),
    ),
    subtitle: Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Text('57人赞|清秋|2天前', style:TextStyle(fontSize: 14, color: Color(0xff999999)),
    )),
  );

  Padding _topTitle = Padding(
    padding: EdgeInsets.only(left: 12, right:12, top: 10, bottom: 10),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.hot_tub, color: Colors.blue,),
          SizedBox(width: 10,),
          Text('热门推荐', style: TextStyle(
            fontSize: 16,
            color: Colors.blue
          ),)
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Icon(Icons.refresh, color: Color(0xffaaaaaa),),
          SizedBox(width: 18,),
        Icon(Icons.close, color: Color(0xffaaaaaa),),
      ],),
      
  ],));
}