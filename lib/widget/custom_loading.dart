import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/controller/auth_controller_backend.dart';
import 'package:al_waha/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/dimensions.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      color: Colors.black.withOpacity(.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom:Dimensions.height20),
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: AppColors.shadowBottom,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.height45 * 2 / 2),
              ),
              child: Container(
                //margin: EdgeInsets.only(bottom:Dimensions.height30),
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                  boxShadow: AppColors.shadowBottom,
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.height45 * 2 / 2),
                ),
                child: Container(
                  height: Dimensions.height45*1.4,
                  width: Dimensions.height45*1.4,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.height45 * 3 / 2),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.mainColor,
                          strokeWidth: 40,
                          backgroundColor: Colors.orange.shade400,
                        ),
                        CircularProgressIndicator(
                          color: Colors.deepOrange,
                          strokeWidth: 9,
                          backgroundColor:Colors.orange.shade100
                          ,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          BigText(text: 'Loading...',color: AppColors.mainColor,),

        ],
      ),
    );
  }
}
