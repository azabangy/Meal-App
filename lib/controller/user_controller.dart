// import 'package:al_waha/model/sign_up_model.dart';
// import 'package:al_waha/model/user_model.dart';
// import 'package:get/get.dart';
// import '../data/repository/user_repository.dart';
// import '../model/response_model.dart';
//
// class UserController extends GetxController implements GetxService {
//   UserRepository userRepository;
//
//   UserController({required this.userRepository});
//   bool _isLoading = false;
//   late UserModel _userModel;
//
//   bool get isLoading => _isLoading;
//   UserModel get userModel => _userModel;
//
//   Future<ResponseModel> getUserInfo() async {
//     Response response = await userRepository.getUserInfo();
//     late ResponseModel responseModel;
//     if (response.statusCode == 200) {
//       _isLoading = true;
//       _userModel =UserModel.fromJson(response.body);
//       responseModel = ResponseModel(true, 'Successfully');
//     } else {
//       responseModel = ResponseModel(false, response.statusText!);
//
//     }
//     _isLoading = false;
//     update();
//     return responseModel;
//   }
//
//
//
//
//
// }
