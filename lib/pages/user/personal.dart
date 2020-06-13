import 'package:flutter/material.dart';
import 'package:flutter_app/common/util.dart';

class UserPersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPeronalPage();
  }
}

class _UserPeronalPage extends State<UserPersonalPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _controller;

  List<Tab> _tabs = [
    Tab(text: "text1"),
    Tab(text: "text2"),
    Tab(text: "text3"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          pinned: true,
//                backgroundColor: Colors.transparent,
          expandedHeight: 300,
          bottom: TabBar(
            controller: _controller,
            tabs: _tabs,
          )),
      SliverFillRemaining(
        child: TabBarView(controller: _controller, children: _renderTabView()),
      )
    ]));
  }

  List<Widget> _renderTabView() {
    List<Widget> list = List();
    for (int i = 0; i < _tabs.length; i++) {
      list.add(Container(
        color: Util.slRandomColor(),
        child: Center(
          child: Container(
            child: Text(
              "${i + 1}",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      ));
    }

    return list;
  }
}
