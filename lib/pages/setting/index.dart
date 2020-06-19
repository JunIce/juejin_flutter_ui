import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingPage();
  }
}

class _SettingPage extends State<SettingPage> {
  bool _bindSina = false;
  bool _bindWechat = true;
  bool _bindGithub = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("设置"),
        ),
        backgroundColor: Color(0xfff4f4f4),
        body: renderBody());
  }

  Widget renderBody() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        renderCard([
          renderItem("邮箱",
              child: Text(
                "未设置",
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              )),
          renderItem("手机号",
              child: Text(
                "14478377437",
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              )),
          renderItem("修改账户密码")
        ]),
        SizedBox(
          height: 10,
        ),
        renderCard([
          renderItem("绑定新浪微博",
              child: Switch(
                value: _bindSina,
                onChanged: (bool change) {
                  setState(() {
                    _bindSina = change;
                  });
                },
              )),
          renderItem("绑定微信",
              child: Row(
                children: [
                  Text("Nov.1",
                      style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                  Switch(
                    value: _bindWechat,
                    onChanged: (bool change) {
                      setState(() {
                        _bindWechat = change;
                      });
                    },
                  )
                ],
              )),
          renderItem("绑定Github",
              child: Row(
                children: [
                  Text("JunIce",
                      style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                  Switch(
                    value: _bindGithub,
                    onChanged: (bool change) {
                      setState(() {
                        _bindGithub = change;
                      });
                    },
                  )
                ],
              ))
        ]),
        SizedBox(
          height: 10,
        ),
        renderCard([
          renderItem("清除缓存",
              child: Text(
                "4.10 KB",
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              )),
          renderItem("推送消息设置"),
          renderItem("移动网络下首页不显示图片",
              child: Row(
                children: [
                  Switch(
                    value: _bindGithub,
                    onChanged: (bool change) {
                      setState(() {
                        _bindGithub = change;
                      });
                    },
                  )
                ],
              )),
          renderItem("自动检查粘贴板快速分享",
              child: Row(
                children: [
                  Switch(
                    value: _bindGithub,
                    onChanged: (bool change) {
                      setState(() {
                        _bindGithub = change;
                      });
                    },
                  )
                ],
              ))
        ]),
        SizedBox(
          height: 10,
        ),
        renderCard([renderItem("关于")]),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 55,
          color: Colors.white,
          width: double.maxFinite,
          child: Center(child: Text("退出登录", style: TextStyle(color: Colors.red, fontSize: 16),),),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text("掘金5.9.3 juejin.im", style: TextStyle(color: Color(0xff999999), fontSize: 14))
          ),
        )
      ],
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

    return Container(
        color: Colors.white,
        child: Column(
          children: list.toList(),
        ));
  }

  Widget renderItem(String title, {Widget child}) {
    List<Widget> list = [
      Text(
        title,
        style: TextStyle(fontSize: 16, color: Color(0xff333333)),
      )
    ];

    if (child != null) {
      list.add(child);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list.toList(),
      ),
    );
  }
}
