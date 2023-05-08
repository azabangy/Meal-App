import 'package:al_waha/controller/auth_controller_backend.dart';
import 'package:al_waha/controller/cart_controller.dart';
import 'package:al_waha/controller/popular_product_controller.dart';
import 'package:al_waha/view/cart_page/cart_history.dart';
import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import '../../constant/app_constant.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../controller/auth_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../helper/route_helper.dart';
import '../../widget/app_icon.dart';
import '../../widget/back_drop_filter.dart';
import '../../widget/big_text.dart';
import '../../widget/payment.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20 * 2,
            right: Dimensions.width20 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: const AppIcon(icon: Icons.arrow_back_ios)),
                SizedBox(
                  width: Dimensions.width100 * 3,
                ),
                GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.getInitial()),
                    child: const AppIcon(icon: Icons.home_outlined)),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () =>
                                Get.toNamed(RouteHelper.getHistoryPage()),
                            child: const AppIcon(
                                icon: Icons.shopping_cart_outlined)),
                        controller.totalItems >= 1
                            ? Positioned(
                                top: -2,
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
                                      text: controller.totalItems >= 1
                                          ? controller.totalItems.toString()
                                          : '',
                                      size: 15,
                                      color: Colors.white),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width10,
                  right: Dimensions.width10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (builder) {
                  var cartList = builder.getItems;
                  return cartList.length >= 1
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            int total = cartList[index].price!.toInt() *
                                cartList[index].quantity!.toInt();
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  cartList[index].product!);
                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouteHelper.getPopularFood(
                                            popularIndex));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(cartList[index].product!);
                                        if (recommendedIndex < 0) {
                                          Get.snackbar('Sorry',
                                              'Product preview is not available for History Product.',
                                              colorText: Colors.white,
                                              backgroundColor:
                                                  AppColors.mainColor,
                                              backgroundGradient:
                                                  LinearGradient(
                                                      colors: [
                                                    Colors.red.shade900,
                                                    Colors.red,
                                                    Colors.red.shade900,
                                                  ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter));
                                        } else {
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex));
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: Dimensions.listViewContent,
                                      width: Dimensions.listViewImg,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              Dimensions.borderRadius15,
                                            ),
                                            bottomLeft: Radius.circular(
                                              Dimensions.borderRadius15,
                                            )),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '${AppConstants.BASE_URL}/uploads/${builder.getItems[index].img!}'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(.7),
                                              blurRadius: 5,
                                              offset: const Offset(3, 5),
                                              blurStyle: BlurStyle.outer)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Dimensions.listViewContent,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                              Dimensions.borderRadius15,
                                            ),
                                            bottomRight: Radius.circular(
                                              Dimensions.borderRadius15,
                                            )),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(.5),
                                              blurRadius: 5,
                                              offset: const Offset(3, 5),
                                              blurStyle: BlurStyle.outer)
                                        ],
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
                                                    .getItems[index].name!),
                                            SmallText(text: 'Spicy'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(text: '$total'),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          builder.addItem(
                                                              cartList[index]
                                                                  .product!,
                                                              -1);
                                                        },
                                                        child: AppIcon(
                                                          icon: Icons.remove,
                                                          backgroundColor:
                                                              Colors.grey,
                                                          size: Dimensions
                                                                  .iconsSize *
                                                              3,
                                                        )),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width20 *
                                                              2,
                                                    ),
                                                    BigText(
                                                      text: cartList[index]
                                                          .quantity
                                                          .toString(),
                                                      color:
                                                          AppColors.titleColors,
                                                      size:
                                                          Dimensions.fontSize27,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width20 *
                                                              2,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          if (cartList[index]
                                                                  .quantity! <
                                                              1) {}
                                                          builder.addItem(
                                                              cartList[index]
                                                                  .product!,
                                                              1);
                                                        },
                                                        child: AppIcon(
                                                          icon: Icons.add,
                                                          backgroundColor:
                                                              AppColors
                                                                  .mainColor,
                                                          size: Dimensions
                                                                  .iconsSize *
                                                              3,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : GestureDetector(
                          onTap: () => Get.toNamed(RouteHelper.getInitial()),
                          child: Image.asset(
                            "assets/images/emptycart.png",
                            fit: BoxFit.contain,
                          ),
                        );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20 * 2,
              vertical: Dimensions.height20),
          height: Dimensions.buttonHeightBar,
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColors,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.borderRadius25),
              topRight: Radius.circular(Dimensions.borderRadius25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius25),
                  ),
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.height20,
                      right: Dimensions.height20),
                  child: Center(
                    child: BigText(
                      text: '${cartController.totalPrice}\$',
                      size: Dimensions.fontSize27,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (Get.find<AuthController>().isLogin) {
                      Payment.makePayment(
                          cartController.totalPrice.toString(), ' \$ ');
                      if (Payment.paymentSuccess) {
                        cartController.addToHistory();
                      }
                    } else {
                      Get.toNamed(RouteHelper.getSignInPage());
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20 * 1.5,
                        bottom: Dimensions.height20 * 1.5,
                        left: Dimensions.height45,
                        right: Dimensions.height45),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius25)),
                    child: BigText(
                      text: 'Check Out',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
