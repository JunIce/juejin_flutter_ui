import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
                height: 45,
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 20,
                  width: double.infinity,
                  // color: Colors.red,
                  color: Color(0xff3399fe),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                      Text(
                        '搜索',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                )),
            Container(
              height: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551606381887&di=bbd9625453a6e0efa1b25a2e990862f0&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46b2ac46146063f6246b60af15.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _renderPageMenu().toList()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(14),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '热门文章',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text('热门定制')
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
          ],
        )));
  }

  List<Widget> _renderPageMenu() {
    List<String> _menuNames = ['本周最热', '收藏集', '活动'];
    List<Icon> _menuIcons = [
      Icon(
        Icons.hot_tub,
        color: Colors.black,
      ),
      Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      Icon(
        Icons.local_activity,
        color: Colors.black,
      )
    ];

    List<Widget> _menus = [];

    for (var i = 0; i < _menuNames.length; i++) {
      _menus.add(
        Expanded(
            child: Column(
          children: <Widget>[
            _menuIcons[i],
            SizedBox(
              height: 4,
            ),
            Text(_menuNames[i], style: TextStyle(color: Colors.black))
          ],
        )),
      );
    }

    return _menus;
  }
}
