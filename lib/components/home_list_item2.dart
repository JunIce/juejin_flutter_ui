import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeListItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _renderCardItem(context)
        ],
      ),
    );
  }

  Widget _renderCardItem(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12,right: 12,top: 16,bottom: 16),
            child: Column(
              children: [
                _renderTitle(context),
                SizedBox(height: 16,),
                Text("Row 和 Column 是 Flex 组件，是无法滚动的，如果没有足够的空间",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 8,),
                Text("Row 和 Column 是 Flex 组件，是无法滚动的，如果没有足够的空间，flutter就提示溢出错误。这种情况下，Expanded 或 Flexible 组件可用作长文本的自动换行。",
                  style: TextStyle(color: Color(0xff666666)),
                ),
//                SizedBox(height: 10,),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color(0xffdddddd)
                )
              )
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border ,color: Color(0xff999999), size: 16,),
                      SizedBox(width: 4,),
                      Text("39", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline ,color: Color(0xff999999), size: 16,),
                      SizedBox(width: 4,),
                      Text("39", style: TextStyle(color: Color(0xff999999), fontSize: 14),)
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                      Icon(Icons.share ,color: Color(0xff999999), size: 14,),
                      SizedBox(width: 4,),
                      Text("分享", style: TextStyle(color: Color(0xff999999), fontSize: 12),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1,
                  color: Colors.grey
              )
          ),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img2.woyaogexing.com/2020/05/13/6a6bc5e61e864388bf102528be9ffa8c!400x400.png"
              )
          ),
        ),
        Expanded(child: Container(padding: EdgeInsets.only(left: 8,right: 8), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SuperMan一路向北", style: TextStyle(fontSize: 14, color: Color(0xff333333))),
            SizedBox(height: 4,),
            Text("2018年05月19日阅读 23632", style: TextStyle(fontSize: 12, color: Color(0xff999999)),),
          ],
        ),)
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          color: Color(0xff999999),
          iconSize: 18,
          onPressed: () {
            print("print button");

            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Container(
                    height: 260,
//                    color: Colors.blue,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
//                          color: Colors.red,
                          padding: EdgeInsets.only(top: 20),
                          child: GridView.count(
                              padding: EdgeInsets.all(8.0),
                              primary: false,
                              mainAxisSpacing: 12.0,              // 竖向间距
                              crossAxisCount: 5,                  // 横向 Item 的个数
                              crossAxisSpacing: 12.0,
                              children: buildGridTileList(8)
                          ),
                        ),
                        Center(
                          child:Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("取消",
                                style: TextStyle(color: Color(0xff999999), fontSize: 14),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                );
          },
        )
      ]
    );
  }



  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList =  List();

    for (int i = 0; i < number; i++) {
      widgetList.add(Container(
        child: GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
                msg: "测试文字${i}",
                gravity: ToastGravity.CENTER,
                fontSize: 14.0,
            );
          },
          child: Column(children: [
            CircleAvatar(backgroundImage: NetworkImage("https://img2.woyaogexing.com/2020/05/14/67dee0fb1a274246ac642f7f9cd8c448!400x400.jpeg"),),
            SizedBox(height: 6,),
            Text("测试文字${i}" , style: TextStyle(color: Color(0xff999999), fontSize: 12))
          ]
          ),
        ),
      ));
    }
    return widgetList;
  }
}