import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackgroundFilter extends StatelessWidget {
  const BackgroundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
    Positioned.fill(
    child: Image.network(
    'https://th.bing.com/th/id/R.819b02fe7d661d5b790570f99e9dae34?rik=ZbT3C0DmIWlSwg&pid=ImgRaw&r=0')),
    BackdropFilter(
    filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    child: Container(color: Colors.transparent,))
    ,
    ]);
  }
}
