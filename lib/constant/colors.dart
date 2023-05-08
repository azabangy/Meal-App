
import 'package:flutter/material.dart';

class AppColors {

  static const Color textColor = Color(0xffccc7c5);
  static const Color mainColor = Color(0xff710305);
  static const Color iconColor1 = Color(0xffffd28d);
  static const Color iconColor2 = Color(0xfffcab88);
  static const Color paraColors = Color(0xff8f837f);
  static const Color buttonBackgroundColors = Color(0xffe7e7e7);
  static const Color signColors = Color(0xffa9a29f);
  static const Color titleColors = Color(0xff5c524f);
  static const Color mainBlackColors = Color(0xff332d2b);
  static const Color yellowColors = Color(0xffffd379);
  static const Color backgroundSplashColor =Color(0xff222B35);
  static  List<BoxShadow> shadowBottom =   [
    BoxShadow(
        color: Colors.grey.withAlpha(100),
        offset: const Offset(0, 5),
        blurRadius: 8,
        spreadRadius: 2),
    BoxShadow(
        color: Colors.grey.withAlpha(100),
        offset: const Offset(5, 0),
        blurRadius: 8,
        spreadRadius: 2),
    BoxShadow(
        color: Colors.grey.withAlpha(100),
        offset: const Offset(0, -5),
        blurRadius: 8,
        spreadRadius: 2),
    BoxShadow(
        color: Colors.grey.withAlpha(100),
        offset: const Offset(-5, 0),
        blurRadius: 8,
        spreadRadius: 2),
  ];


}
