import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/util.dart';
import 'package:flutter_app/components/home_list_item1.dart';
import 'package:flutter_app/components/home_list_item2.dart';

class HomeListView extends StatelessWidget {
  final ScrollController controller;
  final List list;
  final int type;
  final TabController tabController;
  final String Wkey = Util.slRandomColor().toString();

  HomeListView(
      {@required this.controller,
      @required this.list,
      @required this.type,
      this.tabController});

  List<ChoiceChip> _tabs = [
    ChoiceChip(
        label: Text("全部"),
        labelStyle: TextStyle(color: Colors.black),
        selected: true,
        selectedColor: Colors.blue),
    ChoiceChip(
      label: Text("Java"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Python"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Go"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("php"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Nodejs"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Go"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("php"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Nodejs"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Go"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("php"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Nodejs"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Go"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("php"),
      selected: false,
    ),
    ChoiceChip(
      label: Text("Nodejs"),
      selected: false,
    ),
  ];

  var avatar =
      "https://img2.woyaogexing.com/2020/04/10/29def648a8ce41b4bf0c044b950952a2!400x400.jpeg";
  var title = "江淮：唯美温柔风动漫女生头像/我盼望行过万里山河也盼望你";
  var content =
      "关于手机APP的测评安利写过很多了，许多小伙伴养成了看一篇推文，装一个APP的习惯，久而久之，手机小小的屏幕上便放满了各式各样的APP，也或多或少得成为了我们日常生活中不可或缺的小应用。";
  var titlePic =
      "https://img2.woyaogexing.com/2020/06/22/717b5eb949f64e8e9064a86772ca6621!400x400.jpeg";
  var random = Random();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (type == 0) {
      return ListView.separated(
        controller: controller,
        key: PageStorageKey<String>("tab_${Wkey}"),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
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
        },
        itemCount: list.length,
      );
    }

    if (type == 1) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem1();
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        itemCount: list.length,
      );
    }

    if (type > 1) {
      BoxScrollView listview = ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem1();
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        itemCount: list.length,
      );

      return Column(
        children: [
          ColoredBox(
              color: Colors.white,
              child: Container(
                height: 56,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: _tabs[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              )),
          Expanded(child: listview)
        ],
      );
    }
  }
}
