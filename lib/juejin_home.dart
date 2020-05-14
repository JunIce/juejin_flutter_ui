import 'package:flutter/material.dart';
import 'package:flutter_app/pages/book/book.dart';
import 'package:flutter_app/pages/me/me.dart';
import 'pages/home/index.dart';
import 'pages/society_page.dart';
import 'pages/search_page.dart';

class JueJinHome extends StatefulWidget {
  @override
  _JueJinHome createState() => _JueJinHome();
}

class _JueJinHome extends State<JueJinHome> {
  int _tabIndex;

  List _bottomTabs = ['home', 'refresh', 'search', 'book', 'read'];
  List _bottomIcons = [Icon(Icons.home), Icon(Icons.refresh), Icon(Icons.search), Icon(Icons.book), Icon(Icons.supervised_user_circle)];
  var _tabs = [
    HomeIndexPage(),
    SocietyPage(),
    SearchPage(),
    BookPage(),
    MePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabIndex = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xfff6f6f6)),
          child: _tabs[_tabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: _bottomTabs
            .asMap().keys.map((t) =>
                BottomNavigationBarItem(icon: _bottomIcons[t], title: Text(_bottomTabs[t])))
            .toList(),
        onTap: (int index) {
          print(index);
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      floatingActionButton: _renderButton(),
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

  _renderButton() {
    if(_tabIndex == 0) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sayHello();
        },
      );
    }

    if(_tabIndex == 1) {
      return FloatingActionButton(
        child: Icon(Icons.people),
        onPressed: () {
          sayHello();
        },
      );
    }

    return null;

  }

}
