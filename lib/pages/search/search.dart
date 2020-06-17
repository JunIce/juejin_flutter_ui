import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: renderAppBar(),
      body: ListView(
        children: _renderList(),
      ),
      backgroundColor: Colors.white,
    );
  }


  // 渲染顶部输入框
  Widget renderAppBar() {
    return AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Container(
          child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "搜索文字、用户、标签",
                labelStyle: TextStyle(color: Colors.white)
              ),
              autofocus: false,
              showCursor: true,
              cursorColor: Colors.white
          ),
        )
    );
  }

  List<Widget> _renderList() {
    List<Widget> list = List();

    for (int i = 0; i < 5; i++) {
      list
        ..add(renderHistoryItem())
        ..add(Divider(height: 1,));
    }

    list.add(Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Center(
        child: GestureDetector(onTap: () {
          Fluttertoast.showToast(
            msg: "清除历史记录"
          );
        },
          child: Text(
            "清除历史记录",
            style: TextStyle(color: Color(0xff666666), fontSize: 14),
          ),
        ),
      ),
    ));

    return list;
  }


  Widget renderHistoryItem() {
    return ListTile(
        leading: Icon(
          Icons.history,
          color: Color(0xff999999),
          size: 22,
        ),
        title: Text(
          "阿里巴巴不不不不不",
          style: TextStyle(color: Color(0xff666666), fontSize: 14),
        ),
        trailing: Icon(
          Icons.close,
          color: Color(0xff999999),
          size: 18,
        )
    );
  }
}
