import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/controller/popular_product_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_constant.dart';
import '../../helper/route_helper.dart';
import '../../model/product_model.dart';
import '../../widget/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView / 1.25,
          child: ListView(
            children: [
              GetBuilder<PopularProductController>(builder: (builder) {
                return builder.isLoaded
                    ? CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) =>
                            _buildPageItemView(
                                index, builder.popularProductList[index]),
                        itemCount: builder.popularProductList.length,
                        options: CarouselOptions(
                          height: Dimensions.carouseSliderHeight / 1.2,
                          onPageChanged: (index, _) {
                            setState(() {
                              currentPageIndex = index;
                            });
                          },
                          pauseAutoPlayOnTouch: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlay: true,
                          autoPlayCurve: Curves.decelerate,
                          enlargeCenterPage: true,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ));
              }),
              GetBuilder<PopularProductController>(builder: (builder) {
                return DotsIndicator(
                  dotsCount: builder.popularProductList.isEmpty
                      ? 1
                      : builder.popularProductList.length,
                  position: currentPageIndex.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    color: AppColors.mainColor.withOpacity(.4),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  _buildPageItemView(int index, ProductModel popularProduct) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.getPopularFood(index)),
      child: Stack(
          children: [
        Container(
          height: Dimensions.pageViewContainer / 1.15,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 6,
                  offset: Offset(0, 10),
                  color: AppColors.mainColor,
                  blurStyle: BlurStyle.solid),
            ],
            color: index.isEven ? Colors.red : Colors.yellow,
            borderRadius: BorderRadius.circular(Dimensions.borderRadius25),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    '${AppConstants.BASE_URL}/uploads/${popularProduct.img!}')),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer / 1.2,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.height20, vertical: Dimensions.height10),
            padding: EdgeInsets.only(
                left: Dimensions.height10,
                right: Dimensions.height10,
                bottom: Dimensions.height10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 5,
                      offset: const Offset(3, 5),
                      blurStyle: BlurStyle.solid)
                ]),
            child: Container(
              padding: EdgeInsets.all(Dimensions.height10),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        ),
      ]),
    );
  }
}
