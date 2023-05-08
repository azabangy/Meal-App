
import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/view/auth/src/signin.dart';
import 'package:al_waha/widget/app_icon.dart';
import 'package:al_waha/widget/appbar.dart';
import 'package:al_waha/widget/back_drop_filter.dart';
import 'package:al_waha/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../widget/account_widget.dart';
import 'dart:ui' as ui;

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<AuthController>(
          builder: (auth) {
            return !auth.isLoading
                ? (auth.isLogin
                    ? Scaffold(
                        backgroundColor: AppColors.buttonBackgroundColors,
                        body: Stack(
                          children: [
                            const BackgroundFilter(),
                            Column(
                              children: [
                                App_Bar(text: 'Profile'),
                                Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          print(
                                              auth.auth.currentUser?.photoURL);
                                        },
                                        child: Container(
                                          height: Dimensions.screenHeight / 5,
                                          decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      Dimensions.screenWidth)),
                                              image: DecorationImage(
                                                  image: NetworkImage(auth
                                                          .auth
                                                          .currentUser
                                                          ?.photoURL ??
                                                      'assets/images/profile.jpg'),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(.9),
                                                    blurRadius: 5,
                                                    offset: const Offset(3, 5),
                                                    blurStyle: BlurStyle.solid)
                                              ]),
                                        ),
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        AccountWidget(
                                          text: auth.auth.currentUser
                                                  ?.displayName ??
                                              '',
                                          icon: const AppIcon(
                                              icon: Icons.person_2_outlined),
                                        ),
                                        AccountWidget(
                                          text: '0101 8517 681',
                                          icon: AppIcon(
                                            icon: Icons.phone_android_outlined,
                                            backgroundColor:
                                                Colors.yellow.shade900,
                                          ),
                                        ),
                                        AccountWidget(
                                          text: auth.auth.currentUser?.email ??
                                              '',
                                          icon: AppIcon(
                                            icon: Icons.mail_outline,
                                            backgroundColor:
                                                Colors.yellow.shade900,
                                          ),
                                        ),
                                        AccountWidget(
                                          text: 'My Address',
                                          icon: AppIcon(
                                            icon: Icons.location_on_outlined,
                                            backgroundColor:
                                                Colors.yellow.shade900,
                                          ),
                                        ),
                                        AccountWidget(
                                          text: 'None',
                                          icon: AppIcon(
                                            icon: Icons.sms,
                                            backgroundColor:
                                                Colors.yellow.shade900,
                                          ),
                                        ),
                                        GestureDetector(
                                          // onTap: () {
                                          //
                                          //
                                          //
                                          //   if (Get.find<AuthController>()
                                          //       .userLoggedIn()) {
                                          //     Get.find<AuthController>()
                                          //         .clearSharedData();
                                          //     Get.find<CartController>().clear();
                                          //     Get.find<CartController>()
                                          //         .clearCartHistory();
                                          //     Get.offNamed(RouteHelper.getSignInPage());
                                          //   } else {
                                          //     Get.find<AuthController>()
                                          //         .clearSharedData();
                                          //     Get.find<CartController>().clear();
                                          //     Get.find<CartController>()
                                          //         .clearCartHistory();
                                          //     print('LOG OUT !!!!!!!!!!!!00');
                                          //   }
                                          // },
                                          //
                                          onTap: () {
                                            auth.logOut();
                                          },
                                          child: AccountWidget(
                                            text: 'Log Out',
                                            icon: const AppIcon(
                                                icon: Icons.logout_outlined),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SignInPage())
                : const CustomLoading();
          },
        ),
      ],
    );
  }
}
