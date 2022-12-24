import 'package:flutter/material.dart';
import 'package:juejin/common/config.dart';
import 'package:juejin/components/user-card-item.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class PageTopicList extends StatefulWidget {
  @override
  _PageTopicListState createState() => _PageTopicListState();
}

class _PageTopicListState extends State<PageTopicList>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Tab> tabList = [Tab(text: '发现'), Tab(text: '关注')];
  String avatar =
      "https://img0.baidu.com/it/u=1396456140,563000347&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1671814800&t=27b6c6275e8ceba219905d917cc116ac";
  var username = "JunIce";

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryBgColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              expandedHeight: 200,
              background: MutableBackground(
                expandedWidget: Image.asset(
                  'assets/images/bg.jpg',
                  fit: BoxFit.cover,
                ),
                collapsedColor: Colors.white,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
              children: [
                Container(
                  child: Text("container"),
                ),
                FlexibleTextItem(
                    text: 'Mountains',
                    collapsedStyle: TextStyle(color: Colors.black54),
                    expandedStyle: TextStyle(color: Colors.red),
                    expandedAlignment: Alignment.bottomLeft,
                    collapsedAlignment: Alignment.center,
                    expandedPadding: EdgeInsets.all(20)),
              ],
            ),
          ),
          ...renderList()
        ],
      ),
      floatingActionButton: renderFloatingBtn(),
    );
  }

  List<SliverToBoxAdapter> renderList() {
    return List.generate(20, (index) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: UserCardItem(
            avatar: avatar,
            username: "JunICE",
            title: "ddd",
            commentCount: "30",
            likeCount: "30",
            content: "ddd",
          ),
        ),
      );
    });
  }

  // 悬浮按钮
  Widget renderFloatingBtn() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 111, 187, 249),
              blurRadius: 5,
              spreadRadius: 0.0,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 80, 174, 252),
                Color.fromARGB(255, 32, 131, 212),
              ])),
      child: Icon(
        Icons.edit_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
