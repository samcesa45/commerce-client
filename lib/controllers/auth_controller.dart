import 'package:get/get.dart';
import 'package:gx_tutorial/app_routes.dart';
import 'package:gx_tutorial/services/models/response_model.dart';
import 'package:gx_tutorial/services/models/signup_body.dart';
import 'package:gx_tutorial/services/repositories/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  var isLoading = false.obs;
  // bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignupBody signUpBody) async {
    isLoading.value = true;
    late ResponseModel responseModel;
    Response response = await authRepo.registration(signUpBody);
    if (response.statusCode == 200) {
      var bodyToken = response.body["token"];
      authRepo.saveUserToken(bodyToken);
      responseModel = ResponseModel(true, bodyToken);
      isLoading.value = false;
      print('Registration successful, navigating to login screen.');
      Get.toNamed(AppRoutes.LOGIN_SCREEN);
      Get.snackbar('Success', response.statusText ?? 'Registration successful',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = false;
      responseModel =
          ResponseModel(false, response.statusText ?? 'An error occurred');
      Get.snackbar('Error', response.statusText ?? 'An error occurred',
          snackPosition: SnackPosition.BOTTOM);
    }
    // isLoading.value = true;
    update();
    return responseModel;
  }

  void saveUserEmailAndPassword(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  Future<ResponseModel> login(String email, String password) async {
    isLoading.value = true;
    late ResponseModel responseModel;

    Response response = await authRepo.login(email, password);
    if (response.statusCode == 200) {
      var bodyToken = response.body["token"];
      authRepo.saveUserToken(bodyToken);
      responseModel = ResponseModel(true, bodyToken);
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.HOME_SCREEN);
      Get.snackbar('Success', response.statusText ?? 'Login Successful',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = false;
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error', response.statusText!,
          snackPosition: SnackPosition.BOTTOM);
    }
    // isLoading.value = true;
    update();
    print('login controller');
    return responseModel;
  }

  Future<ResponseModel> passwordRequestReset(String email) async{
    isLoading.value = true;
    late ResponseModel responseModel;

    Response response = await authRepo.passwordRequestReset(email);
    if(response.statusCode == 200) {
      var bodyToken =response.body['token'];
      authRepo.saveUserToken(bodyToken);
      responseModel = ResponseModel(true, bodyToken);
      print(responseModel);
      isLoading.value = false;
      Get.snackbar('Success', response.statusText ?? 'An Email link as been sent',
          snackPosition: SnackPosition.BOTTOM);

    }else {
      isLoading.value = false;
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error', response.statusText!,
          snackPosition: SnackPosition.BOTTOM);
    }
    print(responseModel);
    return responseModel;
  }
}
