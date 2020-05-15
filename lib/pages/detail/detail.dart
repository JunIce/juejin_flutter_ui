import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
            color: Colors.black26
        ),
        title: Text("文章详情页", style: TextStyle(color: Color(0xff333333), fontSize: 16),),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            iconSize: 18,
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: 'https://juejin.im/post/5ebe292e5188256d42662700',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(top: 8, bottom: 30, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 1,
              color: Color(0xfff4f4f4)
            )
          )
        ),
        child: Row(
          children: [
            Expanded(
              child:Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffd1d1d1),
                    border: Border.all(width: 1, color: Color(0xffdddddd)),
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: InkWell(
                    child: Center(child: Text("友善发言的人运气不会太差", style: TextStyle(color: Color(0xff999999)),),),
                  ),
                )
              ) ,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Icon(Icons.title),
                  Text("43")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 4),
              child: Row(
                children: [
                  Icon(Icons.comment),
                  Text("43")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

