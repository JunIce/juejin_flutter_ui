import 'package:flutter/material.dart';
import 'package:juejin/pages/me-collection/index.dart';
import 'package:juejin/pages/me-do-like/index.dart';
import 'package:juejin/pages/me-read-articles/index.dart';
import 'package:juejin/pages/me-setting/index.dart';
import 'package:juejin/pages/me-setting/me-item.dart';
import 'package:juejin/pages/tag-manage/tag-manage.dart';
import 'package:juejin/pages/user/personal.dart';

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
      appBar: AppBar(
        title: Text("我"),
      ),
      backgroundColor: Color(0xfff4f4f4),
      body: ListView(
        children: [
          SizedBox(
            height: 16,
          ),
          _renderUserCard(),
          SizedBox(
            height: 16,
          ),
          renderCard([
            MeListItem(
              icon: Icons.ring_volume,
              title: "消息中心",
              onTap: () {},
            ),
            MeListItem(
              icon: Icons.favorite,
              title: "我赞过的",
              trailing: "16篇",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MeDoLikePage();
                }));
              },
            ),
            MeListItem(
              icon: Icons.star,
              iconColor: Colors.red,
              title: "收藏集",
              trailing: "4个",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CollectionPage();
                }));
              },
            ),
            MeListItem(
              icon: Icons.star,
              iconColor: Colors.red,
              title: "已购小册",
              trailing: "0本",
              onTap: () {},
            ),
            MeListItem(
              icon: Icons.remove_red_eye,
              iconColor: Colors.red,
              title: "阅读过的文章",
              trailing: "3000篇",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ReadArticles();
                }));
              },
            ),
            MeListItem(
              icon: Icons.filter_vintage,
              iconColor: Colors.red,
              title: "标签管理",
              trailing: "21个",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TagManagePage();
                }));
              },
            )
          ]),
          SizedBox(
            height: 16,
          ),
          renderCard([
            MeListItem(
              icon: Icons.wb_sunny,
              iconColor: Colors.grey,
              title: "夜间模式",
              trailing: Switch(
                  value: switchActive,
                  onChanged: (e) {
                    setState(() {
                      switchActive = e;
                    });
                  }),
              onTap: () {},
            ),
            MeListItem(
              icon: Icons.question_answer,
              iconColor: Colors.grey,
              title: "意见反馈",
              onTap: () {},
            ),
            MeListItem(
              icon: Icons.settings,
              iconColor: Colors.grey,
              title: "设置",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              },
            )
          ]),
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
      child: ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return UserPersonalPage();
            }));
          },
          contentPadding:
          EdgeInsets.all(10),
          leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://user-gold-cdn.xitu.io/2019/9/6/16d024e432ffb853?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1")),
          title: Text(
            "用户名",
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "前端",
            style: TextStyle(fontSize: 12, color: Color(0xff666666)),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Color(0xffcccccc),
            size: 32,
          )),
    );
  }
}


