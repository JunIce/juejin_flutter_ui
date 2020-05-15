import 'package:flutter/material.dart';
import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/util.dart';
import 'package:flutter_app/components/list_item_listtile.dart';
import 'package:flutter_app/pages/tag-manage/tag-manage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool show =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.primaryBgColor,
        appBar: AppBar(
          title: Container(
              color: Colors.blue[300],
              padding: EdgeInsets.all(10),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.white, size: 18,),
                    SizedBox(width: 10,),
                    Text(
                      '搜索文章、用户、标签',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              )),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551606381887&di=bbd9625453a6e0efa1b25a2e990862f0&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46b2ac46146063f6246b60af15.jpg'),
                      fit: BoxFit.fill)
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 14,bottom: 14),
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return TagManagePage();
                      })
                      );
                    },
                    child: Text('定制热门'),
                  )
                ],
              ),
            ),
            
            Divider(
              height: 0,
            ),
            ListItemListTile(
              title: Text("用得上听得懂抄得走的前端经用得上听得懂抄得走的前端经用得上听得懂抄得走的前端经jeklsfjkelfjekl")
            )
          ],
        )
    );
  }

  List<Widget> _renderPageMenu() {
    List<String> _menuNames = ['文章榜', '作者榜', '看一看', '话题广场', '活动'];
    List<Icon> _menuIcons = [
      Icon(
        Icons.hot_tub,
        color: Util.slRandomColor(),
        size: 18,
      ),
      Icon(
        Icons.favorite,
        color: Util.slRandomColor(),
        size: 18,
      ),
      Icon(
        Icons.local_activity,
        color: Util.slRandomColor(),
        size: 18,
      ),
      Icon(
        Icons.local_cafe,
        color: Util.slRandomColor(),
        size: 18,
      ),
      Icon(
        Icons.local_bar,
        color: Util.slRandomColor(),
        size: 18,
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
            Text(_menuNames[i], style: TextStyle(color: Color(0xff666666), fontSize: 14))
          ],
        )),
      );
    }

    return _menus;
  }
}
