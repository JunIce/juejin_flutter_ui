import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:juejin/icons/index.dart';

class ShareMenu {
  final String name;
  final Icon icon;

  ShareMenu(
    this.name,
    this.icon,
  );
}

/**
 * 底部分享
 */
class BottomShareCard extends StatelessWidget {
  List<ShareMenu> menus = [
    ShareMenu(
        "卡片分享",
        Icon(
          IconFontIcons.iconShareCard,
          size: 34,
        )),
    ShareMenu(
        "微信",
        Icon(
          IconFontIcons.iconShareWechat,
          size: 30,
        )),
    ShareMenu(
        "朋友圈",
        Icon(
          IconFontIcons.iconShareFriendQuan,
          size: 30,
        )),
    ShareMenu(
        "QQ",
        Icon(
          IconFontIcons.iconShareQQ,
          size: 30,
        )),
    ShareMenu(
        "微博",
        Icon(
          IconFontIcons.iconShareWeibo,
          size: 36,
        )),
    ShareMenu("屏蔽", Icon(IconFontIcons.iconShareBlock)),
    ShareMenu("举报", Icon(IconFontIcons.iconShareReport)),
    ShareMenu("复制链接", Icon(IconFontIcons.iconShareCopy)),
    ShareMenu("浏览器打开", Icon(IconFontIcons.iconShareBrowser)),
    ShareMenu("更多", Icon(IconFontIcons.iconShareMore)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Color(0xfff3f3f3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            // color: Colors.white,
            child: GridView.builder(
                itemCount: menus.length,
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  return _buildCardItem(index);
                }),
          ),
          Container(
              color: Colors.white,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "取消",
                    style: TextStyle(color: Color(0xff888888), fontSize: 14),
                  ))),
        ],
      ),
    );
  }

  Widget _buildCardItem(int i) {
    ShareMenu menu = menus[i];

    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
          msg: "点击的按钮是：${menu.name}",
          gravity: ToastGravity.CENTER,
          fontSize: 14.0,
        );
      },
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.white,
            child: menu.icon,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(menu.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff999999), fontSize: 10))
      ]),
    );
  }
}
