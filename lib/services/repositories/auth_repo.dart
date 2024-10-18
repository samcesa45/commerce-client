import 'package:get/get.dart';
import 'package:gx_tutorial/constants/app_constant.dart';
import 'package:gx_tutorial/services/api/api_client.dart';
import 'package:gx_tutorial/services/models/signup_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignupBody signUpBody) async {
    return await apiClient.sendData(
        AppConstant.REGISTRATION_URL, signUpBody.toJson());
  }

  Future<Response> login(String email, String password) async {
    print('login repo');
    return await apiClient.sendData(
        AppConstant.LOGIN_URI, {"email": email, "password": password});
  }

  Future<Response> passwordRequestReset(String email) async {
    print('request email repo');
    return await apiClient
        .sendData(AppConstant.REQUEST_PASSWORD_RESET, {"email": email});
  }
  Future<Response> verifyOtp(String email,String otp) async {
    print('request otp repo');
    return await apiClient
        .sendData(AppConstant.VERIFY_OTP, {"email":email,"otp": otp});
  }

  Future<Response> resetPassword(String email,String newPassword) async {
    print('password reset repo');
    return await apiClient.sendData(AppConstant.RESET_PASSWORD,{"email":email,"newPassword": newPassword});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString("email", email);
      await sharedPreferences.setString("pass", password);
    } catch (e) {
      print("$e");
    }
  }

  Future<void> saveUserEmail(String email) async {
    try {
      await sharedPreferences.setString("email", email);
    } catch (e) {
      print("$e");
    }
  }

  Future<void> clearUserEmail() async {
    await sharedPreferences.remove("email");
  }
}
