import 'package:al_waha/constant/app_constant.dart';
import 'package:al_waha/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../controller/cart_controller.dart';
import '../../helper/route_helper.dart';
import '../../widget/app_column.dart';
import '../../widget/app_icon.dart';
import '../../widget/big_text.dart';
import '../../widget/bottom_navigation_bar_for_count.dart';
import '../../widget/expandable_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;

  PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImg,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${AppConstants.BASE_URL}/uploads/${product.img!}'),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios)),

                GetBuilder<CartController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(RouteHelper.getCartPage()),
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                         controller.totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.mainColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-1, 2),
                                            spreadRadius: 1,
                                            blurStyle: BlurStyle.inner),
                                      ],
                                    ),
                                    child: BigText(
                                        text: controller.totalItems >=
                                                1
                                            ? controller.totalItems
                                                .toString()
                                            : '',
                                        size: 16,
                                        color: Colors.white),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImg - 30,
            child: Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.height30),
                  topLeft: Radius.circular(Dimensions.height30),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name.toString(),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (builder) {
          return BottomNavigationBarForCount(
            isPopular: true,
            price: product.price!,
            popularProduct: builder,
            product: product,
          );
        },
      ),
    );
  }
}
