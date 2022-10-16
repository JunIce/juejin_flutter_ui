import 'package:flutter/material.dart';
import 'bottom-share-card.dart';
import 'icon-text.dart';

class HomeListItem3 extends StatelessWidget {
  final String avatar;
  final String username;
  final String title;
  final String content;
  final String likeCount;
  final List<String> images;
  final String commentCount;
  final Function()? onTap;
  final String extra;
  final String tag;

  const HomeListItem3(
      {Key? key,
      this.avatar = '',
      this.username = '',
      this.title = '',
      this.content = '',
      this.likeCount = '',
      this.commentCount = '',
      this.onTap,
      this.extra = '',
      required this.images,
      this.tag = ''})
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
                  "$extra",
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ],
            ),
          )),
          OutlinedButton.icon(
              onPressed: () {}, icon: Icon(Icons.add), label: Text("关注")),
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
    Widget _context = Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff666666),
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: images.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(images[index]), fit: BoxFit.cover)),
            );
          },
        ),
        tag != null ? Container(
          margin: EdgeInsets.only(top: 10),
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.greenAccent),
          ),
          child: Text(tag, style: TextStyle(fontSize: 12, color: Colors.greenAccent),),
        ): Container()
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
