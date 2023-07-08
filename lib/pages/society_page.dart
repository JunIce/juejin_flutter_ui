import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/components/user-card-item.dart';

class SocietyPage extends StatefulWidget {
  @override
  _SocietyPageState createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Widget> tabList = [
    Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Tab(text: '发现'),
    ),
    Container(
        padding: EdgeInsets.only(right: 10, left: 10), child: Tab(text: '关注'))
  ];
  String avatar =
      "https://img0.baidu.com/it/u=1396456140,563000347&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1671814800&t=27b6c6275e8ceba219905d917cc116ac";
  var username = "JunIce";
  List<String> images = [
    "https://p1.ssl.qhimgs1.com/bdr/326__/t013bfdb724ccde6227.jpg",
    "https://p2.ssl.qhimgs1.com/bdr/326__/t0108dc82794264fe32.jpg",
    "https://p0.ssl.qhimgs1.com/bdr/326__/t01b2a9b3103a29dba0.jpg",
    "https://p3.ssl.qhimgs1.com/bdr/326__/t0121d70ff844efb5f9.jpg",
    "https://p0.ssl.qhimgs1.com/bdr/326__/t013cd39cd3c08d971e.jpg",
    "https://p2.ssl.qhimgs1.com/bdr/326__/t0154687f04bb6e87c8.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryBgColor,
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                //是否可以滚动
                isScrollable: true,
                indicatorWeight: 3,
                indicatorColor: Color.fromRGBO(26, 117, 237, 1),
                controller: _controller,
                labelColor: Color.fromRGBO(26, 117, 237, 1),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: tabList,
              )
            ],
          ),
        ),
        preferredSize:
            Size(MediaQuery.of(context).size.width, double.maxFinite),
      ),
      body: TabBarView(controller: _controller, children: [
        // 关注列表
        _renderListFollowed(),
      ]),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 111, 187, 249),
                blurRadius: 5,
                spreadRadius: 0.0,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 80, 174, 252),
                  Color.fromARGB(255, 32, 131, 212),
                ])),
        child: Icon(
          Icons.edit_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _renderListFollowed() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return UserCardItem(
              avatar: avatar,
              username: username,
              extra: "1星期前",
              title: "圣诞节看风景看韩剧的经济开发",
              content: "但是空间氛围返回跨境电商科技发达口角是非见客户维科家纺很快就收到话费科技",
              likeCount: "4",
              commentCount: "5",
              images: images,
              tag: '上班摸鱼');
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
        itemCount: 50);
  }
}
