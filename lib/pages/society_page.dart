import 'dart:async' show Future;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/request.dart';
import 'package:flutter_app/common/util.dart';

class SocietyPage extends StatefulWidget {
  @override
  _SocietyPageState createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

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
    getList();
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
                  )
                ],
              )),
          preferredSize: Size(MediaQuery.of(context).size.width, double.maxFinite),
        ),
        body: TabBarView(
            controller: _controller, children: _renderList(context)));
  }

  List _renderList(context) {
    List<Widget> list = List();

    for (int i = 0; i < tabList.length; i++) {
      list.add(
          CustomScrollView(
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
                  itemExtent: 100
              )
            ],
          )
      );
    }

    return list;
  }

  Future getList() async {
    var res = await Request.get("/list");
    print("response: $res");
  }
}
