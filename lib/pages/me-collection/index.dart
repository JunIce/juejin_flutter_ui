import 'package:flutter/material.dart';
import 'package:juejin/pages/tag-manage/collection-item.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CollectionPage();
  }
}

class _CollectionPage extends State<CollectionPage> with SingleTickerProviderStateMixin {

  List<Tab> _tab = [
    Tab(text: "创建的"),
    Tab(text: "关注的"),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _tabController = TabController(length: _tab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("收藏集"),
        actions: [
          GestureDetector(
            onTap: () {
              print("Tap");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: renderBody(),
    );
  }

  Widget renderBody() {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          width: double.maxFinite,
          child:TabBar(
            isScrollable: true,
            tabs: _tab,
            indicatorColor: Colors.white,
            controller: _tabController,
          ),
        ),
        Expanded(child:
          TabBarView(
            controller: _tabController,
              children: [
                renderCreateList(),
                renderFollowedList()
              ]
          )
        )
      ],
    );
  }

  Widget renderCreateList() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CollectionItem(
            imageUrl: "https://hbimg.huabanimg.com/a18bb2e6abb612cf08b0acdc52da812541439d99258c3-8cc1dB_/fw/480/format/webp",
            title: "flutter",
            count: "12",
            followerCount: "32",
            username: "Hello world",
            onTap: (){},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1,);
        },
        itemCount: 10
    );
  }

  Widget renderFollowedList() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CollectionItem(
            imageUrl: "https://hbimg.huabanimg.com/a18bb2e6abb612cf08b0acdc52da812541439d99258c3-8cc1dB_/fw/480/format/webp",
            title: "flutter",
            count: "12",
            followerCount: "32",
            username: "Hello world",
            onTap: (){},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1,);
        },
        itemCount: 10
    );
  }

}


