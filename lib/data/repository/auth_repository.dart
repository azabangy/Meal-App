import 'package:al_waha/data/api/api_client.dart';
import 'package:al_waha/model/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_constant.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URL, signUpModel.toJson());
  }

  Future<Response> login(String email,String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URL,{"email":email,"password":password});
  }

  Future<String> getUserToke() async {
    return await sharedPreferences.getString(AppConstants.TOKEN)??'NO TOKEN' ;
  }

  bool userLoggedIn()  {
    return  sharedPreferences.containsKey(AppConstants.TOKEN) ;
  }

  Future<bool> saveUserToken(String token) {
    // apiClient.token = token;
    // apiClient.updateHeader(token);
    return sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number,String password) async{
    try{
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token='';
    apiClient.updateHeader('');
    return true;
  }
}
