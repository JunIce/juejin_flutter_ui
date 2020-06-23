import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/util.dart';
import 'package:flutter_app/components/article-list-item.dart';
import 'package:flutter_app/components/icon-text.dart';
import 'package:flutter_app/components/list_item_listtile.dart';
import 'package:flutter_app/pages/activity/activity.dart';
import 'package:flutter_app/pages/author-rank/index.dart';
import 'package:flutter_app/pages/offline-activity/index.dart';
import 'package:flutter_app/pages/tag-manage/tag-manage.dart';
import 'package:flutter_app/pages/topics/index.dart';

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
          title: Container(
              color: Colors.blue[300],
              padding: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '搜索文章、用户、标签',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              )),
        ),
        body: RefreshIndicator(
            child: ListView(
                controller: _scrollController,
                children: _renderFirstChild().toList()),
            onRefresh: _refresh
        )
    );
  }

  Future<Null> _refresh() async {
    _datalist.clear();
    print("refresh: " + 111.toString());
    await _getMoreData();
    return;
  }

  List<Widget> _renderFirstChild() {
    List<Widget> list = List();

    // Loading
    list.add(Offstage(
        offstage: _hideloading,
        child: Container(
          height: 100,
          child: Center(
            child: Text("正在加载数据，请稍后..."),
          ),
        )));

    // Banner
    list.add(Container(
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551606381887&di=bbd9625453a6e0efa1b25a2e990862f0&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46b2ac46146063f6246b60af15.jpg'),
              fit: BoxFit.fill)),
    ));

    // GridView
    list.add(GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 5,
      childAspectRatio: 1.1,
      children: _renderGridList().toList(),
    ));

    // Divider
    list.add(SizedBox(
      height: 10,
    ));

    // title
    list.add(Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffeeeeee)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconText(
            icon: Icons.favorite,
            iconSize: 18,
            iconColor: Colors.red,
            textColor: Colors.black87,
            textSize: 15,
            text: '热门文章',
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TagManagePage();
              }));
            },
            child: IconText(
              icon: Icons.settings,
              iconColor: Colors.black87,
              textColor: Colors.black87,
              iconSize: 18,
              textSize: 15,
              text: '定制热门',
            ),
          )
        ],
      ),
    ));

    list.add(ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,int index) {
          return ArticleListItem(
            title: "圣诞节狂欢凤凰科技符合健康",
            extra: "114人赞 前端谨记着 11小时前",
          );
        },
        separatorBuilder: (BuildContext context,int index) {
          return Divider(height: 1,);
        },
        itemCount: _datalist.length
    ));

    // Loading
    list.add(Visibility(
      visible: _showMore,
      child: Container(
        height: 100,
        child: Center(
          child: Text("正在加载数据，请稍后..."),
        ),
      ),
    ));

    return list;
  }

  List<Widget> _renderGridList() {
    List<Widget> _list = [];
    _list
        ..add(Container(
          padding: EdgeInsets.only(top: 20, bottom: 0),
          color: Colors.white,
          child: IconText(
            direction: Axis.vertical,
            icon: Icons.hot_tub,
            iconSize: 18,
            textSize: 14,
            iconColor: Util.slRandomColor(),
            text: "文章榜",
            )
          )
        )
        ..add(
            Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                color: Colors.white,
                child: IconText(
                  direction: Axis.vertical,
                  icon: Icons.favorite,
                  iconSize: 18,
                  textSize: 14,
                  iconColor: Util.slRandomColor(),
                  text: "作者榜",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return AuthorRankPage();
                    }));
                  },
                )
            )
        )
      ..add(
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 0),
              color: Colors.white,
              child: IconText(
                direction: Axis.vertical,
                icon: Icons.local_activity,
                iconColor: Util.slRandomColor(),
                text: "看一看",
                iconSize: 18,
                textSize: 14,
              )
          )
      )
      ..add(
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 0),
              color: Colors.white,
              child: IconText(
                direction: Axis.vertical,
                icon: Icons.local_cafe,
                iconColor: Util.slRandomColor(),
                text: "话题广场",
                iconSize: 18,
                textSize: 14,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return TopicListPage();
                  }));
                },
              )
          )
      )
      ..add(
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 0),
              color: Colors.white,
              child: IconText(
                direction: Axis.vertical,
                icon: Icons.local_bar,
                iconColor: Util.slRandomColor(),
                text: "活动",
                iconSize: 18,
                textSize: 14,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return OfflineActivityPage();
                  }));
                },
              )
          )
      );


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
