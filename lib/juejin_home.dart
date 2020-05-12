import 'package:flutter/material.dart';
import 'pages/home/index.dart';
import 'pages/society_page.dart';
import 'pages/search_page.dart';
import 'pages/shop_page.dart';
import 'pages/user_page.dart';
// import 'pages/search_page.dart';

class JueJinHome extends StatefulWidget {
  @override
  _JueJinHome createState() => _JueJinHome();
}

class _JueJinHome extends State<JueJinHome> {
  int _tabIndex;
  List _bottomTabs = ['home', 'refresh', 'search', 'book', 'read'];
  var _tabs = [
    HomeIndexPage(),
    SocietyPage(),
    SearchPage(),
    ShopPage(),
    UserPage(),
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
          decoration: BoxDecoration(color: Color(0xfff6f6f6)),
          child: _tabs[_tabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: _bottomTabs
            .map((t) =>
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(t)))
            .toList(),
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sayHello();
        },
      ),
    );
  }

  sayHello() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('说的什么标题'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('内容 1'),
                new Text('内容 2'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
}
