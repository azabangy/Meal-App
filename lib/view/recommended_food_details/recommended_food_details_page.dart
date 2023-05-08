import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_constant.dart';
import '../../controller/cart_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../helper/route_helper.dart';
import '../../widget/app_icon.dart';
import '../../widget/bottom_navigation_bar_for_count.dart';
import '../../widget/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  int pageId;

  RecommendedFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<RecommendedProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height20 * 4.5,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.getInitial()),
                    child: const AppIcon(icon: Icons.close)),
                GestureDetector(
                  onTap:()=> Get.toNamed(RouteHelper.getCartPage()),
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          GestureDetector(
                              onTap: () => Get.toNamed(RouteHelper.getCartPage()),
                              child: const AppIcon(icon: Icons.shopping_cart_outlined)),
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
                                        text:controller.totalItems >= 1
                                            ? controller.totalItems.toString()
                                            : '',
                                        size: 12,
                                        color: Colors.white),
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
            backgroundColor: AppColors.mainColor,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height45),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height20),
                    topLeft: Radius.circular(Dimensions.height20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.fontSize27,
                  ),
                ),
              ),
            ),
            expandedHeight: Dimensions.pageView,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${AppConstants.BASE_URL}/uploads/${product.img!}',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2),
                  padding: EdgeInsets.all(Dimensions.width10),
                  child: ExpandableTextWidget(text: product.description!),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(
        builder: (builder) {
          return BottomNavigationBarForCount(
            isPopular: false,
            price: product.price!,
            recommendedProduct: builder,
            product: product,
          );
        },
      ),
    );
  }
}
