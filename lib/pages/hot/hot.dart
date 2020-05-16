import 'dart:async';
import 'dart:core';

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
  List _datalist = [];

  List _menus = [
    {
      "label": Text("文章榜"),
      "icon": Icon(
        Icons.hot_tub,
        color: Util.slRandomColor(),
        size: 18,
      ),
    },
    {
      "label": Text("作者榜"),
      "icon": Icon(
        Icons.favorite,
        color: Util.slRandomColor(),
        size: 18,
      ),
    },
    {
      "label": Text("看一看"),
      "icon": Icon(
        Icons.local_activity,
        color: Util.slRandomColor(),
        size: 18,
      ),
    },
    {
      "label": Text("话题广场"),
      "icon": Icon(
        Icons.local_cafe,
        color: Util.slRandomColor(),
        size: 18,
      ),
    },
    {
      "label": Text("活动"),
      "icon": Icon(
        Icons.local_bar,
        color: Util.slRandomColor(),
        size: 18,
      )
    }
  ];

  // 下拉刷新
  bool _hideloading = true;
  //上拉加载
  bool _showMore = false;

  ScrollController _scrollController = new ScrollController();
  bool isRequest = false;
  int num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMoreData();

    _scrollController.addListener(()async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          _showMore = true;
        });
        await _getMoreData();
      }
    });

  }


  _getMoreData() async {
    if (_hideloading) {
      num++;
      print("fetching...");
      setState(() => _hideloading = false);
      Timer(Duration(seconds: 3), (){
        var newList = List.generate(10, (index) => index);
        setState(() {
          print("请求:$num");
          _datalist.addAll(newList);
          _hideloading = true;
          _showMore = false;
        });
      });
    }
  }


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
        body: RefreshIndicator(
            child: CustomScrollView(
              controller: _scrollController,
            slivers: _renderFirstChild(),
          ),
            onRefresh: _refresh
        )

    );
  }

  Future<Null> _refresh() async {
    _datalist.clear();
    print("refresh: "+ 111.toString());
    await _getMoreData();
    return;
  }


  List<Widget> _renderFirstChild () {

    List<Widget> list = List();

    // Loading
    list.add(
      SliverOffstage(
          offstage: _hideloading,
        sliver: SliverToBoxAdapter(
          child: Container(
            height: 100,
            child: Center(
              child: Text("正在加载数据，请稍后..."),
            ),
          ),
        ),
      )
    );

    // Banner
    list.add(
      SliverToBoxAdapter(
        child:
        Container(
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551606381887&di=bbd9625453a6e0efa1b25a2e990862f0&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46b2ac46146063f6246b60af15.jpg'),
                  fit: BoxFit.fill)
          ),
        ),
      )
    );

    // GridView
    list.add(
      SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Container(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          _menus[index]["icon"],
                          SizedBox(
                            height: 4,
                          ),
                          _menus[index]["label"]
//                          Text(, style: TextStyle(color: Color(0xff666666), fontSize: 14))
                        ],
                      )
                  );
                },
              childCount: _menus.length
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _menus.length,
            mainAxisSpacing: 10
          )
      )
    );

    // Divider
    list.add(SliverToBoxAdapter(child: Container(height: 10,),));

    // title
    list.add(
      SliverToBoxAdapter(
        child: Container(
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
      )
    );

    // mainlist
    list.add(
      SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return ListItemListTile(title: Text("sjfelkejlkfjeljf"));
          },
            childCount: _datalist.length
          )
      )
    );

    // Loading
    list.add(
        SliverToBoxAdapter(
          child: Visibility(
              visible: _showMore,
              child: Container(
                height: 100,
                child: Center(
                  child: Text("正在加载数据，请稍后..."),
                ),
              ),
          ),
        )
    );

    return list;
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child:  Center(
        child:  Opacity(
          opacity: isRequest ? 1.0 : 0.0,
          child:  CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
