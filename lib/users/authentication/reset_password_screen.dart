import 'package:flutter/material.dart';
import 'package:gx_tutorial/controllers/auth_controller.dart';
import 'package:gx_tutorial/forms/custom_button.dart';
import 'package:gx_tutorial/forms/custom_input.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

    void _PasswordReset(AuthController authController) {
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if (password.isEmpty || confirmPassword.isEmpty) {
        Get.snackbar("Error", "Email cannot be empty");
      } else if (password != confirmPassword) {
        Get.snackbar('Error', 'Password Do Not Match');
      } else {
        authController.resetPassword(password);
      }
    }

    return Scaffold(
      backgroundColor: ColorPallete.mainBgColor,
      body: GetBuilder<AuthController>(builder: (authController) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset Password',
                  style: TextStyle(
                      fontFamily: 'Circular Std',
                      fontSize: 34,
                      color: ColorPallete.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 73,
                ),
                const Center(
                    child: Image(image: AssetImage('images/lock.png'))),
                const SizedBox(
                  height: 32,
                ),
                const Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        fontFamily: 'Circular Std',
                        fontSize: 34,
                        color: ColorPallete.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  label: 'Password',
                  type: true,
                  editingController: passwordController,
                ),
                CustomInput(
                  label: 'Confirm Password',
                  type: true,
                  editingController: confirmPasswordController,
                ),
                const SizedBox(
                  height: 32,
                ),
                const SizedBox(
                  height: 55,
                ),
                Obx(() => CustomButton(
                      color: ColorPallete.errorColor,
                      content: authController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Reset Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onPressed: () => _PasswordReset(authController),
                    )),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
