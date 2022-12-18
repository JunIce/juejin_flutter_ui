import 'dart:async';
import 'dart:core';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/common/util.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/icons/index.dart';
import 'package:juejin/pages/home/components/index-list-item.dart';
import 'package:juejin/pages/offline-activity/index.dart';
import 'package:juejin/pages/tech-team/index.dart';
import 'package:juejin/pages/topics/index.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List _datalist = [];

  // 下拉刷新
  bool _hideloading = true;
  //上拉加载
  bool _showMore = false;

  ScrollController _scrollController = new ScrollController();
  bool isRequest = false;
  int num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMoreData();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _showMore = true;
        });
        await _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (_hideloading) {
      num++;
      print("fetching...");
      setState(() => _hideloading = false);
      Timer(Duration(seconds: 3), () {
        var newList = List.generate(10, (index) => index);
        setState(() {
          print("请求:$num");
          _datalist.addAll(newList);
          _hideloading = true;
          _showMore = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.primaryBgColor,
        appBar: AppBar(
          backgroundColor: Config.primaryBgColor,
          title: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '搜索稀土掘金',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              )),
        ),
        body: RefreshIndicator(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // 加载中
                _loadingText(),
                // banner
                _renderBanner(),
                // 中间菜单
                _renderGridMenu(),
                //
                _renderLineMenu(),
                // 中间滚动视图
                _renderTagScrollList(),
                // 列表头部
                _renderListHeader(),
                // 列表主体
                _renderList()
              ],
            ),
            onRefresh: _refresh));
  }

  Future<Null> _refresh() async {
    _datalist.clear();
    print("refresh: " + 111.toString());
    await _getMoreData();
    return;
  }

  Widget _loadingText() {
    return SliverToBoxAdapter(
      child: Offstage(
          offstage: _hideloading,
          child: Container(
            height: 100,
            child: Center(
              child: Text("正在加载数据，请稍后..."),
            ),
          )),
    );
  }

  Widget _renderBanner() {
    return SliverToBoxAdapter(
        child: Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 10),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://p.qqan.com/up/2022-12/20221211424213803.jpg",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        autoplay: true,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    ));
  }

  Widget _renderGridMenu() {
    return SliverToBoxAdapter(
      child: Container(
        // height: 200,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _renderGridList().toList()),
      ),
    );
  }

  Widget _renderLineMenu() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 200, child: Center(child: Text("文章榜"))),
            Container(width: 200, child: Center(child: Text("作者榜")))
          ],
        ),
      ),
    );
  }

  Widget _renderListHeader() {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffeeeeee)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconText(
            icon: IconFontIcons.iconTabHot,
            iconSize: 22,
            iconColor: Colors.red,
            textColor: Colors.black87,
            textSize: 14,
            text: '热门文章',
          ),
        ],
      ),
    ));
  }

  Widget _renderTagScrollList() {
    return SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "推荐技术团队",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PageTechTeam();
                          }));
                        },
                        child: Row(
                          children: [
                            Text(
                              "全部技术团队",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(48, 123, 198, 1)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Color.fromRGBO(48, 123, 198, 1),
                            )
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

  List<Widget> _tabList() {
    List<Widget> _list = [];
    for (int i = 0; i < 10; i++) {
      _list.add(Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(left: 15, right: i == 9 ? 15 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
              image: NetworkImage(
                  "https://p.qqan.com/up/2022-12/20221219378386.jpg"),
              fit: BoxFit.cover),
        ),
      ));
    }
    return _list;
  }

  SliverList _renderList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: IndexListItem(
          title: "如何使用CSS创建高级动画，这个函数必须掌握",
          content:
              "因此如果我们要将相机实时流 CameraImage 转为yuv 或 rgba 后给opencv 或 tflite 来做后续动作，那么建议使用 ffi / method channel将数据传给 c++ 层 opencv 的 cvtColor 来转换，效率高很多！当然如果对实时流的效率要求没那么高，imageLib.Image 也是完全足以的",
          username: "摹刻",
          category: "前端",
          likeCount: "10002",
          commentCount: "237",
        ),
      );
    }, childCount: 30));
  }

  Widget _menuItem(String title, IconData icon, [Function()? onTap]) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
              color: Util.slRandomColor(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            )
          ],
        ));

    // IconText(
    //   direction: Axis.vertical,
    //   icon: icon,
    //   iconSize: 24,
    //   textSize: 14,
    //   iconColor: Util.slRandomColor(),
    //   text: title,
    //   textColor: Colors.black87,
    //   onTap: onTap,
    // )
  }

  List<Widget> _renderGridList() {
    List<Widget> _list = [];
    _list
      ..add(_menuItem("招聘", Icons.hot_tub))
      ..add(_menuItem("话题", Icons.local_cafe, () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TopicListPage();
        }));
      }))
      ..add(_menuItem("字学", Icons.local_activity))
      ..add(_menuItem(
        "活动",
        Icons.local_bar,
        () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return OfflineActivityPage();
              }));
            },
      ));

    return _list;
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
