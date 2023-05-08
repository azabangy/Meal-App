import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {Key? key,
        this.isDescription,
        this.color = const Color(0xffccc7c5),
        required this.text,
        this.height=1.5,
        this.size = 15})
      : super(key: key);

  final Color? color;
  final String text;
  double size;
  double height;
  int? isDescription;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:isDescription ?? 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color:  color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height
      ),
    );
  }
}
