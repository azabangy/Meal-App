import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../constant/dimensions.dart';
import 'customClipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: Dimensions.screenHeight *.4,
          width: Dimensions.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffF32024),Color(0xff710305)]
              )
            ),
        ),
      ),
      )
    );
  }
}