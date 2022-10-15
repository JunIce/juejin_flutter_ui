import 'package:flutter/material.dart';
import 'package:juejin/components/title-tag.dart';
import 'bottom-share-card.dart';
import 'icon-text.dart';

class HomeListItem2 extends StatelessWidget {
  final String avatar;
  final String username;
  final String newstime;
  final String readCount;
  final String title;
  final String content;
  final String titlePic;
  final String likeCount;
  final String commentCount;
  final bool isSpecial;
  final Function onTap;

  const HomeListItem2(
      {Key key,
      this.avatar,
      this.username,
      this.newstime,
      this.readCount,
      this.title,
      this.content,
      this.titlePic,
      this.likeCount,
      this.commentCount,
      this.isSpecial = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [_renderCardItem(context)],
      ),
    );
  }

  Widget _renderCardItem(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
            child: Column(
              children: [
                _renderTitle(context),
                SizedBox(
                  height: 16,
                ),
                _renderItemBody()
              ],
            ),
          ),
          _renderItemFooter()
        ],
      ),
    );
  }

  // 顶部用户信息部分
  Widget _renderTitle(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(avatar))),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: TextStyle(fontSize: 14, color: Color(0xff333333))),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "$newstime 阅读$readCount",
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ],
            ),
          )),
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Color(0xff999999),
            iconSize: 18,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomShareCard();
                  });
            },
          )
        ]);
  }

  // 内容主体
  Widget _renderItemBody() {
    Widget _tag = isSpecial
        ? Container(
            child: TitleTag(text: "专栏"),
          )
        : Container();

    Widget _context = null;
    if (titlePic != null) {
      _context = Row(
        children: [
          Expanded(
              child: Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(color: Color(0xff666666), height: 1.5),
          )),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(image: NetworkImage(titlePic))),
          )
        ],
      );
    } else {
      _context = Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(color: Color(0xff666666)),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            _tag,
            Expanded(
                child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        _context
      ],
    );
  }

  // 内容页脚
  Widget _renderItemFooter() {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Color(0xffeeeeee)))),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconText(
            icon: Icons.chat_bubble_outline,
            text: likeCount.toString(),
          ),
          IconText(
            icon: Icons.chat_bubble_outline,
            text: commentCount.toString(),
          ),
          IconText(
            icon: Icons.share,
            text: "分享",
          )
        ],
      ),
    );
  }
}


