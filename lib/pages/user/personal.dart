import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:juejin/common/TabBarPersistentHeaderDelegate.dart';
import 'package:juejin/common/util.dart';

class UserPersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPeronalPage();
  }
}

class _UserPeronalPage extends State<UserPersonalPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController =
      new ScrollController(initialScrollOffset: 0);
  late TabController _tabController;

  List<Tab> _tabs = [
    Tab(
      text: "动态",
    ),
    Tab(
      text: "专栏",
    ),
    Tab(
      text: "沸点",
    ),
    Tab(
      text: "分享",
    ),
    Tab(
      text: "更多",
    ),
  ];

  int _currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
        length: _tabs.length, vsync: this, initialIndex: _currentTab);
  }

  bool _offstage = false;
  _handleScroll(double offset) {
    bool temp = offset > 60;
    print(temp);
    setState(() {
      _offstage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: NotificationListener(
            onNotification: (e) {
              if (e is ScrollUpdateNotification && e.depth == 0) {
                _handleScroll(e.metrics.pixels);
              }
              return true;
            },
            child: Stack(
              children: [
                renderBody(),
                renderAppBarTransparent(),
              ],
            )));
  }

  Widget renderAppBarTransparent() {
    Color color = _offstage ? Colors.blue : Colors.transparent;
    return _renderAppBarMainBody(color);
  }

  Widget _renderAppBarMainBody(Color color) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return SizedBox(
        height: paddingTop + 56,
        child: AppBar(
          backgroundColor: color,
          elevation: 0,
          title: Text("DJHK"),
          toolbarOpacity: 1,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  Widget renderBody() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              renderHeaderImage(),
              renderUserAvatar(),
              renderUserInfo(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
//        renderTabBar(),
        SliverFillRemaining(
            child: TabBarView(
                controller: _tabController, children: _renderTabView()))
      ],
    );
  }

  // 标题背景图片
  Widget renderHeaderImage() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://img2.woyaogexing.com/2020/06/15/60c3cd9b349f4aa5b8b6b9f9178b54ee!1242x9999.jpeg",
              ),
              fit: BoxFit.cover)),
    );
  }

  //用户头像
  Widget renderUserAvatar() {
    return Container(
      height: 40,
      color: Colors.white,
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          Positioned(
            top: -40,
            left: 20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img2.woyaogexing.com/2020/06/15/c8abd88ddeaa45feae4fa4f2113b0a0e!400x400.jpeg"))),
            ),
          )
        ],
      ),
    );
  }

  // 用户信息
  Widget renderUserInfo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "自行车",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              OutlinedButton.icon(
                  // textColor: Colors.green,
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("关注")),
            ],
          ),
          Text(
            "前端工程师 @字节跳动",
            style: TextStyle(color: Color(0xff333333)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "more and more",
            style: TextStyle(color: Color(0xff666666)),
          ),
          SizedBox(
            height: 4,
          ),
          renderFollower()
        ],
      ),
    );
  }

  // 收藏者数据面板
  Widget renderFollower() {
    var renderItem = (String title, int count) {
      return Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(color: Color(0xff999999), fontSize: 12),
          )
        ],
      );
    };

    return Row(
      children: [
        renderItem('关注', 44),
        SizedBox(
          width: 20,
        ),
        renderItem('关注者', 4367),
        SizedBox(
          width: 20,
        ),
        renderItem('倔力值', 235)
      ],
    );
  }

  // tab
  Widget renderTabBar() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: TabBarPersistentHeaderDelegate(
            maxHeight: 50,
            minHeight: 50,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                tabs: _tabs,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                onTap: (tab) {
                  setState(() {
                    _currentTab = tab;
                  });
                },
              ),
            )));
  }

  List<Widget> _renderTabView() {
    List<Widget> list = List.filled(_tabs.length, 0 as Widget, growable: true);
    for (int i = 0; i < _tabs.length; i++) {
      list.add(Container(
        color: Util.slRandomColor(),
        child: Center(
          child: Container(
            child: Text(
              "${i + 1}",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      ));
    }

    return list;
  }
}
