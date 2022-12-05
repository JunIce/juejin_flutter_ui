import 'package:flutter/material.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/icons/index.dart';

class WriterCenter extends StatelessWidget {
  const WriterCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
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
                '创作者中心',
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
                Expanded(
                    flex: 1,
                    child: Container(
                      child: IconText(
                        iconColor: Color(0xff333333),
                        textColor: Color(0xff333333),
                        iconSize: 22,
                        textSize: 14,
                        gutter: 6,
                        icon: IconFontIcons.iconContent,
                        direction: Axis.vertical,
                        text: "内容数据",
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: IconText(
                        iconColor: Color(0xff333333),
                        textColor: Color(0xff333333),
                        iconSize: 22,
                        textSize: 14,
                        gutter: 6,
                        icon: IconFontIcons.iconDatas,
                        direction: Axis.vertical,
                        text: "关注者数据",
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        child: Container(
                      child: IconText(
                        iconColor: Color(0xff333333),
                        textColor: Color(0xff333333),
                        iconSize: 22,
                        textSize: 14,
                        gutter: 6,
                        icon: IconFontIcons.iconPromotion,
                        direction: Axis.vertical,
                        text: "创作活动",
                      ),
                    ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: IconText(
                        iconColor: Color(0xff333333),
                        textColor: Color(0xff333333),
                        iconSize: 22,
                        textSize: 14,
                        gutter: 6,
                        icon: IconFontIcons.iconDraft,
                        direction: Axis.vertical,
                        text: "草稿箱",
                      ),
                    ))
              ])
        ]),
      ),
    );
  }
}
