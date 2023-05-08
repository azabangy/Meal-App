import 'dart:convert';

import 'package:al_waha/constant/app_constant.dart';
import 'package:al_waha/controller/cart_controller.dart';
import 'package:al_waha/helper/route_helper.dart';
import 'package:al_waha/model/cart_model.dart';
import 'package:al_waha/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../widget/appbar.dart';
import '../../widget/small_text.dart';
import 'dart:ui' as ui;

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemTimeToList();
    var listCounter = 0;
    return Scaffold(
      backgroundColor: AppColors.buttonBackgroundColors,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.network(
                  'https://th.bing.com/th/id/R.819b02fe7d661d5b790570f99e9dae34?rik=ZbT3C0DmIWlSwg&pid=ImgRaw&r=0')),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Column(
            children: [
              App_Bar(
                text: 'Cart History',
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView(
                      children: [
                        for (int i = 0; i < itemsPerOrder.length; i++)
                          Container(
                            height: Dimensions.screenHeight / 5.5,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.borderRadius15)),
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (() {
                                  DateTime parseDate =
                                      DateFormat("yyyy-mm-dd hh:mm:ss").parse(
                                          getCartHistoryList[listCounter]
                                              .time!);
                                  var inputDate =
                                      DateTime.parse(parseDate.toString());
                                  var outputFormat =
                                      DateFormat("DD/MM/yyyy         HH:MM a");
                                  var outputDate =
                                      outputFormat.format(inputDate);
                                  return Center(
                                      child: BigText(
                                    text: outputDate,
                                    color: Colors.white,
                                  ));
                                }()),

                                const Center(
                                    child: Divider(
                                  color: Colors.grey,
                                  height: 15,
                                  thickness: 1,
                                  endIndent: 10,
                                  indent: 10,
                                )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemsPerOrder[i],
                                          (index) {
                                        if (listCounter <
                                            getCartHistoryList.length) {
                                          listCounter++;
                                        }
                                        return index <= 2
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                height:
                                                    Dimensions.iconsSize * 7,
                                                width: Dimensions.iconsSize * 7,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.borderRadius15,
                                                    ),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "${AppConstants.BASE_URL}/uploads/${getCartHistoryList[listCounter - 1].img}"))),
                                              )
                                            : Container();
                                      }),
                                    ),
                                    Container(
                                      height: Dimensions.screenHeight / 8.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            text: 'Total',
                                          ),
                                          BigText(
                                            text: '${itemsPerOrder[i]} Items',
                                            color: Colors.white,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              var orderTime =
                                                  cartOrderTimeToList();
                                              Map<int, CartModel> oneMore = {};
                                              for (int j = 0; j < getCartHistoryList.length; j++) {
                                                if (getCartHistoryList[j]
                                                        .time ==
                                                    orderTime[i]) {
                                                  oneMore.putIfAbsent(
                                                      getCartHistoryList[j].id!,
                                                      () => CartModel.fromJson(
                                                          jsonDecode(jsonEncode(
                                                              getCartHistoryList[
                                                                  j]))));
                                                }
                                              }
                                              Get.find<CartController>()
                                                  .setItems = oneMore;
                                              Get.find<CartController>()
                                                  .addToCartList();
                                              Get.toNamed(
                                                  RouteHelper.getCartPage());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Dimensions
                                                            .borderRadius15 /
                                                        2),
                                                border: Border.all(
                                                  color: Colors.green.shade500,
                                                  width: 1,
                                                ),
                                              ),
                                              child: SmallText(
                                                text: 'One More ?',
                                                color: Colors.green.shade500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
