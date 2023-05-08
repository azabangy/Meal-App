import 'package:al_waha/model/product_model.dart';
import 'package:al_waha/widget/app_icon.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimensions.dart';
import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';
import 'big_text.dart';

class BottomNavigationBarForCount extends StatelessWidget {
  int price;
  bool isPopular;

  ProductModel product;
  PopularProductController? popularProduct;
  RecommendedProductController? recommendedProduct;

  BottomNavigationBarForCount(
      {Key? key,
      required this.product,
      required this.isPopular,
      required this.price,
      this.recommendedProduct,
      this.popularProduct})
      : super(key: key);

  int get total {
    if (isPopular) {
      return price * popularProduct!.inCardItems;
    } else {
      return price * recommendedProduct!.inCardItems;
    }
  }

  final backgroundColor = const Color(0xffb71c1c);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20 * 2, vertical: Dimensions.height20),
      height: Dimensions.buttonHeightBar,
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColors,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.borderRadius25),
          topRight: Radius.circular(Dimensions.borderRadius25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.borderRadius25),
            ),
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.height20,
                right: Dimensions.height20),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      isPopular
                          ? popularProduct?.setQuantity(false)
                          : recommendedProduct?.setQuantity(false);
                    },
                    child: const AppIcon(
                        icon: Icons.remove, backgroundColor: Colors.grey)),
                SizedBox(
                  width: Dimensions.width20 * 2,
                ),
                BigText(
                  text: isPopular
                      ? '${popularProduct?.inCardItems}'
                      : '${recommendedProduct?.inCardItems}',
                  color: AppColors.titleColors,
                  size: Dimensions.fontSize27,
                ),
                SizedBox(
                  width: Dimensions.width20 * 2,
                ),
                GestureDetector(
                    onTap: () {
                      isPopular
                          ? popularProduct?.setQuantity(true)
                          : recommendedProduct?.setQuantity(true);
                    },
                    child: AppIcon(
                        icon: Icons.add, backgroundColor: backgroundColor)),
              ],
            ),
          ),



          GestureDetector(
            onTap: () {
              if (isPopular) {
                popularProduct!.addItem(product);
              } else {
                recommendedProduct!.addItem(product);
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20 * 1.5,
                  bottom: Dimensions.height20 * 1.5,
                  left: Dimensions.height10,
                  right: Dimensions.height10),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius25)),
              child: BigText(
                text: ' $total \$  Add To Cart',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
