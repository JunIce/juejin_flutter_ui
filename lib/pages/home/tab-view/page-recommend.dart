import 'package:flutter/material.dart';
import 'package:juejin/components/item_panel.dart';
import 'package:juejin/pages/home/components/index-list-item.dart';

class IndexPageRecommend extends StatelessWidget {
  Widget build(BuildContext context) => _HomeRecommendPages();
}

class _HomeRecommendPages extends StatefulWidget {
  @override
  _HomeRecommendPage createState() => _HomeRecommendPage();
}

class _HomeRecommendPage extends State<_HomeRecommendPages> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => Container(
          child: IndexListItem(
        title: "如何使用CSS创建高级动画，这个函数必须掌握",
        content:
            "因此如果我们要将相机实时流 CameraImage 转为yuv 或 rgba 后给opencv 或 tflite 来做后续动作，那么建议使用 ffi / method channel将数据传给 c++ 层 opencv 的 cvtColor 来转换，效率高很多！当然如果对实时流的效率要求没那么高，imageLib.Image 也是完全足以的",
        username: "摹刻",
        category: "前端",
        likeCount: "10002",
        commentCount: "237",
      )),
    );
  }
}
