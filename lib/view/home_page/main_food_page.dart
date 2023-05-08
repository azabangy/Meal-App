import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/view/home_page/food_page_body.dart';
import 'package:al_waha/view/home_page/recommended_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

Future<void> _loadedResource() async {
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SafeArea(
          child: RefreshIndicator(
              onRefresh: _loadedResource,
              child: Stack(children: [
                backColor(),
                Column(
                  children: [
                    buildTopPage(),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                        children: const [
                          FoodPageBody(),
                          RecommendedList(),
                        ],
                      )),
                    ),
                  ],
                ),
              ])),
        ),
      ]),
    );
  }

  Container buildTopPage() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: Dimensions.height30,
                width: Dimensions.height30,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius15 / 1.3),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/logo.jpg'))),
              ),
              SizedBox(
                width: Dimensions.height20,
              ),
            ],
          ),
          Container(
              height: Dimensions.height30,
              width: Dimensions.height30,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius15 / 1.3)),
              child: const Icon(Icons.search, color: Colors.white)),
        ],
      ),
    );
  }

  backColor() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(center: FractionalOffset.topCenter,
              colors: [
            Colors.grey.shade100,
            Colors.grey.shade200,
            Colors.grey.shade300,
          ]),
        ),
      ),
    );
  }
}
