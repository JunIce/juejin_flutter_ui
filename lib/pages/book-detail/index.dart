import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookDetail();
  }
}

class _BookDetail extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        top: false,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("深入理解TCP协议"),
          actions: [
            GestureDetector(onTap: () {},child: Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Icon(Icons.share),),),
          ],
        ),
        body: renderBody(),
        bottomNavigationBar: renderBottomButtons()
    ));
  }

  Widget renderBody() {

    List<Widget> _items = [
      renderBookDesc(),
      renderCustomerList(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Text("小册内容", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      )
    ];

    for(int i = 0; i< 10; i++) {
      _items.add(renderListItem());
      if(i < 9) {
        _items.add(Container(height: 1, color: Color(0xffdddddd),));
      }
    }

    return ListView(
      children: _items,
    );
  }

  Widget renderBottomButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1,color: Color(0xffdddddd)))
      ),
      child: Row(
        children: [
          Expanded(flex: 1,child:OutlineButton(onPressed: () {}, child: Text("试读"),)),
          SizedBox(width: 10,),
          Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {}, child: Text("购买 29.9"),
                color: Colors.blue,
                textColor: Colors.white,
              ))

        ],
      ),);
  }

  // 渲染顶部详情
  Widget renderBookDesc() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 150,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://user-gold-cdn.xitu.io/2020/5/30/172614feb424d2b3?imageView2/1/w/200/h/280/q/95/format/webp/interlace/1"),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                "SpringCloudNetflix 源码解读与原理分析",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "继SpringBoot原理分析之后的又一力作，从熟悉的场景逐步深入源码底层，理解SpringCloudNetflix中组件的设计和原理。",
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://img2.woyaogexing.com/2020/06/15/4f9c347b620d4663b0573a95c05f41ce!400x400.jpeg")),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "haojiahuo",
                          style: TextStyle(color: Color(0xff666666)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.people,
                      size: 20,
                      color: Color(0xff999999),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  // 渲染购买人列表
  Widget renderCustomerList() {
    List<Widget> _avatarList = new List.generate(
        5,
        (index) => SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img2.woyaogexing.com/2020/06/15/23a1204bd8a34af0bd7b176dd218c06d!400x400.jpeg"),
              ),
            ));

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1, color: Color(0xffcccccc)),
        bottom: BorderSide(width: 1, color: Color(0xffcccccc)),
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 24,
                    color: Color(0xff999999),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "4323人已购买",
                    style: TextStyle(color: Color(0xff999999), fontSize: 16),
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _avatarList,
            ))
          ],
        ),
      ),
    );
  }

  Widget renderListItem() {
    return ListTile(
//      leading: Text("1", style: TextStyle(fontSize: 16, color: Color(0xff999999)),),
      leading: Icon(Icons.book),
      title: Text("TCP/IP历史与分层模型"),
      subtitle: Text("阅读时长: 5分30秒  8237次学习"),
        trailing: Icon(Icons.lock, size: 12, color: Color(0xff999999),)
    );
  }
}
