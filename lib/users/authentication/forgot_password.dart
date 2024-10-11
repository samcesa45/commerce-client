import 'package:flutter/material.dart';
import 'package:gx_tutorial/controllers/auth_controller.dart';
import 'package:gx_tutorial/forms/custom_input.dart';
import 'package:gx_tutorial/forms/custom_button.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    void _requestPasswordReset(AuthController authController) {
      String email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar("Error", "Email cannot be empty");
      } else {
        authController.passwordRequestReset(email);
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
                  'Forgot password',
                  style: TextStyle(
                      fontFamily: 'Circular Std',
                      fontSize: 34,
                      color: ColorPallete.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 73,
                ),
                const Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                      color: ColorPallete.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Circular Std'),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  label: 'Email',
                  editingController: emailController,
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
                              'SEND',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onPressed: () => _requestPasswordReset(authController),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
