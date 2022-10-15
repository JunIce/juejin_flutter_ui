import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juejin/components/offline-activity-item.dart';

class OfflineActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _offlineActivityPage();
  }
}

class _offlineActivityPage extends State<OfflineActivityPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  List<Tab> _tabs = [
    Tab(
      text: "全部",
    ),
    Tab(
      text: "北京",
    ),
    Tab(
      text: "上海",
    ),
    Tab(
      text: "广州",
    ),
    Tab(
      text: "深圳",
    ),
    Tab(
      text: "南京",
    ),
    Tab(
      text: "武汉",
    ),
  ];

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
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text("线下活动"),
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
            isScrollable: true,
            tabs: _tabs,
            indicatorColor: Colors.white,
            controller: _tabController,
          ),
        ),
        Expanded(
            child: TabBarView(
                controller: _tabController, children: _pages.toList()))
      ],
    );
  }

  Widget _renderListPage(e) {
    var image =
        "https://hbimg.huabanimg.com/6dfa13399dc7b7d4ae22edf9ced51369aede2b0c26dc48-TnoWhw_fw658/format/webp";
    var title = "网络通信框架 SOFABolt 的功能介绍及协议框架解析";

    return ListView.separated(
        key: e,
        itemBuilder: (BuildContext context, int index) {
          // 随机布尔值
          var random = Random();

          return OfflineActivityItem(
              bgImage: image,
              title: title,
              location: "不限",
              date: "06-23 周六",
              isOutDate: random.nextBool(),
              onTap: () {
                print(index);
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 30,
          );
        },
        itemCount: 10);
  }
}
