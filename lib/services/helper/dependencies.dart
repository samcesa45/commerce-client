import 'package:get/get.dart';
import 'package:gx_tutorial/constants/app_constant.dart';
import 'package:gx_tutorial/controllers/auth_controller.dart';
import 'package:gx_tutorial/controllers/user_controller.dart';
import 'package:gx_tutorial/services/api/api_client.dart';
import 'package:gx_tutorial/services/repositories/auth_repo.dart';
import 'package:gx_tutorial/services/repositories/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //load the apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => sharedPreferences);
  //Load the repositories

  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //load the controllers
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
