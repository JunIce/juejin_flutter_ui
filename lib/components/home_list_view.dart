import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/home_list_item1.dart';
import 'package:flutter_app/components/home_list_item2.dart';

class HomeListView extends StatefulWidget {
  final ScrollController controller;
  final List list;
  final int type;
  final TabController tabController;

  HomeListView(
      {Key key,
        @required this.controller,
        @required this.list,
        @required this.type,
        this.tabController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeListView();
  }
}

class _HomeListView extends State<HomeListView> {


  List<String> _tabs = [
    "全部",
    "Java",
    "python",
    "Go",
    "php",
    "NodeJs",
    "Go",
    "python",
    "Go",
    "php",
    "NodeJs",
    "Go",
    "python",
    "Go",
    "php",
    "NodeJs",
    "Go"
  ];

  var avatar =
      "https://img2.woyaogexing.com/2020/04/10/29def648a8ce41b4bf0c044b950952a2!400x400.jpeg";
  var title = "江淮：唯美温柔风动漫女生头像/我盼望行过万里山河也盼望你";
  var content =
      "关于手机APP的测评安利写过很多了，许多小伙伴养成了看一篇推文，装一个APP的习惯，久而久之，手机小小的屏幕上便放满了各式各样的APP，也或多或少得成为了我们日常生活中不可或缺的小应用。";
  var titlePic =
      "https://img2.woyaogexing.com/2020/06/22/717b5eb949f64e8e9064a86772ca6621!400x400.jpeg";
  var random = Random();
  int _checkedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_renderSecondTab(), Expanded(child: _renderList())],
    );
  }

  Widget _renderSecondTab() {
    if (widget.type < 2) return Container();

    List<Widget> _list = [];
    for (int i = 0; i < _tabs.length; i++) {
      _list.add(Container(
          margin: EdgeInsets.only(left: 10), child: CircleTag(text: _tabs[i], checked: _checkedIndex == i, onTap: (){
            print(i);
            setState((){
                  _checkedIndex = i;
                }
            );
      },)));
    }

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _list,
        ),
      ),
    );
  }

  Widget _renderList() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (widget.type == 0) {
          return HomeListItem2(
            avatar: avatar,
            username: "山东分局开会",
            newstime: "2020年6月9日",
            readCount: "327",
            likeCount: "23",
            commentCount: "437",
            title: title,
            content: content,
            isSpecial: random.nextBool(),
            titlePic: random.nextBool() ? titlePic : null,
            onTap: () {},
          );
        }

        return HomeListItem1(
          avatar: avatar,
          username: "出现在v你健康",
          category: "Python / Flutter",
          title: title,
          content: content,
          titlePic: random.nextBool() ? titlePic : null,
          commentCount: "4367",
          likeCount: "2343",
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ),
      itemCount: widget.list.length,
    );
  }
}

class CircleTag extends StatelessWidget {
  final String text;
  final bool checked;
  final Function onTap;

  const CircleTag({Key key, this.text, this.checked = false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(onTap: onTap,child: Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: checked ? Colors.blue : Color(0xfff4f4f4)),
      child: Text(
        text,
        style: TextStyle(color: checked ? Colors.white : Colors.grey),
      ),
    ),);
  }
}
