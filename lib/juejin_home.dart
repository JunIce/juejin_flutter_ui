import 'package:flutter/material.dart';
import 'pages/home_index_page.dart';

class JueJinHome extends StatefulWidget {
  @override
  _JueJinHome createState() => _JueJinHome();
}


class _JueJinHome extends State<JueJinHome> {

  int _tabIndex;
  List _bottomTabs = [
    'home',
    'refresh',
    'search',
    'book',
    'read'
  ];
  var _tabs = [
    HomeIndexPage(),

  ];

  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xfff5f6fa)
        ),
        child: _tabs[_tabIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: _bottomTabs.map((t) => BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(t)
          )).toList()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}