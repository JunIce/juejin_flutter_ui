import 'package:flutter/material.dart';
import '../components/home_top_recs.dart';
import 'home_follow_page.dart';


class HomeIndexPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeIndexPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          width: 200,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: '首页',),
              Tab(text: '关注',),
            ]
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.arrow_drop_down),
          )
        ],
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => index == 0 ? HomeTopRec(): _itemBuild(),
            ),
            HomeFollowPage()
          ],
      ),
    );
  }

  Widget _itemBuild() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
      color: Colors.white,
      child: _itemCard(),
      margin: EdgeInsets.only(top: 12),
    );
  }

  Widget _itemCard() {
    return Container(
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          _headLine,
          SizedBox(height: 12,),
          _itemMain,
          SizedBox(height: 12,),
          _bottomButton
        ],
      ),
    );
  }
  Row _bottomButton = Row(mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Icon(Icons.gamepad, color: Color(0xff666666),size: 16,),
      SizedBox(width: 6,),
      Text('赞', style: TextStyle(
        fontSize: 16,
        color: Color(0xff666666),
      ),),
      SizedBox(width: 30,),
      Icon(Icons.comment, color: Color(0xff666666),size: 16,),
      SizedBox(width: 6,),
      Text('评论', style: TextStyle(
        fontSize: 16,
        color: Color(0xff666666),
      ))
    ],
  );

  Row _headLine = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://img2.woyaogexing.com/2019/03/01/f4471c4c54bd2c63!400x400_big.jpg')
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('生活不宠', style: TextStyle(color: Color(0xff333333), fontSize: 16)),
          )
        ],
      ),
      Text('Python', style: TextStyle(color: Color(0xff333333), fontSize: 16),)
    ],
  );

  Row _itemMain = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Flexible(child:
        Column(children: <Widget>[
          Text('为前端工程之崛起而编程',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
            softWrap: true,
          ),
          Text('当时的角度主要注重产品体验上。现在入职蚂蚁1年左右，对其又产生了一些新',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff444444)
            ),
            softWrap: true,
          )
        ],)
      ,),
      SizedBox(width: 8,)
      ,
      Image.network('https://img2.woyaogexing.com/2018/12/29/e93a3438770aa5c3!300x200.jpg', 
        fit: BoxFit.contain,
        width: 150,
      )
    ],
  );
}