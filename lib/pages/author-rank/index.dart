import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juejin/components/author-rank-item.dart';


class AuthorRankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthorRankPage();
  }
}

class _AuthorRankPage  extends State<AuthorRankPage> with TickerProviderStateMixin{
  List<Tab> _tabs = [
    Tab(text: "推荐"),
    Tab(text: "前端"),
    Tab(text: "后端"),
    Tab(text: "Android"),
    Tab(text: "IOS"),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("作者榜"),
        elevation: 0,
      ),
      body: _renderBody(),
    );
  }

 Widget _renderBody() {
   List<Widget> _pages = [];

   for (int i = 0; i < _tabs.length; i++) {
     _pages.add(_renderListPage(UniqueKey()));
   }
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: TabBar(
            indicatorColor: Colors.white,
            tabs: _tabs,
            controller: _tabController,
          ),
        ),
        Expanded(
            child: TabBarView(
              controller: _tabController,
                children:_pages.toList()
            )
        )
      ],
    );
 }

  Widget _renderListPage(UniqueKey uniqueKey) {
    var avatar = "https://img2.woyaogexing.com/2020/06/19/adad16039b124fedab4202b2f0055c7c!400x400.jpeg";
    return ListView.separated(
        key: uniqueKey,
        itemBuilder: (BuildContext context, int index) {
          var random = Random();
          return AuthorRankItem(
            avatar: avatar,
            username: "自行车v额外",
            userSign: "是对抗肌肤金额快乐我就分开了收到了就哭就哭了",
            readCount: random.nextInt(437438).toString(),
            favorCount: random.nextInt(134).toString(),
            level: random.nextInt(10).toString(),
            onTap: (){},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1,);
        },
        itemCount: 10);
  }
}

