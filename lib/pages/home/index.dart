import 'package:flutter/material.dart';
import 'package:juejin/components/home_list_view.dart';
import 'package:juejin/pages/tag-manage/tag-manage.dart';

import '../search/search.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:juejin/store/counter.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _JueJinHomeState createState() => _JueJinHomeState();
}

class _JueJinHomeState extends State<HomeIndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = new ScrollController();
  int _initIndex = 0;
  bool isShow = true;

  final Counter _counter = Counter();

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
    List<Widget> list = [];

    for (int i = 0; i < _tabs.length; i++) {
      list.add(HomeListView(
        list: List.filled(50, 0),
        type: i,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body: renderBody()
    );
  }


  // 状态栏
  PreferredSizeWidget renderAppBar() {
    return PreferredSize(
      child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: _renderPageTitle(),
          decoration: BoxDecoration(
            color: Colors.blue,
          )),
      preferredSize: Size(MediaQuery.of(context).size.width, 50),
    );
  }

  // tabBar
  Widget renderTabBar() {
    return Container(
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
              icon: Icon(
                Icons.flash_on,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        )
    );
  }

  // 页面主体
  Widget renderBody() {
    return Column(
      children: [
        Column(
          children: [
            Observer(
              builder: (_) => Text(
                '${_counter.value}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  _counter.increment();
                },
                child: Text("increase")),
            TextButton(
                onPressed: () {
                  _counter.decrement();
                },
                child: Text("decrement"))
          ],
        ),
        renderTabBar(),
        Expanded(
            child: TabBarView(
                controller: _tabController,
                key: PageStorageKey<String>("tabBar"),
                children: _renderPages()
            )
        )
      ],
    );
  }

  Widget _renderPageTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
      children: [
        Expanded(
          child: Container(
              color: Colors.blue[300],
              width: double.maxFinite,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
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
                          style: TextStyle(color: Colors.blue[50], fontSize: 14),
                        )
                      ],
                    )
                ),
              )
          ),
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TagManagePage();
              })
              );
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
      )
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