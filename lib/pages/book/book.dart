import 'package:flutter/material.dart';
import 'package:juejin/pages/book-detail/index.dart';

class BookPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bookpage();
  }
}

class _Bookpage extends State<BookPage> with SingleTickerProviderStateMixin {
  TabController _controller;

  var tabs = <Tab>[
    Tab(
      text: "全部",
    ),
    Tab(
      text: "已购",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Container(
            width: 200,
            child: TabBar(
              tabs: tabs,
              controller: _controller,
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            _renderAllList(),
            _renderEmptyPage(),
          ],
        ));
  }

  Widget _renderEmptyPage() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Text(
            "暂无已购小册",
            style: TextStyle(color: Color(0xff666666)),
          ),
        ),
      ),
    );
  }

  Widget _renderAllList() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          if (index.isOdd)
            return Divider(
              height: 1,
            );
          return _renderItem();
        });
  }

  Widget _renderItem() {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BookDetail();
          }));
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://user-gold-cdn.xitu.io/2019/9/25/16d67c7db5fc6421?imageView2/1/w/200/h/280/q/95/format/webp/interlace/1"),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 9)
                    ]),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Redis的自白：我为什么在单线程的这条路上越走越远？",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "zz_jesse",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff666666)),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "22小节",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff999999)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "·",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff999999)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "2222人购买",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    '19.9',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  color: Color(0xfff4f4f4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  clipBehavior: Clip.hardEdge)
            ],
          ),
        ));
  }
}
