import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Tab> tabList = [Tab(text: '推荐'),
      Tab(text: '热点'),
      Tab(text: '社会'),];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blue,
            width:double.infinity,
            height: 40,
            child: TabBar(
                  isScrollable: true,
                  //是否可以滚动
                  indicatorWeight: 2,
                  indicatorColor: Colors.white,
                  controller: _controller,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue[70],
                  labelStyle: TextStyle(fontSize: 16.0),
                  tabs: tabList.map((item) => item).toList(),
                )
          )
          ,
          Expanded(
            child: TabBarView(
            controller: _controller,
            children: <Widget>[
            Center(child: Text('1'),),
            Center(child: Text('2'),),
            Center(child: Text('3'),),
          ],),
          )
        ],
      ),
    ),
    );
  }
}