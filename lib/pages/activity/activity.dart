import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/util.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActivityPage();
  }
}

class _ActivityPage extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTab = 0;

  ScrollController _ListScrollController = new ScrollController();

  List<Tab> _tabs = [
    Tab(
      text: "热门",
    ),
    Tab(
      text: "最新",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: _tabs.length, vsync: this);

    _ListScrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryBgColor,
      appBar: AppBar(
        title: Text("掘金相亲"),
      ),
      body: NestedScrollView(
        controller: _ListScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            renderHeaderLogoAndTitle(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            renderHeaderTab(),
          ];
        },
        body: renderPage(),
      ),
    );
  }

// 渲染主tab页面
  Widget renderPage() {
    return TabBarView(controller: _tabController, children: [
      ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int idx) {
            return Container(
              color: Colors.red,
              height: 100,
            );
          }),
      ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int idx) {
            return Container(
              color: Colors.blue,
              height: 100,
            );
          }),
    ]);
  }

// 渲染固定头部
  Widget renderHeaderTab() {
    return SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: TabBarPersistentHeaderDelegate(
            maxHeight: 50,
            minHeight: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xff999999)))),
              child: TabBar(
                tabs: _tabs,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                onTap: (tab) {
                  setState(() {
                    print(tab);
                    _currentTab = tab;
                  });
                },
              ),
            )));
  }

// 渲染关注者
  Widget renderFollower() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Text("6057", style: TextStyle(fontSize: 14, color: Colors.black)),
          Text("关注者", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
        ]),
        Column(children: [
          Text("768", style: TextStyle(fontSize: 14, color: Colors.black)),
          Text("沸点", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
        ])
      ],
    );
  }

// 渲染关注人列表
  Widget renderJoinMan() {
    List<Widget> list = List();

    for (var i = 0; i < 5; i++) {
      list.add(Container(
          margin: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img2.woyaogexing.com/2020/06/12/d31f9618abd945fdaa182137050950a1!400x400.jpeg'),
            radius: 14,
          )));
    }

    list.add(Text(
      "已有7.9K人参加",
      style: TextStyle(color: Color(0xff999999)),
    ));
    return Row(
      children: list.toList(),
    );
  }

// 主页面logo部分widget
Widget renderHeaderLogoAndTitle() {
  return SliverToBoxAdapter(
                child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3444508248,1197396609&fm=26&gp=0.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 15),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "掘金相亲",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: 100, child: renderFollower()),
                                OutlineButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  label: Text("关注"),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        "UP本质上是一种特殊的奖金,是基于员工历史贡献和未来发展前途来确定的一种长期但非永久的奖金分配权力。 最近华为轮值CEO郭平在新年致辞中提到:“我们继续推动获取分",
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  renderJoinMan()
                ],
              ),
            ));
}

}

class TabBarPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  TabBarPersistentHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: child);
  }

  @override
  bool shouldRebuild(TabBarPersistentHeaderDelegate oldDelegate) {
    print(oldDelegate.maxHeight);
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
