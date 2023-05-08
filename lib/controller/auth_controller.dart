import 'package:al_waha/helper/route_helper.dart';
import 'package:al_waha/view/auth/src/welcomePage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/auth/src/signup.dart';

class AuthController extends GetxController implements GetxService {
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignInAcc = GoogleSignIn(scopes: ['email']);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // Our user would be notified
    _user.bindStream(auth.userChanges());
   ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(RouteHelper.getSignInPage());
    } else {
      _isLogin = true;
      Get.offAllNamed(RouteHelper.getInitial());
    }
  }

  void register(String email, String password) async {
    try {
      _isLoading = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _isLogin = true;
      _isLoading = false;
      update();
    } catch (e) {
      SignUpPage.snackBar('Register Error', e.toString());
    }
  }

  void logIn(String email, String password) async {
    try {
      _isLoading = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _isLogin = true;
      _isLoading = false;
      update();
    } catch (e) {
      _isLoading = false;
      SignUpPage.snackBar('Login Error', e.toString());
    }
  }

  void logOut() async {
    _isLogin = false;
    _isLoading = true;
    update();
    await Future.wait([
      auth.signOut(),
      googleSignInAcc.signOut(),
    ]);
    _isLoading = false;
    update();
  }

  Future<void> googleSignIn() async {
    try {
      _isLoading = true;
      update();
      final GoogleSignInAccount? googleUser = await googleSignInAcc.signIn();
      if (googleUser == null) {
        return;
      }
      print('name is ${auth.currentUser?.displayName}');
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      _isLogin = true;
      _isLoading = false;
      update();
      Get.offAllNamed(RouteHelper.getInitial());
      print(await auth.signInWithCredential(credential));
    } catch (e) {
      _isLoading = false;
      update();
      Get.offAllNamed(RouteHelper.getSignInPage());
      SignUpPage.snackBar('failed google sign in', e.toString());
    }
  }

  facebookSignIn() async {
    try {
      _isLoading = true;
      update();

      final LoginResult loginResult =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);

      if (loginResult == null) {
        return;
      }
      print('name is ${auth.currentUser?.displayName}');

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      _isLoading = false;
      update();
      Get.offAllNamed(RouteHelper.getInitial());
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print('errorrrrrr          $e');
      _isLoading = false;
      update();
      Get.offAllNamed(RouteHelper.getSignInPage());
      SignUpPage.snackBar('failed facebook sign in', e.toString());
    }
  }
}
