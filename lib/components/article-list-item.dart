import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  final String title;
  final String extra;
  final String coverImage;
  final Function()? onTap;

  const ArticleListItem(
      {Key? key,
      this.title = "",
      this.extra = "",
      this.coverImage = "",
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget child;

    Widget itemMain = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 16, height: 1.4)),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child:
                Text(extra, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ]);

    if (coverImage != null) {
      child = Row(
        children: [
          Expanded(child: itemMain),
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(coverImage), fit: BoxFit.cover),
            ),
          )
        ],
      );
    } else {
      child = itemMain;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: child,
      ),
    );
  }
}
