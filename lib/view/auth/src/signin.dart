import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimensions.dart';
import '../../../controller/auth_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../widget/custom_loading.dart';
import '../../../widget/text_field.dart';
import 'Widget/bezierContainer.dart';

class SignInPage extends GetWidget<AuthController> {
  SignInPage({Key? key, this.title}) : super(key: key);

  final String? title;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  // void _login(AuthController authController) {
  void snackBar(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.mainColor.withOpacity(.2),
      backgroundGradient: LinearGradient(colors: [
        Colors.red.shade900,
        Colors.red,
        Colors.red.shade900,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getInitial());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        width: double.infinity,
        child: Text('Later',
            textAlign: TextAlign.left,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: Dimensions.fontSize18,
                fontWeight: FontWeight.w200,
                color: AppColors.mainColor)),
      ),
    );
  }

  Widget _submitButton() {
    return GetBuilder<AuthController>(builder: (auth) {
      return GestureDetector(
        // onTap: (){
        //   _login(auth);
        //
        // } ,
        onTap: () {
          auth.logIn(
              emailController.text.trim(), passwordController.text.trim());
        },

        child: Container(
          width: Dimensions.screenWidth,
          padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height45),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.borderRadius15 / 2)),
            boxShadow: AppColors.shadowBottom,
            gradient: const LinearGradient(colors: [
              AppColors.mainColor,
              Colors.red,
              AppColors.mainColor,
            ]),
          ),
          child: Text(
            'Login',
            style:
                TextStyle(fontSize: Dimensions.fontSize20, color: Colors.white),
          ),
        ),
      );
    });
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: Dimensions.width20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(
            'or',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.width20,
          ),
        ],
      ),
    );
  }

  Widget _otherSignIn() {
    List<String> mediaIcons = [
      "assets/images/google.png",
      "assets/images/facebook.png",
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(mediaIcons.length, (index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              controller.googleSignIn();
            } else {
              controller.facebookSignIn();
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2),
            height: Dimensions.height45,
            width: Dimensions.height45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(mediaIcons[index]), fit: BoxFit.cover),
            ),
          ),
        );
      }),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
      padding: EdgeInsets.all(Dimensions.width20),
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
            text: 'Don\'t have account?  ',
            style: TextStyle(
              color: AppColors.paraColors,
              fontSize: Dimensions.fontSize18 / 1.30,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: '\Create',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.toNamed(RouteHelper.getSignUpPage()),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.mainColor,
                  fontSize: Dimensions.fontSize18 * .80,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
      ),
    );
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'Let\'s go..',
          style: TextStyle(
            fontSize: Dimensions.fontSize27 * 1.5,
            fontWeight: FontWeight.w300,
            color: AppColors.mainColor,
          ),
        ));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        EntryField(
          icon: Icons.email_outlined,
          labelField: 'Email',
          controller: emailController,
          isPassword: false,
        ),
        EntryField(
            icon: Icons.password_outlined,
            labelField: 'Password',
            isPassword: true,
            controller: passwordController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonBackgroundColors,
      body: GetBuilder<AuthController>(
        builder: (auth) {
// print( auth.auth.currentUser!.displayName);
          return auth.isLoading
              ? const CustomLoading()
              : Container(
                  height: Dimensions.screenHeight,
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height20),
                  child: Stack(
                    children: [
                      Positioned(
                          top: Dimensions.screenHeight * .01,
                          right: -MediaQuery.of(context).size.width * .2,
                          child: const BezierContainer()),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: Dimensions.screenHeight / 18),
                            _backButton(),
                            SizedBox(height: Dimensions.screenHeight / 13),
                            Row(
                              children: [
                                _title(),
                                Expanded(child: Container()),
                              ],
                            ),
                            SizedBox(height: Dimensions.height30),
                            _emailPasswordWidget(),
                            SizedBox(height: Dimensions.height20),
                            _submitButton(),
                            Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height20,
                                  bottom: Dimensions.height10),
                              alignment: Alignment.center,
                              child: Text('Forgot Password?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: Dimensions.fontSize18 * .8,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.mainColor)),
                            ),
                            _divider(),
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.width20),
                              alignment: Alignment.bottomCenter,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Sign in with other method',
                                  style: TextStyle(
                                    color: AppColors.paraColors,
                                    fontSize: Dimensions.fontSize18 / 1.15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            _otherSignIn(),
                            SizedBox(height: Dimensions.height20 * 5.6),
                            _createAccountLabel(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
