import 'package:flutter/material.dart';
import 'package:flutter_app/components/article-list-item.dart';

class ReadArticles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReadArticles();
  }
}

class _ReadArticles extends State<ReadArticles> {

  var title = "Dart 基本数据类型与类型归属判断 - 数据类型与类型归属判断 - Postbird - 猫既吾命";
  var itemInfo = "13人点赞 · Tecode · 1年前";
  var bgCover ="https://hbimg.huabanimg.com/6d2461abee99e6fcbbc287a2d7d2d61948fa113b21a96-gDKTFD_/fw/480/format/webp";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("阅读过的文章", style: TextStyle(fontSize: 18),),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ArticleListItem(
            title: title,
            extra: itemInfo,
            coverImage: bgCover,
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
      ),
    );
  }
}


