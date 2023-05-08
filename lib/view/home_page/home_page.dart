import 'package:al_waha/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart' ;
import '../account/account_page.dart';
import '../auth/src/welcomePage.dart';
import '../cart_page/cart_history.dart';
import '../notification/notification.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  List pages = [
    const MainFoodPage(),
    const NotificationScreen(),
    const CartHistory(),
    const AccountPage(),
  ];

  void onTabNev(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: pages[_selectIndex],
      bottomNavigationBar: buildAwesomeBottomNav(),
    );
  }

  AwesomeBottomNav buildAwesomeBottomNav() {
    return AwesomeBottomNav(
      icons: const [
        Icons.home_outlined,
        Icons.notifications_none_outlined,
        Icons.shopping_cart_outlined,
        Icons.account_circle_outlined,
      ],
      highlightedIcons: const [
        Icons.home,
        Icons.notifications,
        Icons.shopping_cart,
        Icons.account_circle,
      ],
      onTapped: onTabNev,
      bodyBgColor: Colors.white,
      highlightColor: AppColors.mainColor,
      navFgColor: Colors.grey.withOpacity(.8),
      navBgColor: Colors.white,

    );
  }
}
