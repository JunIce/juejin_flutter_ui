import 'package:flutter/material.dart';
import 'package:juejin/components/home_list_view.dart';
import 'package:juejin/components/item_panel.dart';
import 'package:juejin/pages/home/components/index-list-item.dart';

class IndexPageHot extends StatelessWidget {
  Widget build(BuildContext context) => _HomeFollowPages();
}

class _HomeFollowPages extends StatefulWidget {
  @override
  _HomeFollowPage createState() => _HomeFollowPage();
}

class _HomeFollowPage extends State<_HomeFollowPages> {
  String _checkedTag = "front";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: CustomScrollView(
          // scrollDirection: ,
          slivers: <Widget>[_firstItem()],
          // itemCount: 10,
          // itemBuilder: (context, index) {
          //   if (index == 0) return _firstItem();

          //   return _otherItem();
          // },
        ))
      ],
    );
  }

  Widget _firstItem() {
    double avatarSize = 24;
    List<TagHead> tags = [
      TagHead(label: "前端", key: "front"),
      TagHead(label: "后端", key: "backend"),
      TagHead(label: "iOS", key: "ios"),
      TagHead(label: "Android", key: "android"),
      TagHead(label: "人工智能", key: "front111"),
    ];

    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...tags.map((item) => Container(
                        margin: EdgeInsets.only(left: 10),
                        child: CircleTag(
                          text: item.label,
                          checked: _checkedTag == item.key,
                          onTap: () {
                            setState(() {
                              _checkedTag = item.key;
                            });
                          },
                        ),
                      ))
                ]),
          )),
    );
  }

  Widget _otherItem() {
    return Container(
        child: IndexListItem(
      title: "如何使用CSS创建高级动画，这个函数必须掌握",
      content:
          "因此如果我们要将相机实时流 CameraImage 转为yuv 或 rgba 后给opencv 或 tflite 来做后续动作，那么建议使用 ffi / method channel将数据传给 c++ 层 opencv 的 cvtColor 来转换，效率高很多！当然如果对实时流的效率要求没那么高，imageLib.Image 也是完全足以的",
      username: "摹刻",
      category: "前端",
      likeCount: "10002",
      commentCount: "237",
    ));
  }
}

class TagHead {
  final String label;
  final String key;
  TagHead({required this.label, required this.key});
}
