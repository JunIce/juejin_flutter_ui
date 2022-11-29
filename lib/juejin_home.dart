import 'package:flutter/material.dart';
import 'package:juejin/icons/index.dart';
import 'package:juejin/pages/book/book.dart';
import 'package:juejin/pages/me/me.dart';
import 'package:juejin/pages/nest-scroll-view.dart';
import 'package:juejin/pages/user/personal.dart';
import 'pages/home/index.dart';
import 'pages/society_page.dart';
import 'pages/hot/hot.dart';

class JueJinHome extends StatefulWidget {
  @override
  _JueJinHome createState() => _JueJinHome();
}

class TabItem {
  const TabItem({required this.icon, this.name, this.label, this.activeIcon});
  final String? name;
  final Icon icon;
  final Icon? activeIcon;
  final String? label;
}

class _JueJinHome extends State<JueJinHome> {
  late int _tabIndex;

  List<TabItem> _bottomTabs = [
    TabItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      name: "home",
      label: "首页",
    ),
    TabItem(
      icon: Icon(IconFontIcons.iconTabHot),
      activeIcon: Icon(IconFontIcons.iconTabHotActive),
      name: "home",
      label: "沸点",
    ),
    TabItem(
      icon: Icon(IconFontIcons.iconTabCompass),
      activeIcon: Icon(IconFontIcons.iconTabCompassActive),
      name: "home",
      label: "发现",
    ),
    TabItem(
      icon: Icon(IconFontIcons.iconTabBook),
      activeIcon: Icon(IconFontIcons.iconTabBookActive),
      name: "home",
      label: "课程",
    ),
    TabItem(
      icon: Icon(Icons.supervised_user_circle),
      activeIcon: Icon(Icons.supervised_user_circle),
      name: "home",
      label: "我",
    ),
  ];

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
    _tabIndex = 0;
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
            .map((t) => BottomNavigationBarItem(
                icon: t.icon, label: t.label, activeIcon: t.activeIcon))
            .toList(),
        onTap: (int index) {
          print(index);
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      // floatingActionButton: _renderButton(),
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
            TextButton(
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
    if (_tabIndex == 0) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PullToRefreshDemo();
          }));
        },
      );
    }

    if (_tabIndex == 1) {
      return FloatingActionButton(
        child: Icon(Icons.people),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return UserPersonalPage();
          }));
        },
      );
    }

    return null;
  }
}
