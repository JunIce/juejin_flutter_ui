import 'package:flutter/material.dart';
import 'components/bottombar.dart';
import 'pages/home_index_page.dart';
import 'pages/home_follow_page.dart';

class InstagHome extends StatefulWidget {
  @override
  _InstagHome createState() => _InstagHome();
}


class _InstagHome extends State<InstagHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  // AppBar _bar = ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: false,
      title: Container(
        width: 200,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: '首页',),
            Tab(text: '关注',),
          ]
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(Icons.arrow_drop_down),
        )
      ],
    ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xfff5f6fa)
        ),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomeIndexPage(),
            HomeFollowPage()
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}