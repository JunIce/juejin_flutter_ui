import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juejin/pages/search/search.dart';

class TagManagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagManagePage();
  }
}

class _TagManagePage extends State<TagManagePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  var tabs = <Tab>[
    Tab(
      text: "已关注标签",
    ),
    Tab(
      text: "所有标签",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "标签管理",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              child: Icon(
                Icons.search,
                size: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
          elevation: 0),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Row(
              children: [
                TabBar(
                  controller: _controller,
                  tabs: tabs,
                  isScrollable: true,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                _renderFollowList(),
                _renderAllTagList(),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xfff4f4f4),
    );
  }

  Widget _renderFollowList() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          if (index.isOdd)
            return Divider(
              height: 1,
            );
          return _renderItem();
        });
  }

  Widget _renderAllTagList() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 8),
          child: Text("推荐标签"),
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 8),
          child: Text("你可能感兴趣的标签"),
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem(),
        Divider(
          height: 1,
        ),
        _renderItem()
      ],
    );
  }

  Widget _renderItem() {
    bool active = Random().nextBool();
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img2.woyaogexing.com/2020/05/13/6a6bc5e61e864388bf102528be9ffa8c!400x400.webp"),
          ),
        ),
        title: Text("Go"),
        subtitle: Text("71582人关注 · 5000篇文章", maxLines: 1, overflow: TextOverflow.ellipsis,),
        trailing: _renderButton(active),
      ),
    );
  }

  Widget _renderButton(bool active) {
    if (active) {
      return FlatButton.icon(
          icon: Icon(Icons.check),
          label: Text("已关注"),
          onPressed: () {},
          color: Color(0xff6cbd45),
          textColor: Colors.white);
    } else {
      return OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("关注"),
          onPressed: () {},
          textColor: Color(0xff6cbd45),
          borderSide: BorderSide(
              color: Color(0xff6cbd45), width: 2.0, style: BorderStyle.solid));
    }
  }
}
