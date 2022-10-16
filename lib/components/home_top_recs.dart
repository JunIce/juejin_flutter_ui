import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:juejin/components/custom_list_item.dart';

class HomeTopRec extends StatelessWidget {
  List<dynamic> data = [];

  HomeTopRec({required this.data});

  final divider = Divider(height: 0,);

  @override
  Widget build(BuildContext context) {
    List<Widget> listData = [_topTitle];
    for(int i = 0; i < data.length; i++) {
        listData.add(divider);
        listData.add(_itemTile);
    }

    return Container(
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,
      child: Column(
        children: listData,
      )
    );
  }

  final ListTile _itemTile = ListTile(
    title: Padding(
      padding: EdgeInsets.only(top: 14, bottom: 14),
      child: Text('Hooks 对12 Vue 而言意味着什么'),
    ),
    subtitle: Padding(
        padding: EdgeInsets.only(bottom: 14),
        child: Container(
          child: Row(
            children: [
              Text("57人赞",style: TextStyle(fontSize: 12, color: Color(0xff999999))),
              Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
              Text("清秋", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
              Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
              Text("2天前", style: TextStyle(fontSize: 12, color: Color(0xff999999)))
            ],
          )
        )
    ), 
      trailing: Container(
        width: 80,
        height: 80,
        child: Container(
          child: Image.network("https://img2.woyaogexing.com/2020/05/13/00d3b0d3f027478eb821225abb27a673!400x400.jpeg"),
        ),
      )
  );

  final Padding _topTitle = Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.blue,
                size: 14,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '热门推荐',
                style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("文章榜", style: TextStyle(color: Color(0xff999999), fontSize: 14),),

              Icon(
                Icons.chevron_right,
                color: Color(0xff999999),
                size: 20,
              ),
            ],
          ),
        ],
      ));
}
