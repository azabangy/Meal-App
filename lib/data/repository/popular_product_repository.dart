
import 'package:get/get.dart';

import '../../constant/app_constant.dart';
import '../api/api_client.dart';

class PopularProductRepository extends GetxService{
  final ApiClient appClient;

  PopularProductRepository({required this.appClient});

  Future<Response> getPopularProductList ()async{

    return await appClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }

}