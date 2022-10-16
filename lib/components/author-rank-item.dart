import 'package:flutter/material.dart';
import 'package:juejin/components/title-tag.dart';

class AuthorRankItem extends StatelessWidget {

  final String avatar;
  final String username;
  final String userSign;
  final String readCount;
  final String favorCount;
  final String level;
  final Function()? onTap;

  const AuthorRankItem({
    Key? key,
      this.avatar = "",
      this.username = "",
      this.userSign = "",
      this.readCount = "",
      this.favorCount = "",
      this.level = "",
    this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(avatar),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(40)
            ),
          ),
          SizedBox(width: 14,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(username),
                    SizedBox(width: 6,),
                    TitleTag(text: "Lv$level", color: Colors.green,)
                  ],
                ),
                SizedBox(height: 1,),
                Text(
                  userSign,
                  style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                SizedBox(height: 1,),
                Text(
                  "获得 $favorCount 赞 · $readCount 阅读",
                  style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,)
              ],
            ),
          ),

          OutlinedButton.icon(
              onPressed: onTap, icon: Icon(Icons.add), label: Text("关注"))
        ],
      ),
    );
  }
}