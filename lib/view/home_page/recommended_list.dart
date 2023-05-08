import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/widget/big_text.dart';
import 'package:al_waha/widget/row_icons.dart';
import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_constant.dart';
import '../../controller/recommended_product_controller.dart';
import '../../helper/route_helper.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              BigText(
                text: 'Recommended',
                color: AppColors.mainColor,
                size: Dimensions.fontSize27,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: BigText(
                  text: '   .  ',
                  color: Colors.black26,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 1),
                child: SmallText(text: ' Food Pairing '),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height10),
          GetBuilder<RecommendedProductController>(builder: (builder) {
            return builder.isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: builder.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Dimensions.height10 / 2),
                          child: Row(
                            children: [
                              Container(
                                height: Dimensions.listViewImg,
                                width: Dimensions.listViewImg,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.7),
                                        blurRadius: 5,
                                        offset: const Offset(3, 5),
                                        blurStyle: BlurStyle.outer)
                                  ],
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          Dimensions.borderRadius15),
                                      topLeft: Radius.circular(
                                          Dimensions.borderRadius15)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${AppConstants.BASE_URL}/uploads/${builder.recommendedProductList[index].img!}'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewImg,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.7),
                                          blurRadius: 5,
                                          offset: const Offset(3, 5),
                                          blurStyle: BlurStyle.outer)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          Dimensions.borderRadius15,
                                        ),
                                        bottomRight: Radius.circular(
                                          Dimensions.borderRadius15,
                                        )),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: Dimensions.width20,
                                      right: Dimensions.width10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                            text: builder
                                                .recommendedProductList[index]
                                                .name!),
                                        SmallText(
                                            text: builder
                                                .recommendedProductList[index]
                                                .description!),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            RowIcons(
                                                icon: Icons.circle,
                                                text: ' Normal',
                                                iconColor:
                                                    AppColors.iconColor1),
                                            RowIcons(
                                                icon: Icons.location_on,
                                                text: ' 1,9 km',
                                                iconColor: AppColors.mainColor),
                                            RowIcons(
                                                icon:
                                                    Icons.watch_later_outlined,
                                                text: ' 32 min',
                                                iconColor:
                                                    AppColors.iconColor2),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ));
          }),
        ],
      ),
    );
  }
}
