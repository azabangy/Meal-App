import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/widget/app_icon.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget {
   AccountWidget({Key? key,required this.text,required this.icon}) : super(key: key);
  AppIcon icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.height10/2),
      padding: EdgeInsets.all(Dimensions.height10*2),
      decoration:  BoxDecoration(
        color: Colors.white,
       borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
          boxShadow: [
            BoxShadow(
                color: AppColors.mainColor.withOpacity(.2),
                blurRadius: 5,
                offset: const Offset(3, 5),
                blurStyle: BlurStyle.solid)
          ]
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: Dimensions.width10*3,),
          BigText(text: text,size: 18,),

        ],
      ),
      
    );
  }
}
