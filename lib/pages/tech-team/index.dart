import 'package:flutter/material.dart';
import 'package:juejin/components/home_list_view.dart';

class PageTechTeam extends StatefulWidget {
  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<PageTechTeam>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("技术团队"),
        centerTitle: false,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return renderRowItem();
          }),
    );
  }

  Widget renderRowItem() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/72f22bf9292e42cfad633b6ad8a3c65a~tplv-k3u1fbpfcp-no-mark:200:200:200:200.awebp?"))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "掘金翻译计划",
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "一个帮助开发者成长的社区",
                      style: TextStyle(color: Color(0xff666666), fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          CircleTag(
            text: "关注",
            checked: false,
            icon: Icon(
              Icons.add,
              size: 14,
            ),
            checkedTextColor: Color.fromRGBO(28, 127, 251, 1),
            checkedBgColor: Color.fromRGBO(233, 243, 255, 1),
            onTap: () {
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
