import 'package:flutter/material.dart';

class UserPersonalTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPeronalPage();
  }
}

class _UserPeronalPage extends State<UserPersonalTestPage> {
  @override
  Widget build(BuildContext context) {
    var _tabs = <String>[];
    _tabs = <String>[
      "Tab 1",
      "Tab 2",
      "Tab 3",
    ];

    return Scaffold(
      body:

          /// 加TabBar
          DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  title: Text('标题'),
                  centerTitle: false,
                  pinned: true, // 固定
                  floating: false, // 浮动
                  snap: false,
                  primary: true,
                  expandedHeight: 350.0, // gaod

                  elevation: 3,
                  //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                  forceElevated: innerBoxIsScrolled,

                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        print("更多");
                      },
                    ),
                  ],

                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://hbimg.huabanimg.com/62c225941f47f7df533e1dc378cd6e3beddfabaf34922-0ECiKt_fw658/format/webp"))),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://hbimg.huabanimg.com/b7db1a54f7b7f7a1d7fca9eb0e8918662e2530336c31-sVAsue_fw86/format/webp"),
                              ),
                            ],
                          ),
                          Container(
                            //TabBar圆角背景颜色
                            height: 50,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),

                  bottom: TabBar(
                    labelColor: Colors.white,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              //SafeArea 适配刘海屏的一个widget
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      )
    );
  }
}
