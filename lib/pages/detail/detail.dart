import 'package:flutter/material.dart';
import 'package:juejin/icons/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebviewDetailPage();
  }
}

class _WebviewDetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Container(
        child: WebView(
          initialUrl: 'https://juejin.cn/post/7168406888441184293',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      bottomNavigationBar: renderBottonBar(),
    );
  }

  // 顶部状态栏
  PreferredSizeWidget renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        "文章详情页",
        style: TextStyle(color: Color(0xff333333), fontSize: 18),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_horiz_outlined),
          iconSize: 22,
          onPressed: () {},
        )
      ],
    );
  }

  // 底部操作栏
  Widget renderBottonBar() {
    return Container(
      height: 80,
      padding: EdgeInsets.only(top: 8, bottom: 30, left: 12, right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1, color: Color(0xfff4f4f4)))),
      child: Row(
        children: [
          Expanded(
            child: Container(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xfff1f1f1),
                        border: Border.all(width: 1, color: Color(0xffddddd)),
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: Text(
                      "写评论...",
                      style: TextStyle(color: Color(0xff666666)),
                    ))),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.comment_outlined,
                  color: Color(0xff999999),
                ),
                // Text("43")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 4),
            child: Row(
              children: [
                Icon(
                  IconFontIcons.iconZan,
                  // color: Color(0xff999999),
                ),
                // Text("43")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 4),
            child: Row(
              children: [
                Icon(Icons.star_border_outlined
                    // color: Color(0xff999999),
                    ),
                // Text("43")
              ],
            ),
          )
        ],
      ),
    );
  }
}
