import 'package:get/get.dart';

class CustomInputController extends GetxController {
  var isPasswordVisible = false.obs;
  var isEmailValid = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void validateEmail(String value) {
    const emailPattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regExp = RegExp(emailPattern);

    if (regExp.hasMatch(value)) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
    }
  }
}
