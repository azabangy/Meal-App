import 'package:al_waha/view/auth/src/signin.dart';
import 'package:al_waha/view/auth/src/signup.dart';
import 'package:al_waha/view/cart_page/cart_history.dart';
import 'package:al_waha/view/popular_food_details/popular_food_details_page.dart';
import 'package:al_waha/view/recommended_food_details/recommended_food_details_page.dart';
import 'package:get/get.dart';

import '../view/cart_page/cart_page.dart';
import '../view/home_page/home_page.dart';
import '../view/splash/splash_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String historyPage = "/history-page";
  static const String signUpPage = "/sign-up-page";
  static const String signInPage = "/sign-in-page";



  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>"$recommendedFood?pageId=$pageId";
  static String getCartPage() => cartPage;
  static String getHistoryPage() => historyPage;
  static String getSignUpPage() => signUpPage;
  static String getSignInPage() => signInPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const HomePage(),transition: Transition.circularReveal),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetails(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: historyPage,
        page: () {
          return const CartHistory();
        },
        transition: Transition.fadeIn),


    GetPage(
        name: signUpPage,
        page: () {
          return  SignUpPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signInPage,
        page: () {
          return  SignInPage();
        },
        transition: Transition.fadeIn),

  ];
}
