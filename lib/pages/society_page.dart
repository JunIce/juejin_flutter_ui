import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/common/util.dart';
import 'package:juejin/components/home-list-item3.dart';
import 'package:juejin/components/home_list_item1.dart';
import 'package:juejin/components/home_list_item2.dart';

class SocietyPage extends StatefulWidget {
  @override
  _SocietyPageState createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Tab> tabList = [
    Tab(text: '关注'),
    Tab(text: '推荐'),
    Tab(text: '热门'),
    Tab(text: '内推招聘'),
    Tab(text: '掘金相亲'),
    Tab(text: '开源推荐'),
    Tab(text: '上班摸鱼'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabList.length, vsync: this);
  }

  void _showDialog() {
    Size size = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(vertical: 140, horizontal: 30),
            backgroundColor: Colors.transparent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "关注掘金官方账号",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://p3.ssl.qhimgs1.com/bdr/326__/t01f262da6a4d90f8f3.jpg"),
                                  ),
                                  title: Text("掘金小册"),
                                  subtitle: Text("掘金首席体验官"),
                                  trailing: OutlinedButton(
                                    onPressed: () {},
                                    child: Text("关注"),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 1,
                                );
                              },
                              itemCount: 4)),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextButton(
                            // color: Colors.blue,
                            // textColor: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("关注全部4人， 进入沸点")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.primaryBgColor,
        appBar: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: double.maxFinite,
              color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      //是否可以滚动
                      indicatorWeight: 2,
                      indicatorColor: Colors.white,
                      controller: _controller,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.blue[70],
                      labelStyle: TextStyle(fontSize: 16.0),
                      tabs: tabList,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showDialog();
                    },
                  )
                ],
              )),
          preferredSize:
              Size(MediaQuery.of(context).size.width, double.maxFinite),
        ),
        body: TabBarView(
            controller: _controller, children: _renderList(context)));
  }

  List<Widget> _renderList(context) {
    // ignore: deprecated_member_use
    // List<Widget> list = List();
    List<Widget> list =
        List.filled(tabList.length, 0 as Widget, growable: true);

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
                  tag: '上班摸鱼'
              );
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
