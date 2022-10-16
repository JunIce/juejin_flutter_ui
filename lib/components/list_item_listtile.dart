import 'package:flutter/material.dart';

class ListItemListTile extends StatelessWidget {
  ListItemListTile({Key? key, required this.title, required this.image
  }):super(key: key);

  bool show = true;

  Widget title;
  Widget image;

  var trailing;

  @override
  Widget build(BuildContext context) {

    if(image != null) {
      trailing = Container(
        width: 80,
        height: 80,
        child: Container(
          child: image,
        ),
      );
    }
    return Container(
      color: Colors.white,
      child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(top: 14, bottom: 14),
            child: title,
          ),
          subtitle: Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Container(
                  child: Row(
                    children: [
                      Text("57人赞",style: TextStyle(fontSize: 12, color: Color(0xff999999))),
                      Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
                      Text("清秋", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
                      Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text("·"),),
                      Text("2天前", style: TextStyle(fontSize: 12, color: Color(0xff999999)))
                    ],
                  )
              )
          ),
          trailing: trailing
      )
    );
  }
}
