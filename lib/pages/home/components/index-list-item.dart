import 'package:flutter/material.dart';
import 'package:juejin/common/colors.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/icons/index.dart';
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
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(username),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 12, color: AppColor.textColor1),
                              ),
                            ),
                            Text(
                              "4天前",
                              style: TextStyle(
                                  fontSize: 12, color: AppColor.textColor1),
                            )
                          ],
                        ),
                      ),
                      Text(
                        content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  )),

                  // 右侧图片
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Image(
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://p.qqan.com/up/2022-11/20221123943583740.jpg'))),
                ],
              ),
              _itemCardFooter()
            ],
          ),
        ));
  }

  Widget _itemCardFooter() {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 点赞
            Icon(IconFontIcons.iconZan, color: AppColor.textColor1, size: 18),
            Text(
              "12345",
              textAlign: TextAlign.justify,
              style: TextStyle(color: AppColor.textColor1, fontSize: 14),
            ),

            SizedBox(
              width: 10,
            ),
            // 评论
            Icon(IconFontIcons.iconComment,
                color: AppColor.textColor1, size: 18),
            Text(
              "12345",
              style: TextStyle(color: AppColor.textColor1, fontSize: 14),
            ),
          ],
        ));
  }
}
