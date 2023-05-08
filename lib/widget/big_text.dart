import 'package:flutter/material.dart';

import '../constant/dimensions.dart';

class BigText extends StatelessWidget {
  BigText(
      {Key? key,
      this.color = const Color(0xff332d2b),
      required this.text,
      this.size =20 ,
      this.overflow = TextOverflow.ellipsis
      })
      : super(key: key);
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow = TextOverflow.clip;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size ==0 ? Dimensions.fontSize20 : size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w100

      ),
    );
  }
}
