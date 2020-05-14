import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/components/home_list_item2.dart';
import 'package:flutter_app/pages/tag-manage/tag-manage.dart';

import '../../components/home_top_recs.dart';
import '../../components/list_top_tag.dart';
import '../search/search.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _JueJinHomeState createState() => _JueJinHomeState();
}

class _JueJinHomeState extends State<HomeIndexPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _initIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _initIndex, length: 4, vsync: this);
  }

  final tabs = [
    SizedBox(width: 40, height: 40, child: Text("测试1")),
    SizedBox(width: 40, height: 40, child: Text("测试2")),
    SizedBox(width: 40, height: 40, child: Text("测试3")),
    SizedBox(width: 40, height: 40, child: Text("测试4")),
  ];

  final tabViews = [
    Expanded(
      child: Center(
        child: Text("页面1"),
      ),
    ),
    Expanded(
      child: Center(
        child: Text("页面2"),
      ),
    ),
    Expanded(
      child: Center(
        child: Text("页面3"),
      ),
    ),
    Expanded(
      child: Center(
        child: Text("页面4"),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    List hots = [1, 2, 3];

    return Scaffold(
      appBar: AppBar(
        title: _renderPageTitle(context),
      ),
      body: ListView(
        children: [HomeTopRec(data: hots), _itemBuild(), _itemBuild(), _itemBuild()],
      ),
      backgroundColor: Config.primaryBgColor,
    );
  }

  Widget _renderTabBox() {
    return Column(
      children: [
        TabBar(
          tabs: tabs,
          controller: _tabController,
          labelColor: Colors.black,
          onTap: (int index) {
            setState(() {
              _initIndex = index;
            });
          },
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: tabViews,
        ))
      ],
    );
  }

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
                 })
                );
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
    );
  }

//  Scaffold(
//  appBar: AppBar(
//  centerTitle: false,
//  title: Container(
//  width: 200,
//  child: TabBar(
//  controller: _tabController,
//  tabs: <Widget>[
//  Tab(text: '首页',),
//  Tab(text: '关注',),
//  ]
//  ),
//  ),
//  actions: <Widget>[
//  Padding(
//  padding: const EdgeInsets.only(right: 12.0),
//  child: Icon(Icons.arrow_drop_down),
//  )
//  ],
//  ),
//  body: TabBarView(
//  controller: _tabController,
//  children: <Widget>[
//  ListView.builder(
//  itemCount: 5,
//  itemBuilder: (context, index) => index == 0 ? HomeTopRec(): _itemBuild(),
//  ),
//  HomeFollowPage()
//  ],
//  ),
//  );

  Widget _itemBuild() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
      color: Colors.white,
      child: _itemCard(),
      margin: EdgeInsets.only(top: 12),
    );
  }

  Widget _itemCard() {
    return Container(
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          _headLine,
          SizedBox(
            height: 12,
          ),
          _itemMain,
          SizedBox(
            height: 12,
          ),
          _bottomButton
        ],
      ),
    );
  }

  Row _bottomButton = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Icon(
        Icons.info_outline,
        color: Color(0xff999999),
        size: 12,
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        '543',
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff999999),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.lightbulb_outline,
        color: Color(0xff999999),
        size: 12,
      ),
      SizedBox(
        width: 4,
      ),
      Text('36',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff999999),
          ))
    ],
  );

  Row _headLine = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img2.woyaogexing.com/2019/03/01/f4471c4c54bd2c63!400x400_big.jpg'))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('生活不宠',
                style: TextStyle(color: Color(0xff333333), fontSize: 14)),
          )
        ],
      ),
      Text(
        'Python',
        style: TextStyle(color: Color(0xffcccccc), fontSize: 14),
      )
    ],
  );

  Row _itemMain = Row(
//    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Text(
            '为前端工程之崛起而编程',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
            softWrap: true,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '当时的角度主要',
            style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            softWrap: true,
            textDirection: TextDirection.ltr,
          )
        ],
      ))),
      SizedBox(
        width: 10,
      ),
      Image.network(
        'https://img2.woyaogexing.com/2018/12/29/e93a3438770aa5c3!300x200.jpg',
        fit: BoxFit.contain,
        width: 100,
      )
    ],
  );
}
