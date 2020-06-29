import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomShareCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            padding: EdgeInsets.only(top: 20),
            child: GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  return _buildCardItem(index.toString());
                }),
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "取消",
                style: TextStyle(color: Color(0xff999999), fontSize: 14),
              ))
        ],
      ),
    );
  }

  Widget _buildCardItem(String i) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
          msg: "测试文字${i}",
          gravity: ToastGravity.CENTER,
          fontSize: 14.0,
        );
      },
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.network(
                "https://img2.woyaogexing.com/2020/05/14/67dee0fb1a274246ac642f7f9cd8c448!400x400.jpeg"),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text("测试文字${i}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff999999), fontSize: 10))
      ]),
    );
  }
}