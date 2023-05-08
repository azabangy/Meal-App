// import 'package:al_waha/model/sign_up_model.dart';
// import 'package:get/get.dart';
// import '../data/repository/auth_repository.dart';
// import '../model/response_model.dart';
//
// class AuthControllerBackEnd extends GetxController implements GetxService {
//   AuthRepository authRepository;
//
//   AuthControllerBackEnd({required this.authRepository});
//
//   bool _isLoading = false;
//   late bool isAble;
//   bool get isLoading => _isLoading;
//
//   void isAvailable(bool available){
//     isAble = available;
//     update();
//   }
//
//   Future<ResponseModel> registration(SignUpModel signUpModel) async {
//     _isLoading = true;
//     update();
//     Response response = await authRepository.registration(signUpModel);
//     late ResponseModel responseModel;
//     if (response.statusCode == 200) {
//       authRepository.saveUserToken(response.body['token']);
//       responseModel = ResponseModel(true, response.body['token']);
//     } else {
//       responseModel = ResponseModel(false, response.statusText!);
//     }
//     _isLoading = false;
//     update();
//     return responseModel;
//   }
//
//   Future<ResponseModel> login(String number, String password) async {
//     _isLoading = true;
//     update();
//     Response response = await authRepository.login(number, password);
//     late ResponseModel responseModel;
//     if (response.statusCode == 200) {
//       authRepository.saveUserToken(response.body['token']);
//       responseModel = ResponseModel(true, response.body['token']);
//     } else {
//       responseModel = ResponseModel(false, response.statusText!);
//     }
//     _isLoading = false;
//     update();
//     return responseModel;
//   }
//
//   void saveUserNumberAndPassword(String number, String password) async {
//     authRepository.saveUserNumberAndPassword(number, password);
//   }
//
//   bool userLoggedIn() {
//     return authRepository.userLoggedIn();
//   }
//
//   bool clearSharedData() {
//     return authRepository.clearSharedData();
//   }
// }
