import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/material.dart';

class RowIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double size;

  const RowIcons(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor,
         this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SmallText(text: text),
      ],
    );
  }
}
