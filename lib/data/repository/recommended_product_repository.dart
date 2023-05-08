
import 'package:get/get.dart';
import '../../constant/app_constant.dart';
import '../api/api_client.dart';

class RecommendedProductRepository extends GetxService{
  final ApiClient appClient;

  RecommendedProductRepository({required this.appClient});

  Future<Response> getRecommendedProductList ()async{

    return await appClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }

}