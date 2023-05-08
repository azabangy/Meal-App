import 'package:al_waha/constant/colors.dart';
import 'package:al_waha/constant/dimensions.dart';
import 'package:al_waha/helper/route_helper.dart';
import 'package:al_waha/model/sign_up_model.dart';
import 'package:al_waha/view/auth/src/signin.dart';
import 'package:al_waha/widget/big_text.dart';
import 'package:al_waha/widget/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/auth_controller_backend.dart';
import '../../../widget/custom_loading.dart';
import '../../../widget/text_field.dart';
import 'Widget/bezierContainer.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;
  static void snackBar(String title, String message,) {
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


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  // var usernameController = TextEditingController();
  // var phoneController = TextEditingController();
  List<String> mediaIcons = [
    "assets/images/facebook.png",
    "assets/images/google.png",
  ];

  void snackBar(String title, String message,) {
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

  // void _registration() {
  //   var authController = Get.find<AuthControllerBackEnd>();
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   String name = usernameController.text.trim();
  //   String phone = phoneController.text.trim();
  //
  //   if (email.isEmpty) {
  //     snackBar('Email', 'Type in your email address');
  //   } else if (!GetUtils.isEmail(email)||!GetUtils.isPhoneNumber(email)) {
  //     snackBar('Email', 'Please, Type a correct email address or Phone number');
  //   } else if (password.isEmpty) {
  //     snackBar('Password', 'Type in your password');
  //   } else if (password.length < 6) {
  //     snackBar('Password', 'Password should at least 6 character or number');
  //   } else if (name.isEmpty) {
  //     snackBar('User Name', 'Type in your name');
  //   } else if (!GetUtils.isPhoneNumber(phone)) {
  //     snackBar('Phone Number', 'Please, Type a correct phone number');
  //   } else {
  //     snackBar('Success register', 'All is done');
  //     SignUpModel signUpModel = SignUpModel(
  //         email: email,
  //         password: password,
  //         name: name,
  //         phone: phone);
  //     authController.registration(signUpModel).then((status) {
  //       if (status.isSuccess) {
  //         print('SUCCESS registration');
  //         Get.offNamed(RouteHelper.getInitial());
  //       }
  //       else{
  //         snackBar('ERROR register', status.message);
  //
  //       }
  //     });
  //   }
  //
  // }

  // void isAvailable(){
  //   var authController = Get.find<AuthController>();
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   // String name = usernameController.text.trim();
  //   // String phone = phoneController.text.trim();
  //   if (email.isNotEmpty&&password.isNotEmpty&&name.isNotEmpty&&phone.isNotEmpty) {
  //     authController.isAvailable(true);
  //   }
  //   authController.isAvailable(false);
  // }


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

  Widget _submitButton() {
     return GetBuilder<AuthController>(
       builder: (auth){
         return GestureDetector(
           onTap: () {
             auth.register(email.text.trim(), password.text.trim());
             // _registration();
           },
           child:  Container(
             width: Dimensions.screenWidth,
             padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
             margin: EdgeInsets.symmetric(horizontal: Dimensions.height45),
             alignment: Alignment.center,
             decoration:  BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(Dimensions.borderRadius15)),
               boxShadow: AppColors.shadowBottom,
               gradient:
               const LinearGradient(  colors: [
                 AppColors.mainColor,
                 Colors.red,
                 AppColors.mainColor,
               ]) ,
             ),
             child:  Text(
               'Register',
               style: TextStyle(fontSize: Dimensions.fontSize20, color: Colors.white),
             ),
           ),


         );
       },
     );
  }

  Widget _otherSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(mediaIcons.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2),
          height: Dimensions.height45,
          width: Dimensions.height45,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(mediaIcons[index]), fit: BoxFit.cover),
          ),
        );
      }),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
      padding: EdgeInsets.all(Dimensions.width20),
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
            text: 'Already have an account?  ',
            style: TextStyle(
              color: AppColors.paraColors,
              fontSize: Dimensions.fontSize18 / 1.30,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                  text: 'Sign In',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(RouteHelper.getSignInPage()),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.mainColor,
                    fontSize: Dimensions.fontSize18 * .80,
                    fontWeight: FontWeight.w700,
                  )),
            ]),
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'Already have an account ?',
      //       style: TextStyle(fontSize:Dimensions.fontSize18/1.45, fontWeight: FontWeight.w700),
      //     ),
      //     SizedBox(
      //       width: Dimensions.width10,
      //     ),
      //     Text(
      //       'Sign In',
      //       style: TextStyle(
      //           color: AppColors.mainColor,
      //           fontSize: Dimensions.fontSize18*.80,
      //           fontWeight: FontWeight.w700,),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'Welcome',
          style: TextStyle(
            fontSize: Dimensions.fontSize27 * 1.6,
            fontWeight: FontWeight.w300,
            color: AppColors.mainColor,
          ),
        ));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        EntryField(
            isPassword: false,
            icon: Icons.email_outlined,
            labelField: 'Email',
            controller: email),
        EntryField(
            icon: Icons.password_outlined,
            labelField: 'Password',
            isPassword: true,
            controller: password),
        // EntryField(
        //     isPassword: false,
        //     icon: Icons.person_outline_outlined,
        //     labelField: 'Username',
        //     controller: usernameController),
        // EntryField(
        //     isPassword: false,
        //     icon: Icons.phone_iphone_outlined,
        //     labelField: 'Phone number',
        //     controller: phoneController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonBackgroundColors,
      body: GetBuilder<AuthController>(
        builder: (auth){
          return auth.isLoading?const CustomLoading(): SizedBox(
            height: Dimensions.screenHeight,
            child: Stack(
              children: [
                Positioned(
                  top: Dimensions.screenHeight * .3,
                  right: Dimensions.screenWidth * .57,
                  child: const BezierContainer(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20 ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: Dimensions.screenHeight / 18),
                        _backButton(),
                        SizedBox(height: Dimensions.screenHeight / 25),
                        _title(),
                        SizedBox(
                          height: Dimensions.height20 * 1.5,
                        ),
                        _emailPasswordWidget(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        _submitButton(),
                        SizedBox(height: Dimensions.height20),
                        _divider(),
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.width20),
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              text: 'Sign up with other method',
                              style: TextStyle(
                                color: AppColors.paraColors,
                                fontSize: Dimensions.fontSize18 / 1.15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        _otherSignUp(),
                        SizedBox(height: Dimensions.height20),
                        _loginAccountLabel(),
                      ],
                    ),
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
