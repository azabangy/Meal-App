import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repository.dart';
import '../model/product_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  late CartController _cart;

  PopularProductController({required this.popularProductRepository});

  List<ProductModel> _popularProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product
          .fromJson(response.body)
          .products);
      _isLoaded = true;
      update();
    }
  }

  int _quantity = 1;

  int get quantity => _quantity;

  int _inCardItems = 0;

  int get inCardItems => _inCardItems + _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(quantity + 1);
    } else {
      _quantity = checkQuantity(quantity - 1);
    }
    update();
  }
  int checkQuantity(int quantity) {
    if ((inCardItems+quantity) < 1) {
      Get.snackbar('Attention !!!', 'Can\'t Reduce More.!',
          colorText: Colors.white,
          backgroundColor: AppColors.mainColor,
          backgroundGradient: LinearGradient(colors: [
            Colors.red.shade900,
            Colors.red,
            Colors.red.shade900,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          padding: EdgeInsets.all(Dimensions.height20),
          icon: const Icon(
            Icons.no_encryption_gmailerrorred,
            color: Colors.white,
          ));
      if(_inCardItems>0){
        quantity = -_inCardItems;
        return _quantity;
      }
      return 1;
    } else {
      return quantity;
    }
  }
  void initProduct(ProductModel product ,CartController cart) {
    _quantity = 1;
    _inCardItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCardItems = _cart.getQuantity(product);
    }  
  }
  void addItem(ProductModel product) {
    _cart.addItem(product, quantity);
    _quantity=0;
    _inCardItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
    });
    update();
  }
  int get totalItems{
    return _cart.totalItems;
  }
}