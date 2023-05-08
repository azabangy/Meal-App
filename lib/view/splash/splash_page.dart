import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../helper/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;



  @override
  void initState(){
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds:2))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    Timer(const Duration(seconds: 5),
            () =>
        Get.offNamed(RouteHelper.getInitial()));
  }

  @override
   dispose() {
    controller.stop();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: ScaleTransition(
              scale: animation,
              child: Image.asset('assets/images/splash.png',)),
        ),
      ),
    );
  }
}
