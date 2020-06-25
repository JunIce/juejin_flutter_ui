import 'package:flutter/material.dart';
import 'dart:math';

class TabBarPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  TabBarPersistentHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: child);
  }

  @override
  bool shouldRebuild(TabBarPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}