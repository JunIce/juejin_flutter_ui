import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/common/util.dart';
import 'package:juejin/components/home-list-item3.dart';

class SocietyPage extends StatefulWidget {
  @override
  _SocietyPageState createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Tab> tabList = [
    Tab(text: '发现'), Tab(text: '关注')
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  isScrollable: true,
                  //是否可以滚动
                  indicatorWeight: 2,
                  indicatorColor: Colors.blue,
                  controller: _controller,
                  labelColor: Colors.blue,
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
        body: TabBarView(
            controller: _controller, children: _renderList(context)));
  }

  List<Widget> _renderList(context) {
    // List<Widget> list = List();
    List<Widget> list = [];

    String avatar =
        "https://p0.ssl.qhimgs1.com/bdr/326__/t0157d6c71e66dd5324.jpg";
    var username = "掘金体养颜";
    List<String> images = [
      "https://p1.ssl.qhimgs1.com/bdr/326__/t013bfdb724ccde6227.jpg",
      "https://p2.ssl.qhimgs1.com/bdr/326__/t0108dc82794264fe32.jpg",
      "https://p0.ssl.qhimgs1.com/bdr/326__/t01b2a9b3103a29dba0.jpg",
      "https://p3.ssl.qhimgs1.com/bdr/326__/t0121d70ff844efb5f9.jpg",
      "https://p0.ssl.qhimgs1.com/bdr/326__/t013cd39cd3c08d971e.jpg",
      "https://p2.ssl.qhimgs1.com/bdr/326__/t0154687f04bb6e87c8.jpg"
    ];

    for (int i = 0; i < tabList.length; i++) {
      if (i == 1) {
        list.add(ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return HomeListItem3(
                  avatar: avatar,
                  username: username,
                  extra: "圣诞节看风景可怜",
                  title: "圣诞节看风景看韩剧的经济开发",
                  content: "但是空间氛围返回跨境电商科技发达口角是非见客户维科家纺很快就收到话费科技",
                  likeCount: "382984",
                  commentCount: "473847",
                  images: images,
                  tag: '上班摸鱼');
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                ),
            itemCount: 50));
      } else {
        list.add(CustomScrollView(
          key: PageStorageKey<String>("tab_$i"),
          slivers: [
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: Util.slRandomColor(),
                      height: 50,
                    );
                  },
                  childCount: 50,
                ),
                itemExtent: 100)
          ],
        ));
      }
    }

    return list;
  }
}
