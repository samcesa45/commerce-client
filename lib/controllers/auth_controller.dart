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

  Future<ResponseModel> passwordRequestReset(String email) async {
    isLoading.value = true;
    late ResponseModel responseModel;

    Response response = await authRepo.passwordRequestReset(email);
    if (response.statusCode == 200) {
      var bodyMessage = response.body['message'];
      print(bodyMessage);
      responseModel = ResponseModel(true, bodyMessage);

      await authRepo.saveUserEmail(email);

      print(responseModel);
      isLoading.value = false;
      Get.toNamed(AppRoutes.OTP_SCREEN);
      Get.snackbar('Success',
          response.body['message'] ?? 'An OTP code has been sent to your email',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = false;
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error', response.statusText!,
          snackPosition: SnackPosition.BOTTOM);
    }
    print(responseModel);
    return responseModel;
  }

  Future<ResponseModel> verifyOtp(String otp) async {
    isLoading.value = true;
    ResponseModel responseModel;

    String? email = authRepo.sharedPreferences.getString("email");
    if (email == null) {
      isLoading.value = false;
      responseModel = ResponseModel(false, "Email not found");
      Get.snackbar('Error', 'Email not found',
          snackPosition: SnackPosition.BOTTOM);
      return responseModel;
    }
    Response response = await authRepo.verifyOtp(email, otp);
    if (response.statusCode == 200) {
      var bodyMessage = response.body['message'];
      responseModel = ResponseModel(true, bodyMessage);
      isLoading.value = false;
      Get.toNamed(AppRoutes.RESET_PASSWORD_SCREEN);
      Get.snackbar('Success',
          response.body['message'] ?? 'Your Otp has been verified successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = false;
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error', response.statusText!,
          snackPosition: SnackPosition.BOTTOM);
    }

    return responseModel;
  }

  Future<ResponseModel> resetPassword(String newPassword) async {
    isLoading.value = true;
    late ResponseModel responseModel;
    String? email = authRepo.sharedPreferences.getString("email");

    if (email == null) {
      isLoading.value = false;
      responseModel = ResponseModel(false, "Email not found");
      Get.snackbar('Error', 'Email not found',
          snackPosition: SnackPosition.BOTTOM);
      return responseModel;
    }
    Response response = await authRepo.resetPassword(email,newPassword);
    if (response.statusCode == 200) {
      var bodyMessage = response.body['message'];
      responseModel = ResponseModel(true, bodyMessage);
  
      isLoading.value = false;
      await authRepo.clearUserEmail();
      Get.toNamed(AppRoutes.LOGIN_SCREEN);
      Get.snackbar('Success',
          response.body['message'] ?? 'Password has been reset successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = false;
      responseModel = ResponseModel(false, response.body['error']);
      Get.snackbar('Error', response.body['error'],
          snackPosition: SnackPosition.BOTTOM);
    }

    return responseModel;
  }
}
