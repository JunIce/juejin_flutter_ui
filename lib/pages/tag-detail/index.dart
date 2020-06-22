import 'package:flutter/material.dart';

class TagDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagDetailPage();
  }
}

class _TagDetailPage extends State<TagDetailPage> with TickerProviderStateMixin{

  List<Tab> _tabs = [
    Tab(text: "热门",),
    Tab(text: "最新",),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _renderBody(),
    );
  }

 Widget _renderBody() {

    return CustomScrollView(
      slivers: [
        _renderAppBar(),
        _renderListBody()
      ],
    );
 }

 Widget _renderAppBar() {
    return SliverAppBar(
      title: Text("flutter"),
      backgroundColor: Colors.blue,
      expandedHeight: 100,
      pinned: true,
      floating: true,
      stretch: false,
      bottom: TabBar(
          tabs: _tabs,
        controller: _tabController,
      ),
    );
 }

 Widget _renderListBody() {
    return SliverFillRemaining(
      child: TabBarView(
        controller: _tabController,
          children: [
        Container(
          color: Colors.red,
          child: Center(child: Text("1"),),
        ),
        Container(
          color: Colors.yellow,
          child: Center(child: Text("2"),),
        )
      ]),
    );
 }
}