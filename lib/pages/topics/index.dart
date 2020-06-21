import 'package:flutter/material.dart';

class TopicListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _TopicListPage();
  }
}

class _TopicListPage extends State<TopicListPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text("话题广场"),
        elevation: 0,
      ),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return Column(
      children: [
//        SizedBox(height: 10,),
        Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if(index == 0) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      color: Colors.white,
                      child: Text("更多话题"),
                    );
                  }
                  
                  return _renderItem();
                },
                separatorBuilder: (BuildContext context, int index)  => Divider(height: 1,),
                itemCount: 11
            )
        )
      ],
    );
  }
  
  Widget _renderItem() {
    var image = "https://img2.woyaogexing.com/2020/06/19/04e85654c6284ebf88b35d67a2f9ebea!400x400.jpeg";
    var subtitle = "168关注 · 68沸点";
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        leading: Container(
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(4)
          ),
        ),
        title: Text("活动推荐"),
        subtitle: Text(subtitle),
        trailing: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfff4f4f4)
            ),
            child: Text('关注', style: TextStyle(color: Colors.blue, fontSize: 12),),
          ),
        ),
      ),
    );
  }


}