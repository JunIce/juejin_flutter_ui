import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon-text.dart';
import 'package:flutter_app/pages/user/personal.dart';

class HomeListItem1 extends StatelessWidget {
  final String avatar;
  final String username;
  final String category;
  final String title;
  final String content;
  final String titlePic;
  final String likeCount;
  final String commentCount;

  const HomeListItem1(
      {Key key,
      this.avatar,
      this.username,
      this.category,
      this.title,
      this.content,
      this.titlePic,
      this.likeCount,
      this.commentCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _itemCardHeader(context),
              SizedBox(
                height: 12,
              ),
              _itemCardMain(),
              SizedBox(
                height: 12,
              ),
              _itemCardFooter()
            ],
          ),
        ));
  }

  Widget _itemCardHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserPersonalPage();
            }));
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(avatar))),
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(username,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(color: Color(0xff333333), fontSize: 14)),
        )),
        Text(
          category,
          style: TextStyle(color: Color(0xffcccccc), fontSize: 12),
        )
      ],
    );
  }

  Widget _itemCardMain() {
    Widget _titlePic = Container();
    if(titlePic != null) {
      _titlePic = Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(titlePic))),
      );
    }

    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Color(0xff666666)),
              softWrap: true,
              textDirection: TextDirection.ltr,
            )
          ],
        ))),
        _titlePic
      ],
    );
  }

  Widget _itemCardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconText(
          icon: Icons.favorite_border,
          text: likeCount,
        ),
        SizedBox(
          width: 20,
        ),
        IconText(
          icon: Icons.insert_comment,
          text: commentCount,
        )
      ],
    );
  }
}
