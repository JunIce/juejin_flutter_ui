import 'package:flutter/material.dart';
import 'package:juejin/components/article-list-item.dart';

class MeDoLikePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeDoLikePage();
  }
}

class _MeDoLikePage extends State<MeDoLikePage> with TickerProviderStateMixin {
  List<Widget> _tabs = [
    Tab(text: "文章"),
    Tab(text: "沸点"),
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
        title: Text(
          "我赞过的",
          style: TextStyle(fontSize: 16),
        ),
        elevation: 0,
      ),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          width: double.maxFinite,
          child: TabBar(
            isScrollable: true,
            tabs: _tabs,
            indicatorColor: Colors.white,
            controller: _tabController,
          ),
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ArticleListItem(
                title: '苏打粉机会可缓解咳嗽的空间划分',
                extra: "13人点赞 · Tecode · 1年前",
                coverImage:
                    "https://hbimg.huabanimg.com/d480bc2950e15b6245cb5e03775b4f0365ec12143d761-YoaAKX_fw658/format/webp",
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
            ),
          ),
          ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ArticleListItem(
                title: '但是看了飞机看来就放了快',
                extra: "13人点赞 · Tecode · 1年前",
                coverImage:
                    "https://hbimg.huabanimg.com/50f91aa15fec5e4ffb1ad0e3cfad1cdb280e1eb33ff66-CAMZjj_fw658/format/webp",
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
            ),
          ),
        ]))
      ],
    );
  }
}
