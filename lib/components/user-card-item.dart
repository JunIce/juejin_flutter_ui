import 'package:flutter/material.dart';
import 'bottom-share-card.dart';
import 'icon-text.dart';

class UserCardItem extends StatelessWidget {
  final String avatar;
  final String username;
  final String title;
  final String content;
  final String likeCount;
  final List<String>? images;
  final String commentCount;
  final Function()? onTap;
  final String extra;
  final String tag;

  const UserCardItem(
      {Key? key,
      this.avatar = '',
      this.username = '',
      this.title = '',
      this.content = '',
      this.likeCount = '',
      this.commentCount = '',
      this.onTap,
      this.extra = '',
      this.images,
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
                // border: Border.all(width: 1, color: Colors.grey),
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
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w600)),
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
          // OutlinedButton.icon(
          //     onPressed: () {}, icon: Icon(Icons.add), label: Text("关注")),
          IconButton(
            icon: Icon(
              Icons.more_vert_sharp,
              size: 20,
              color: Color(0xff999999),
            ),
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
            color: Color(0xff444444),
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (images != null)
          GridView.builder(
            itemCount: images?.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(images![index]),
                        fit: BoxFit.cover)),
              );
            },
          ),
        _renderLike()
      ],
    );
  }

  Widget _renderLike() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "等人赞过",
            style: TextStyle(fontSize: 12, color: Color(0xff888888)),
          )
        ],
      ),
    );
  }

  // 内容页脚
  Widget _renderItemFooter() {
    return Container(
      decoration: BoxDecoration(
          // border: Border(top: BorderSide(width: 1, color: Color(0xffeeeeee)))
          ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconText(
            icon: Icons.ios_share_outlined,
            iconSize: 16,
            textSize: 14,
            text: "分享",
          ),
          IconText(
            icon: Icons.comment_bank_outlined,
            iconSize: 16,
            textSize: 14,
            text: int.parse(commentCount) > 0 ? commentCount.toString() : "评论",
          ),
          IconText(
            icon: Icons.thumb_up_alt_outlined,
            iconSize: 16,
            textSize: 14,
            text: int.parse(likeCount) > 0 ? likeCount.toString() : "点赞",
          )
        ],
      ),
    );
  }
}
