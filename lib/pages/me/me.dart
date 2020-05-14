import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MePage();
  }
}

class _MePage extends State<MePage>{

  bool switchActive = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我"),
      ),
      backgroundColor: Color(0xfff4f4f4),
      body: ListView(
        children: [
          SizedBox(height: 16,),
          Container(
            color: Colors.white,
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              leading: CircleAvatar(

                  backgroundImage: NetworkImage("https://user-gold-cdn.xitu.io/2019/9/6/16d024e432ffb853?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1")
              ),
              title: Text("用户名", style: TextStyle(fontSize: 16, color: Color(0xff333333), fontWeight: FontWeight.bold),),
              subtitle: Text("前端",style: TextStyle(fontSize: 12, color: Color(0xff666666)),),
                trailing: Icon(Icons.chevron_right, color: Color(0xffcccccc), size: 32,)
            ),
          ),



          SizedBox(height: 16,),


          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.ring_volume, size: 18, color: Colors.blue,),
              title: Text("消息中心"),
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.favorite, size: 18, color: Colors.greenAccent,),
              title: Text("我赞过的"),
                trailing: Text("16篇", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.star, size: 18, color: Colors.blue,),
              title: Text("收藏集"),
                trailing: Text("4个", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.book, size: 18, color: Colors.blue,),
              title: Text("已购小册"),
                trailing: Text("0本", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.remove_red_eye, size: 18, color: Colors.grey,),
              title: Text("阅读过的文章"),
                trailing: Text("3000篇", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
                leading: Icon(Icons.filter_vintage, size: 18, color: Colors.grey,),
                title: Text("标签管理"),
                trailing: Text("21个", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
            ),
          ),

          SizedBox(height: 16,),


//          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
                leading: Icon(Icons.wb_sunny, size: 18, color: Colors.grey,),
                title: Text("夜间模式"),
                trailing: Switch(value: switchActive, onChanged: (e){
                  setState(() {
                    switchActive = e;
                  });
                }),
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
                leading: Icon(Icons.question_answer, size: 18, color: Colors.grey,),
                title: Text("意见反馈"),
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: ListTile(
                leading: Icon(Icons.settings, size: 18, color: Colors.grey,),
                title: Text("设置"),
            ),
          ),
        ],
      ),
    );
  }
}