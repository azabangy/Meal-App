
import 'package:al_waha/widget/row_icons.dart';
import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimensions.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key, required this.text}) : super(key: key);
 final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.fontSize20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: Colors.yellow.shade600,
                    size: Dimensions.height20,
                  )),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: '5'),
            SizedBox(
              width: Dimensions.width100*1.2,
            ),
            SmallText(text: ' 1244  Comments')
          ],
        ),
        // SizedBox(
        //   height: Dimensions.height20,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            RowIcons(
                icon: Icons.circle,
                text: '  Normal',
                iconColor: AppColors.iconColor1),
            RowIcons(
                icon: Icons.location_on,
                text: '  1,9 km',
                iconColor: AppColors.mainColor),
            RowIcons(
                icon: Icons.watch_later_outlined,
                text: '  32 min',
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
