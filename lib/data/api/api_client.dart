import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/app_constant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl,required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 60);
    token =sharedPreferences.getString(AppConstants.TOKEN)??'';
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer  $token'
    };
  }


  updateHeader(String token){
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer  $token'
    };
  }

  Future<Response> getData(String uri,
      // {Map<String, String>? headers}
      ) async {
    try {
      Response response = await get(uri,
          // headers: headers?? _mainHeaders
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body,
      //    headers: _mainHeaders
      );

      return response;
    } catch (e) {
      return Response(statusCode: 2, statusText: e.toString());
    }
  }
}
