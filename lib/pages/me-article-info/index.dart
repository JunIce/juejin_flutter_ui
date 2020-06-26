import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon-text.dart';

class MeArticleInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeArticleInfo();
  }
}


class _MeArticleInfo extends State<MeArticleInfo> {
  String avatar = "https://img2.woyaogexing.com/2020/06/26/6972cf4ab1ea4695949fd08b6642c706!400x400.jpeg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("文章数据", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: NetworkImage(avatar))
              ),
            ),
            SizedBox(height: 20,),
            Text("JunIce", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Text("分享 100 篇", style: TextStyle(fontSize: 14),),
            SizedBox(height: 40,),
            Text("3287", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            SizedBox(
              width: 120,
              child:IconText(
                text: "获得点赞数",
                textSize: 18,
                icon: Icons.favorite,
                iconSize: 18,
              ) ,
            ),
            SizedBox(height: 40,),
            Text("5332", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            SizedBox(
              width: 120,
              child: IconText(
                text: "获得阅读数",
                textSize: 18,
                icon: Icons.remove_red_eye,
                iconSize: 18,
              ),
            ),
            SizedBox(height: 40,),
            Text("4323", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            SizedBox(
              width: 120,
              child: IconText(
                text: "获得评论数",
                textSize: 18,
                icon: Icons.comment,
                iconSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}