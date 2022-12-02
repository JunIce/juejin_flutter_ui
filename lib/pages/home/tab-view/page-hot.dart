import 'package:flutter/material.dart';
import 'package:juejin/components/home_list_view.dart';
import 'package:juejin/components/item_panel.dart';
import 'package:juejin/icons/index.dart';
import 'package:juejin/pages/detail/detail.dart';
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
          slivers: <Widget>[
            // 首行tab
            _firstItem(),
            // 列表标题
            _renderListHeader(),
            // 主列表
            _renderList()
          ],
        ))
      ],
    );
  }

  Widget _renderList() {
    return SliverFixedExtentList(
      itemExtent: 70.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _renderListItem((index + 1).toString());
        },
      ),
    );
  }

  Widget _renderListHeader() {
    return SliverToBoxAdapter(
        child: Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "热门文章榜",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _renderHeaderTag("收藏榜"),
              SizedBox(
                width: 10,
              ),
              _renderHeaderTag("作者榜")
            ],
          )
        ],
      ),
    ));
  }

  Widget _renderHeaderTag(String name) {
    Color textColor = Color.fromRGBO(28, 127, 251, 1);
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
            color: Color.fromRGBO(233, 243, 255, 1),
            child: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(color: textColor),
                ),
                Icon(
                  Icons.arrow_right_sharp,
                  color: textColor,
                  size: 16,
                )
              ],
            )));
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
                          checkedTextColor: Color.fromRGBO(28, 127, 251, 1),
                          checkedBgColor: Color.fromRGBO(233, 243, 255, 1),
                          onTap: () {
                            setState(() {
                              _checkedTag = item.key;
                            });
                          },
                        ),
                      )),
                ]),
          )),
    );
  }

  Widget _renderListItem(String index) {
    Color textBg = Colors.white;
    switch (index) {
      case "1":
        textBg = Color.fromRGBO(254, 76, 64, 1);
        break;
      case "2":
        textBg = Color.fromRGBO(251, 134, 62, 1);
        break;
      case "3":
        textBg = Color.fromRGBO(252, 199, 5, 1);
        break;
      default:
    }

    Color tipTxtColor = Color.fromRGBO(143, 148, 155, 1);

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailPage();
          }));
        },
        child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: textBg,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                index,
                style: TextStyle(
                    fontSize: 16,
                    color: int.parse(index) < 4
                        ? Colors.white
                        : Color.fromRGBO(138, 142, 156, 1)),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vue3如何实现一个全局搜索框",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "前端要努力",
                      style: TextStyle(color: tipTxtColor),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "热度",
                          style: TextStyle(color: tipTxtColor),
                        ),
                        Text(
                          "3278",
                          style: TextStyle(color: tipTxtColor),
                        ),
                        Icon(
                          IconFontIcons.iconTabHot,
                          size: 16,
                          color: tipTxtColor,
                        )
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
            )));
    
  }
}

class TagHead {
  final String label;
  final String key;
  TagHead({required this.label, required this.key});
}
