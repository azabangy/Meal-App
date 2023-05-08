import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xff710305),
    this.iconColor = const Color(0xffFFFBF5),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: backgroundColor
        ),
        child: Icon(icon, color: iconColor, size: Dimensions.iconsSize20,),

    );
  }
}
