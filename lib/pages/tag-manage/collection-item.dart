import 'package:flutter/material.dart';


class CollectionItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String count;
  final String followerCount;
  final String username;
  final Function()? onTap;

  const CollectionItem(
      {Key? key,
      this.imageUrl = '',
      this.title = '',
      this.count = '',
      this.followerCount = '',
      this.username = '',
      this.onTap})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl)
                    )
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 12, color: Color(0xff999999)),),
                    Text("$count篇 * $followerCount关注 * $username", style: TextStyle(fontSize: 12, color: Color(0xff999999)),),
                  ],
                ),
              ),
              Container(
                child: Icon(Icons.keyboard_arrow_right, color: Color(0xff999999),),
              )
            ],
          ),
        )
    );
  }
}