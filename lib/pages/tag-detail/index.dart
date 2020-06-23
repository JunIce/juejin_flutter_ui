import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/article-list-item.dart';

class TagDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagDetailPage();
  }
}

class _TagDetailPage extends State<TagDetailPage>
    with TickerProviderStateMixin {
  List<Tab> _tabs = [
    Tab(
      text: "热门",
    ),
    Tab(
      text: "最新",
    ),
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
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return CustomScrollView(
      slivers: [_renderAppBar(), _renderListBody()],
    );
  }

  Widget _renderAppBar() {
    var bgImg =
        "https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3252521864,872614242&fm=26&gp=0.jpg";
    return SliverAppBar(
      title: Text("flutter"),
      pinned: true,
      floating: false,
      expandedHeight: 140,
      flexibleSpace: Container(
        height: 184,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(bgImg), fit: BoxFit.cover)),
        child: Row(
          children: [


            FlatButton.icon(
              color: Colors.green,
              icon: Icon(Icons.check, color: Colors.white,), onPressed: (){},
              label: Text("关注", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
      bottom: TabBar(
        tabs: _tabs,
        controller: _tabController,
      ),
    );
  }

  Widget _renderListBody() {
    var random = Random();
    var title = "苏打粉看见了轮廓就弗兰克";
    var extra = "1127人点赞 的萨芬健康 1年前";
    var image =
        "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3892521478,1695688217&fm=26&gp=0.jpg";

    return SliverFillRemaining(
      child: TabBarView(controller: _tabController, children: [
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (BuildContext context, int idx) {
              return ArticleListItem(
                title: title,
                extra: extra,
                coverImage: random.nextBool() ? image : null,
              );
            }),
        ListView.separated(
            itemCount: 20,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (BuildContext context, int idx) {
              return ArticleListItem(
                title: title,
                extra: extra,
                coverImage: random.nextBool() ? image : null,
              );
            }),
      ]),
    );
  }
}
