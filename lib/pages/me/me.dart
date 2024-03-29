import 'package:flutter/material.dart';
import 'package:juejin/pages/me-setting/index.dart';
import 'package:juejin/pages/me/components/writer-center.dart';
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

          _renderVipContainer(),
          
          // 用户操作栏
          _renderActionCard(),
          
          Container(margin: EdgeInsets.only(top: 10), child: WriterCenter()
          ),
          Container(margin: EdgeInsets.only(top: 10), child: MoreFuncComp()
          ),
        ],
      ),
    );
  }

  Widget _renderVipContainer() {
    Color text_color = Color.fromARGB(255, 244, 205, 137);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Color.fromRGBO(52, 55, 90, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "会员有效期至 2023-07-19",
            style: TextStyle(color: text_color, fontSize: 12),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: text_color),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "会员中心",
              style: TextStyle(color: text_color, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  // 用户操作栏
  Widget _renderActionCard() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 70,
        child:
            GridView.count(crossAxisCount: 4, mainAxisSpacing: 20, children: [
          Column(
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
          ),
          Column(
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
          ),
          Column(
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
          ),
          Column(
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
          )
        ]));
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
