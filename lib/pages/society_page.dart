import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/common/util.dart';
import 'package:juejin/components/home-list-item3.dart';
import 'package:juejin/components/user-card-item.dart';

class SocietyPage extends StatefulWidget {
  @override
  _SocietyPageState createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Tab> tabList = [Tab(text: '发现'), Tab(text: '关注')];
  String avatar =
      "https://p3-passport.byteimg.com/img/user-avatar/b0994e8d2f6b2b3efbc135a9efb126eb~100x100.png";
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
                  isScrollable: true,
                  //是否可以滚动
                indicatorWeight: 3,
                indicatorColor: Color.fromRGBO(26, 117, 237, 1),
                  controller: _controller,
                labelColor: Color.fromRGBO(26, 117, 237, 1),
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
        // 发现列表
        _renderListFind(),
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

  Widget _renderListFind() {
    return CustomScrollView(
      slivers: [_renderTagScrollList(), _renderFindList()],
    );
  }

  Widget _renderTagScrollList() {
    return SliverToBoxAdapter(
        child: Container(
            child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "推荐圈子",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "我加入的圈子",
                      style: TextStyle(fontSize: 13, color: Color(0xff999999)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [..._tabList()],
            ),
          ),
        )
      ],
    )));
  }

  SliverList _renderFindList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: UserCardItem(
            avatar: avatar,
            username: username,
            extra: "1星期前",
            title: "圣诞节看风景看韩剧的经济开发",
            content: "但是空间氛围返回跨境电商科技发达口角是非见客户维科家纺很快就收到话费科技",
            likeCount: "4",
            commentCount: "5",
            tag: '上班摸鱼'),
      );
    }, childCount: 30));
  }

  List<Widget> _tabList() {
    List<Widget> _list = [];
    for (int i = 0; i < 10; i++) {
      _list.add(Container(
        margin: EdgeInsets.only(left: 15, right: i == 9 ? 15 : 0),
        child: Column(children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://p.qqan.com/up/2022-11/202211241010365671.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 4),
              width: 80,
              child: Text(
                "树洞一下双电的军事科技发达",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ))
        ]),
      ));
    }
    return _list;
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
