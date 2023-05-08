import 'dart:convert';

import 'package:al_waha/constant/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model.dart';

class CartRepository {
  final SharedPreferences sharedPreferences;
  List<String> cart = [];
  List<String> cartHistory = [];
  CartRepository({required this.sharedPreferences});

  void addToCartList(List<CartModel> cartList) {

//    sharedPreferences.remove(AppConstants.CART_LIST);
//     sharedPreferences.remove(AppConstants.CART_HISTORY);
// return;

    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element){
      element.time= time;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> cartItems = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      cartItems = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    cartItems.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY)){
      cartHistory=[];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach(
            (element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));

    return cartHistoryList;
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY)!;
    }
    for(int i=0;i<cart.length;i++){
      cartHistory.add(cart[i]);
    }
    removeCart();
  sharedPreferences.setStringList(AppConstants.CART_HISTORY, cartHistory);
  }

  void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory(){
    removeCart();
    cartHistory=[];
    sharedPreferences.remove(AppConstants.CART_HISTORY);
  }

}
