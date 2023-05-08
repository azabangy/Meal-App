import 'package:al_waha/controller/auth_controller_backend.dart';
import 'package:al_waha/data/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_constant.dart';
import '../controller/auth_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';
import '../controller/user_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/cart_repository.dart';
import '../data/repository/popular_product_repository.dart';
import '../data/repository/recommended_product_repository.dart';
import '../data/repository/user_repository.dart';
import '../firebase_options.dart';

Future<void> init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,)
      .then((value) => Get.put(AuthController));
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  Get.lazyPut(() => AuthController());
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthController());
  Get.find<AuthController>().listeners;

  // Get.lazyPut(() => AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => UserRepository(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductRepository(appClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepository(appClient: Get.find()));
  Get.lazyPut(() => CartRepository(sharedPreferences: Get.find()));

  // Get.lazyPut(() => AuthController(authRepository: Get.find()));
  // Get.lazyPut(() => UserController(userRepository: Get.find()));
  Get.lazyPut(
      () => PopularProductController(popularProductRepository: Get.find()));
  Get.lazyPut(() =>
      RecommendedProductController(recommendedProductRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));

  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
  Get.find<CartController>().getCartData();
}
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  if (kDebugMode) {
    print(message.messageId);
  }
}