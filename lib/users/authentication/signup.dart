import 'package:flutter/material.dart';
import 'package:gx_tutorial/controllers/auth_controller.dart';
import 'package:gx_tutorial/forms/custom_input.dart';
import 'package:gx_tutorial/forms/custom_button.dart';
import 'package:gx_tutorial/services/models/signup_body.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';
import 'package:get/get.dart';
import 'package:gx_tutorial/users/authentication/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var emailController = TextEditingController();

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        Get.snackbar("Error", "Name cannot be empty",
            snackPosition: SnackPosition.BOTTOM);
      } else if (email.isEmpty) {
        Get.snackbar("Error", "Email cannot be empty",
            snackPosition: SnackPosition.BOTTOM);
      } else if (password.isEmpty) {
        Get.snackbar("Error", "Password cannot be empty",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        SignupBody signUpBody = SignupBody(
          name: name,
          email: email,
          password: password,
        );

        authController.registration(signUpBody);
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
                  'Sign up',
                  style: TextStyle(
                      fontFamily: 'Circular Std',
                      fontSize: 34,
                      color: ColorPallete.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 73,
                ),
                CustomInput(
                  label: 'Name',
                  editingController: nameController,
                ),
                const SizedBox(height: 8),
                CustomInput(
                  label: 'Email',
                  editingController: emailController,
                ),
                const SizedBox(height: 8),
                CustomInput(
                  label: 'Password',
                  type: true,
                  editingController: passwordController,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorPallete.black),
                    ),
                    InkWell(
                      onTap: () => Get.to(const Login()),
                      child: const Icon(
                        Icons.arrow_right_alt,
                        color: ColorPallete.errorColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Obx(() => CustomButton(
                  color: ColorPallete.errorColor,
                    content: authController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text(
                            'SIGNUP',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    onPressed: () => _registration(authController))),
                const SizedBox(
                  height: 194,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or signup with social account',
                      style:
                          TextStyle(fontFamily: 'Circular Std', fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 12),
                      alignment: Alignment.center,
                      width: 92,
                      height: 64,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child:
                          const Image(image: AssetImage('images/google.png')),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 12),
                      alignment: Alignment.center,
                      width: 92,
                      height: 64,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child:
                          const Image(image: AssetImage('images/facebook.png')),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}




// Text(
//           text.toUpperCase(),
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.white,
//             fontFamily: 'Circular Std',
//             fontWeight: FontWeight.w600,
//           ),