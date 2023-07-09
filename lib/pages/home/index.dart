import 'package:flutter/material.dart';
import 'package:juejin/common/colors.dart';
import 'package:juejin/components/home_list_view.dart';
import 'package:juejin/icons/index.dart';
import 'package:juejin/pages/home/tab-view/page-follow.dart';
import 'package:juejin/pages/home/tab-view/page-hot.dart';
import 'package:juejin/pages/home/tab-view/page-recommend.dart';
import 'package:juejin/pages/tag-manage/tag-manage.dart';
import '../search/search.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _JueJinHomeState createState() => _JueJinHomeState();
}

class _JueJinHomeState extends State<HomeIndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = new ScrollController();
  int _initIndex = 2;
  bool isShow = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        initialIndex: _initIndex, length: _tabs.length, vsync: this);

    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
  }

  List<Tab> _tabs = [
    Tab(
      text: "关注",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "热榜",
    ),
    Tab(
      text: "前端",
    ),
    Tab(
      text: "后端",
    ),
    Tab(
      text: "测试",
    )
  ];

  List<Widget> _renderPages() {
    List<Widget> list = [];

    list.add(IndexPageFollow());
    list.add(IndexPageRecommend());
    list.add(IndexPageHot());

    for (int i = 3; i < _tabs.length; i++) {
      list.add(HomeListView(
        list: List.filled(50, 0),
        type: i,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: renderAppBar(), body: renderBody());
  }

  // 状态栏
  PreferredSizeWidget renderAppBar() {
    return PreferredSize(
      child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: _renderPageTitle(),
          decoration: BoxDecoration(
            color: Colors.white,
          )),
      preferredSize: Size(MediaQuery.of(context).size.width, 50),
    );
  }

  // tabBar
  Widget renderTabBar() {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TabBar(
                tabs: _tabs,
                isScrollable: true,
                controller: _tabController,
                labelColor: AppColor.tabTextActiveColor,
                unselectedLabelColor: AppColor.tabTextColor,
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                indicatorColor: Colors.blue[800],
                // indicatorSize: TabBarIndicatorSize(tab),
                onTap: (int index) {
                  setState(() {
                    _initIndex = index;
                  });
                },
              ),
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.flash_on,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ));
  }

  // 页面主体
  Widget renderBody() {
    return Column(
      children: [
        renderTabBar(),
        Expanded(
            child: TabBarView(
                controller: _tabController,
                key: PageStorageKey<String>("tabBar"),
                children: _renderPages()))
      ],
    );
  }

  Widget _renderPageTitle() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TagManagePage();
                  }));
                },
                child: Icon(
                  IconFontIcons.iconZhibo,
                  // size: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColor.searchBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchPage();
                      }));
                    },
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "搜索稀土掘金",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        )),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TagManagePage();
                  }));
                },
                child: Icon(
                  IconFontIcons.iconQiandao,
                  // size: ,
                ),
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();

    super.dispose();
  }
}
