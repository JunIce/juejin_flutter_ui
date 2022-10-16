import 'package:flutter/material.dart';
import 'package:juejin/icons/index.dart';

class MoreFuncComp extends StatelessWidget {
  const MoreFuncComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '创作者数据',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Icon(IconFontIcons.iconArrowRight),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  children: [
                    Icon(IconFontIcons.iconContent),
                    SizedBox(height: 8),
                    Text("内容数据")
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Icon(IconFontIcons.iconDatas),
                    SizedBox(height: 8),
                    Text("关注者数据")
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Icon(IconFontIcons.iconPromotion),
                    SizedBox(height: 8),
                    Text("创作活动")
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Icon(IconFontIcons.iconDraft),
                    SizedBox(height: 8),
                    Text("草稿箱")
                  ],
                ))
              ])
        ]),
      ),
    );
  }
}
