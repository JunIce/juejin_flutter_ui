import 'package:flutter/material.dart';
import 'package:juejin/api/home.dart';
import 'package:juejin/models/follow-item.dart';
import 'package:juejin/pages/home/components/index-list-item.dart';

class IndexPageFollow extends StatelessWidget {
  Widget build(BuildContext context) => _HomeFollowPages();
}

class _HomeFollowPages extends StatefulWidget {
  @override
  _HomeFollowPage createState() => _HomeFollowPage();
}

class _HomeFollowPage extends State<_HomeFollowPages> {

  final HomeRequest req = HomeRequest();

  List<FollowItem> list = [];

  @override
  void initState() {
    super.initState();
    req.getFollowList().then((value) => {
          list = List<FollowItem>.from(
              value['data'].map((x) => FollowItem.fromJson(x)))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
          itemCount: list.length + 1,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            if (index == 0) return _firstItem();

            return _otherItem(list[index - 1]);
          },
        ))
      ],
    );
  }

  Widget _firstItem() {
    double avatarSize = 24;
    return Container(
        height: 56,
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("发现更多优秀创作者"),
              Container(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(avatarSize)),
                        child: Container(
                          width: avatarSize,
                          height: avatarSize,
                          color: Colors.amberAccent,
                        )),
                    ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(avatarSize)),
                        child: Container(
                          width: avatarSize,
                          height: avatarSize,
                          color: Colors.amberAccent,
                        )),
                    ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(avatarSize)),
                        child: Container(
                          width: avatarSize,
                          height: avatarSize,
                          color: Colors.amberAccent,
                        )),
                    ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(avatarSize)),
                        child: Container(
                          width: avatarSize,
                          height: avatarSize,
                          color: Colors.amberAccent,
                        )),
                    Icon(Icons.arrow_right_outlined)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _otherItem(FollowItem item) {
    return Container(
        child: IndexListItem(
      title: item.title,
      content: item.content,
      username: item.username,
      category: item.category,
      likeCount: item.likeCount.toString(),
      commentCount: item.commentsCount.toString(),
    ));
  }
}
