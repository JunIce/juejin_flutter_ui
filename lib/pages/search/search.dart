import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';


class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
//    throw UnimplementedError();
    return _SearchPage();
  }
}


class _SearchPage extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left, size: 28,),
          ),
          title: Container(
            child: TextField(
                style: TextStyle(color: Colors.white),
                autofocus: true,
                showCursor: true,
                cursorColor: Colors.white
            ),
          )
      ),
      body: ListView(
        children: _renderList(),
      ),
      backgroundColor: Colors.white,
    );
  }

  List<Widget> _renderList() {
    List<Widget> list = List();

    for(int i = 0; i< 5; i++) {
      list
          ..add(ListTile(
            leading: Icon(Icons.history,color: Color(0xff999999), size: 22,),
            title: Text("阿里巴巴不不不不不", style: TextStyle(color: Color(0xff666666), fontSize: 14),),
            trailing: Icon(Icons.close, color: Color(0xff999999), size: 18,)
          ))
          ..add(Divider(height: 1,));
    }

    list.add(
      Container(
        padding: EdgeInsets.only(top: 12,bottom: 12),
        child: Center(
          child: Text("清除历史记录", style: TextStyle(color: Color(0xff666666), fontSize: 14),),
        ),
      )
    );
    return list;
  }
}