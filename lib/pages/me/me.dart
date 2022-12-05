import 'package:flutter/material.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/pages/me-collection/index.dart';
import 'package:juejin/pages/me-do-like/index.dart';
import 'package:juejin/pages/me-read-articles/index.dart';
import 'package:juejin/pages/me-setting/index.dart';
import 'package:juejin/pages/me-setting/me-item.dart';
import 'package:juejin/pages/me/components/writer-center.dart';
import 'package:juejin/pages/tag-manage/tag-manage.dart';
import 'package:juejin/pages/user/personal.dart';
import './components/more-func.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MePage();
  }
}

class _MePage extends State<MePage> {
  bool switchActive = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        Container(
          child: Icon(
            Icons.dark_mode_outlined,
            color: Colors.black54,
          ),
          margin: EdgeInsets.only(right: 15),
        ),
        Container(
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.black54,
          ),
          margin: EdgeInsets.only(right: 15),
        ),
        Container(
          child: GestureDetector(
            child: Icon(Icons.settings_outlined, color: Colors.black54),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
          ),
          margin: EdgeInsets.only(right: 15),
        ),
      ]),
      backgroundColor: Color(0xfff4f4f4),
      body: ListView(
        children: [
          // 用户顶部
          _renderUserCard(),
          // 用户数据
          _renderUserData(),
          // renderCard([
          //   MeListItem(
          //     icon: Icons.ring_volume,
          //     title: "消息中心",
          //     onTap: () {},
          //   ),
          //   MeListItem(
          //     icon: Icons.favorite,
          //     title: "我赞过的",
          //     trailing: "16篇",
          //     onTap: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) {
          //         return MeDoLikePage();
          //       }));
          //     },
          //   ),
          //   MeListItem(
          //     icon: Icons.star,
          //     iconColor: Colors.red,
          //     title: "收藏集",
          //     trailing: "4个",
          //     onTap: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) {
          //         return CollectionPage();
          //       }));
          //     },
          //   ),
          //   MeListItem(
          //     icon: Icons.star,
          //     iconColor: Colors.red,
          //     title: "已购小册",
          //     trailing: "0本",
          //     onTap: () {},
          //   ),
          //   MeListItem(
          //     icon: Icons.remove_red_eye,
          //     iconColor: Colors.red,
          //     title: "阅读过的文章",
          //     trailing: "3000篇",
          //     onTap: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) {
          //         return ReadArticles();
          //       }));
          //     },
          //   ),
          //   MeListItem(
          //     icon: Icons.filter_vintage,
          //     iconColor: Colors.red,
          //     title: "标签管理",
          //     trailing: "21个",
          //     onTap: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) {
          //         return TagManagePage();
          //       }));
          //     },
          //   )
          // ]),
          SizedBox(
            height: 16,
          ),

          WriterCenter(),
          SizedBox(
            height: 16,
          ),
          MoreFuncComp(),
        ],
      ),
    );
  }

  Widget renderCard(List widgets) {
    List<Widget> list = [];

    for (int i = 0; i < widgets.length; i++) {
      list
        ..add(widgets[i])
        ..add(Divider(
          height: 1,
        ));
    }
    list.removeLast();

    return Container(
        color: Colors.white,
        child: Column(
          children: list.toList(),
        ));
  }

  Widget _renderUserCard() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://p3-passport.byteimg.com/img/user-avatar/d03eba5a4204acffb8008a49c4c272ea~180x180.awebp"))),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "JunIce",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w600),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "个人中心",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff555555)),
                            ),
                            Icon(Icons.chevron_right_rounded,
                                size: 20, color: Color(0xff555555))
                          ],
                        )
                      ],
                    )
                  ],
                )))
      ]),
    );
  }

  Widget _renderUserData() {
    List<Widget> _list = [];

    // for (int i = 0; i < 3; i++) {
    _list
      ..add(Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text(
              "45",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            "点赞",
            style: TextStyle(fontSize: 12, color: Color(0xff555555)),
          )
        ],
      ))
      ..add(Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text(
              "34",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            "收藏",
            style: TextStyle(fontSize: 12, color: Color(0xff555555)),
          )
        ],
      ))
      ..add(Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text(
              "56",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            "关注",
            style: TextStyle(fontSize: 12, color: Color(0xff555555)),
          )
        ],
      ));
    // }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _list,
      ),
    );
  }
}
