import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/material.dart';

import '../constant/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.2;

  @override
  void initState() {

    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
        isDescription: 100,
              size: Dimensions.fontSize18,
              color: AppColors.paraColors,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                  isDescription: 100,
                    size: Dimensions.fontSize18,
                    color: AppColors.paraColors,
                    text: !hiddenText
                        ? (firstHalf + secondHalf)
                        : ('$firstHalf...'),),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText =! hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? 'Show more' : 'Show Less',
                        color: AppColors.mainColor.withOpacity(.8),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down_sharp
                            : Icons.arrow_drop_up_sharp,
                        color: AppColors.mainColor.withOpacity(.5),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
