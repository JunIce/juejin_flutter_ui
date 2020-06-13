import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/home_list_view.dart';
import 'package:flutter_app/pages/tag-manage/tag-manage.dart';

import '../search/search.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _JueJinHomeState createState() => _JueJinHomeState();
}

class _JueJinHomeState extends State<HomeIndexPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController = new ScrollController();
  int _initIndex = 0;
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: _initIndex, length: _tabs.length, vsync: this);

    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
  }

  List<Tab> _tabs = [
    Tab(
      text: "测试1",
    ),
    Tab(
      text: "测试2",
    ),
    Tab(
      text: "测试3",
    ),
    Tab(
      text: "测试4",
    ),
    Tab(
      text: "测试5",
    ),
    Tab(
      text: "测试6",
    ),
    Tab(
      text: "测试7",
    ),
    Tab(
      text: "测试8",
    ),
  ];

  List<Widget> _renderPages() {
    List<Widget> list = List();



    for (int i = 0; i < _tabs.length; i++) {
      list.add(HomeListView(controller: _scrollController, list: List(50), type: i,));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: double.maxFinite,
              child: Container(
                padding: EdgeInsets.all(10),
                child: _renderPageTitle(context),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
        ),
        body: Column(
          children: [
            // tabbar
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: TabBar(
                    tabs: _tabs,
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    onTap: (int index) {
                      setState(() {
                        _initIndex = index;
                      });
                    },
                  ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.flash_on, color: Colors.white,),
                  )
                ],
              )
            ),

            // scrollview
            Expanded(
                child: TabBarView(
                    key: PageStorageKey<String>("tabBar"),
                    controller: _tabController,
                    children: _renderPages()))
          ],
        ));
  }

//  ListView(
//  children: [HomeTopRec(data: hots), _itemBuild(), _itemBuild(), _itemBuild()],
//  ),

  Row _renderPageTitle(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              color: Colors.blue[300],
              width: double.maxFinite,
              child: InkWell(
                onTap: () {
                  print("dddd");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "搜索文章、用户、标签",
                          style:
                              TextStyle(color: Colors.blue[50], fontSize: 14),
                        )
                      ],
                    )),
              )),
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TagManagePage();
              }));
            },
            child: Row(children: [
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "标签",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ]),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _tabController.dispose();

    super.dispose();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
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
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    print(oldDelegate.maxHeight);
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
