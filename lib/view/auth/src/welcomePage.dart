import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/view/auth/src/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/dimensions.dart';
import '../../../helper/route_helper.dart';
import 'signin.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Get.to(() => SignInPage());
      },
      child: Container(
        width: Dimensions.screenWidth,
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppColors.mainColor.withAlpha(100),
                  offset: const Offset(0, 10),
                  blurRadius: 8,
                  spreadRadius: 2),
              BoxShadow(
                  color: Colors.grey.withAlpha(100),
                  offset: const Offset(10, 0),
                  blurRadius: 8,
                  spreadRadius: 2),
              BoxShadow(
                  color: Colors.grey.withAlpha(100),
                  offset: const Offset(0, -10),
                  blurRadius: 8,
                  spreadRadius: 2),
              BoxShadow(
                  color: Colors.grey.withAlpha(100),
                  offset: const Offset(-10, 0),
                  blurRadius: 8,
                  spreadRadius: 2),
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: Dimensions.fontSize20 * 1.2,
              color: AppColors.mainColor),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getSignUpPage());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: AppColors.shadowBottom,
          gradient: const LinearGradient(colors: [
            AppColors.mainColor,
            Colors.red,
            AppColors.mainColor,
          ]),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: const Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            const Text(
              'Quick login with Touch ID',
              style: TextStyle(color: AppColors.mainColor, fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint,
                size: Dimensions.iconsSize * 9, color: AppColors.mainColor),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Touch ID',
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'F',
          style: TextStyle(
            fontSize: Dimensions.fontSize27 * 2,
            fontWeight: FontWeight.w900,
            color: AppColors.mainColor,
          ),
          children: [
            TextSpan(
              text: 'oo',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: Dimensions.fontSize27 * 2.5),
            ),
            TextSpan(
              text: 'd',
              style: TextStyle(
                  color: Colors.black, fontSize: Dimensions.fontSize27 * 2),
            ),
            TextSpan(
              text: 'De',
              style: TextStyle(
                  color: Colors.black, fontSize: Dimensions.fontSize27 * 2),
            ),
            TextSpan(
              text: 'live',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: Dimensions.fontSize27 * 2),
            ),
            TextSpan(
              text: 'ry',
              style: TextStyle(
                  color: Colors.black, fontSize: Dimensions.fontSize27 * 2),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2),
          height: Dimensions.screenHeight,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.buttonBackgroundColors),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: Dimensions.screenHeight / 12,
              ),
              _submitButton(),
              SizedBox(
                height: Dimensions.height30,
              ),
              _signUpButton(),
              SizedBox(
                height: Dimensions.height10,
              ),
              _label()
            ],
          ),
        ),
      ),
    );
  }
}
