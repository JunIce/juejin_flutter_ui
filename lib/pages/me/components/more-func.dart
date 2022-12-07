import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:juejin/components/icon-text.dart';
import 'package:juejin/icons/index.dart';
import 'package:juejin/types/swiper-item.dart';
import 'dart:math';

class MoreFuncComp extends StatelessWidget {
  MoreFuncComp({Key? key}) : super(key: key);

  List<SwiperItem> menus = [
    SwiperItem(label: "课程中心", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "推广中心", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "闪念笔记", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "我的优惠券", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "我的圈子", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "阅读记录", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "邀请有礼", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "意见反馈", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "标签管理", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "我的报名", icon: IconFontIcons.iconActivity),
    SwiperItem(label: "简历管理", icon: IconFontIcons.iconActivity),
  ];

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
                '更多功能',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              // Icon(IconFontIcons.iconArrowRight),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ConstrainedBox(
              child: Swiper(
                outer: false,
                loop: false,
                itemBuilder: (c, i) {
                  return GridView.count(
                    crossAxisCount: 4,
                    children: menus
                        .getRange(i * 8, min((i + 1) * 8, menus.length))
                        .map((e) => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Icon(e.icon),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(e.label),
                              ],
                            )))
                        .toList(),
                  );
                },
                pagination: SwiperPagination(margin: EdgeInsets.all(5.0)),
                itemCount: (menus.length / 8).ceil(),
              ),
              constraints: BoxConstraints.loose(
                  Size(MediaQuery.of(context).size.width, 170.0))),
        ]),
      ),
    );
  }
}
