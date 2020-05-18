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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Config.primaryBgColor,
      appBar: AppBar(
        title: Text("掘金相亲"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image:
                          NetworkImage(
                            "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3444508248,1197396609&fm=26&gp=0.jpg",
                          ))
                        )
                      ),
                      Expanded(child: Container(
                        color: Util.slRandomColor(),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("掘金相亲", style: TextStyle(color: Colors.black, fontSize: 20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

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
                    ]
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10),child: Container(
                  child: Text(
                      "UP本质上是一种特殊的奖金,是基于员工历史贡献和未来发展前途来确定的一种长期但非永久的奖金分配权力。 最近华为轮值CEO郭平在新年致辞中提到:“我们继续推动获取分"),
                ),),

                Container(
                  height: 50,
                  color: Util.slRandomColor(),
                )
              ],
            ),
          )),
//          SliverAppBar(
//            backgroundColor: Colors.white,
//            title: Text("掘金相亲"),
//            pinned: true,
//            actions: [
//              IconButton(icon: Icon(Icons.share),)
//            ],
//          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          SliverPersistentHeader(
//             pinned: true,
              floating: true,
              delegate: TabBarPersistentHeaderDelegate(
                  maxHeight: 50,
                  minHeight: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xff999999)))),
                    child: TabBar(
                      tabs: _tabs,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      controller: _tabController,
                    ),
                  ))),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          )
        ],
      ),
    );
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
