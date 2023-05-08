

import 'package:al_waha/constant/app_constant.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class UserRepository{
  final ApiClient apiClient;

  UserRepository({required this.apiClient});
  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.USER_INFO_URL);
  }
}