import 'package:flutter/material.dart';
import 'package:juejin/common/colors.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/pages/user/personal.dart';

class IndexListItem extends StatelessWidget {
  final String username;
  final String category;
  final String title;
  final String content;
  final String titlePic;
  final String likeCount;
  final String commentCount;

  const IndexListItem(
      {Key? key,
      this.username = '',
      this.category = '',
      this.title = '',
      this.content = '',
      this.titlePic = '',
      this.likeCount = '',
      this.commentCount = ''})
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
              ),
              Row(
                children: [
                  Text(username),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 12, color: AppColor.textColor1),
                  ),
                  Text(
                    "4天前",
                    style: TextStyle(fontSize: 12, color: AppColor.textColor1),
                  )
                ],
              ),

              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
              ),
              // _itemCardHeader(context),
              // SizedBox(
              //   height: 12,
              // ),
              // _itemCardMain(),
              SizedBox(
                height: 12,
              ),
              _itemCardFooter()
            ],
          ),
        ));
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
