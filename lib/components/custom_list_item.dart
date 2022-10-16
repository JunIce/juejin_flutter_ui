import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
   String title;
   String trailingImageUrl;
   int favoriteNum;
   String username;
   String pubtime;

  CustomListItem(
      Key? key,
      required this.title,
      this.trailingImageUrl = '',
      this.favoriteNum = 0,
      this.username = '',
      this.pubtime = ''
      );



  Widget _rtitle;

  Widget _rSubtitle;

  Widget _rTrailing;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(title != null) {
      _rtitle = Padding(
        padding: EdgeInsets.only(top: 14, bottom: 14),
        child: Text(title),
      );
    }

    _rSubtitle = Padding(
        padding: EdgeInsets.only(bottom: 14),
        child: Container(
            child: Row(
              children: [
                Text("$favoriteNum人赞",style: TextStyle(fontSize: 12, color: Color(0xff999999))),
                Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
                Text("$username", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
                Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
                Text("$pubtime", style: TextStyle(fontSize: 12, color: Color(0xff999999)))
              ],
            )
        )
    );

    if(trailingImageUrl != null) {
      _rTrailing = Container(
        width: 80,
        height: 80,
        child: Container(
          child: Image.network(trailingImageUrl),
        ),
      );
    }



    return Container(
      child: ListTile(
          title: _rtitle,
          subtitle: _rSubtitle,
          trailing: _rTrailing
      ),
    );
  }
}