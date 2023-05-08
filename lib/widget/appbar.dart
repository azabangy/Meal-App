import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimensions.dart';
import 'big_text.dart';
import 'dart:ui' as ui;

class App_Bar extends StatelessWidget {
   App_Bar({Key? key,required this.text}) : super(key: key);
 String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      height: Dimensions.screenHeight/10,
      decoration:  BoxDecoration(
          color: AppColors.mainColor.withOpacity(.1),
          borderRadius: const BorderRadius.only(bottomRight:Radius.circular(30),bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: AppColors.mainColor.withOpacity(.3),
                blurStyle: BlurStyle.outer,spreadRadius:2)
          ]
      ),
      padding: EdgeInsets.only(bottom: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: text,color: Colors.white,size: Dimensions.fontSize27),
        ],
      ),
    );
  }
}
