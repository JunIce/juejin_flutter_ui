import 'package:flutter/material.dart';

class ListItemListTile extends StatelessWidget {
  ListItemListTile({Key key, this.show}):super(key: key);
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(top: 14, bottom: 14),
            child: Text('Hooks 对12 Vue 而言意味着什么'),
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
          trailing: Container(
            width: 80,
            height: 80,
            child: Container(
              child: Image.network("https://img2.woyaogexing.com/2020/05/13/00d3b0d3f027478eb821225abb27a673!400x400.jpeg"),
            ),
          )
      )
    );
  }
}
