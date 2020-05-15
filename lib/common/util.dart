import 'package:flutter/material.dart';
import 'dart:math';

class Util {
  static Color slRandomColor({int r = 255, int g = 255, int b = 255, a = 255}) {
    if (r == 0 || g == 0 || b == 0) return Colors.black;
    if (a == 0) return Colors.white;
    return Color.fromARGB(
      a,
      r != 255 ? r : Random.secure().nextInt(r),
      g != 255 ? g : Random.secure().nextInt(g),
      b != 255 ? b : Random.secure().nextInt(b),
    );
  }
}