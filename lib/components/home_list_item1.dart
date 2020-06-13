

import 'package:flutter/material.dart';
import 'package:flutter_app/components/content_button.dart';


class HomeListItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _itemBuild();
  }



  Widget _itemBuild() {
    return ContentButton(
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
          color: Colors.white,
          child: _itemCard(),
        ));
  }

  Widget _itemCard() {
    return Container(
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          _headLine,
          SizedBox(
            height: 12,
          ),
          _itemMain,
          SizedBox(
            height: 12,
          ),
          _bottomButton
        ],
      ),
    );
  }

  Row _bottomButton = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Icon(
        Icons.info_outline,
        color: Color(0xff999999),
        size: 12,
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        '543',
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff999999),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.lightbulb_outline,
        color: Color(0xff999999),
        size: 12,
      ),
      SizedBox(
        width: 4,
      ),
      Text('36',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff999999),
          ))
    ],
  );

  Row _headLine = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img2.woyaogexing.com/2019/03/01/f4471c4c54bd2c63!400x400_big.jpg'))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('生活不宠',
                style: TextStyle(color: Color(0xff333333), fontSize: 14)),
          )
        ],
      ),
      Text(
        'Python',
        style: TextStyle(color: Color(0xffcccccc), fontSize: 14),
      )
    ],
  );

  Row _itemMain = Row(
    children: <Widget>[
      Expanded(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    '为前端工程之崛起而编程',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                    softWrap: true,
                    textDirection: TextDirection.ltr,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '当时的角度主要',
                    style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                    softWrap: true,
                    textDirection: TextDirection.ltr,
                  )
                ],
              ))),
      SizedBox(
        width: 10,
      ),
      Image.network(
        'https://img2.woyaogexing.com/2018/12/29/e93a3438770aa5c3!300x200.jpg',
        fit: BoxFit.contain,
        width: 100,
      )
    ],
  );

}